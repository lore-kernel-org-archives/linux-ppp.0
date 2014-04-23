From: Aleksander Morgado <aleksander@aleksander.es>
Date: Wed, 23 Apr 2014 11:19:24 +0000
Subject: pppd: CLOCAL not re-set upon disconnection
Message-Id: <5357A1BC.8010609@aleksander.es>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------000201090907090701010902"
List-Id: <linux-ppp.vger.kernel.org>
To: linux-ppp@vger.kernel.org

This is a multi-part message in MIME format.
--------------000201090907090701010902
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hey,

If no disconnection script provided and pppd being halted with SIGTERM,
CLOCAL is not re-set during disconnect_tty(). This leads to some nasty
race conditions during disconnection of mobile broadband modems in
NetworkManager/ModemManager.

Possible fix attached; which seems to solve the race conditions I'm
seeing in a slow ARM machine.

Some more background....

pppd will by default unset CLOCAL in the tty termios when connected, in
order to use modem control lines. But when pppd is stopped with SIGTERM,
CLOCAL is not being reset in the tty.

NetworkManager and ModemManager use pppd to setup the mobile broadband
modem connections. Once MM sets the tty in connected mode, NM launches
pppd in the tty and the session is established. When the user requests
to stop the connection, NM sends a SIGTERM to pppd to get disconnected.
Once pppd performs its own disconnection sequence it exits, and once
pppd exits, NM will tell MM to handle the disconnection.

Now, if pppd doesn't re-set CLOCAL before exiting, there will be some
time (between pppd exit and MM re-setting CLOCAL) where CLOCAL is unset
and modem control lines are in effect. If the kernel gets the DCD input
control line to low during that time, it may end up launching a full
hungup of the device, see Linux kernel's cdc-acm driver snippet:

case USB_CDC_NOTIFY_SERIAL_STATE:
    newctrl = get_unaligned_le16(data);

    if (!acm->clocal && (acm->ctrlin & ~newctrl & ACM_CTRL_DCD)) {
        dev_dbg(&acm->control->dev, "%s - calling hangup\n", __func__);
        tty_port_tty_hangup(&acm->port, false);
    }

So, rather than exiting with CLOCAL unset, make sure it is always
re-set. It currently was only being re-set in non-hungup cases if there
was a disconnection script provided.

Is this the correct approach to solve the issue? Or am I missing something?

One note regarding the patch.... I left the:
    stop_charshunt(NULL, 0);
call also to be run only if disconnect_script != NULL, not sure if that
should also be changed so that it is executed regardless of whether we
have a disconnect script or not.

Cheers!

-- 
Aleksander

--------------000201090907090701010902
Content-Type: text/x-patch;
 name="0001-pppd-ensure-CLOCAL-is-re-set-upon-disconnection.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-pppd-ensure-CLOCAL-is-re-set-upon-disconnection.patch"

From feaca02edf036ae8b452459b36835aa0edeb7f10 Mon Sep 17 00:00:00 2001
From: Aleksander Morgado <aleksander@aleksander.es>
Date: Wed, 23 Apr 2014 11:51:35 +0200
Subject: [PATCH] pppd: ensure CLOCAL is re-set upon disconnection

pppd will by default unset CLOCAL in the tty termios when connected, in order to
use modem control lines. But when pppd is stopped with SIGTERM, CLOCAL is not
being re-set in the tty.

Some background...

NetworkManager and ModemManager use pppd to setup the mobile broadband modem
connections. Once MM sets the tty in connected mode, NM launches pppd in the tty
and the session is established. When the user requests to stop the connection,
NM sends a SIGTERM to pppd to get disconnected. Once pppd performs its own
disconnection sequence it exits, and once pppd exits, NM will tell MM to handle
the disconnection.

Now, if pppd doesn't re-set CLOCAL before exiting, there will be some time
(between pppd exit and MM re-setting CLOCAL) where CLOCAL is unset and modem
control lines are in effect. If the kernel gets the DCD input control line
to low during that time, it may end up launching a full hungup of the device,
see Linux kernel's cdc-acm driver snippet:

case USB_CDC_NOTIFY_SERIAL_STATE:
    newctrl = get_unaligned_le16(data);

    if (!acm->clocal && (acm->ctrlin & ~newctrl & ACM_CTRL_DCD)) {
        dev_dbg(&acm->control->dev, "%s - calling hangup\n", __func__);
        tty_port_tty_hangup(&acm->port, false);
    }

So, rather than exiting with CLOCAL unset, make sure it is always re-set. It
currently was only being re-set in non-hungup cases if there was a
disconnection script provided.
---
 pppd/tty.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/pppd/tty.c b/pppd/tty.c
index d571b11..67d3b85 100644
--- a/pppd/tty.c
+++ b/pppd/tty.c
@@ -771,10 +771,13 @@ int connect_tty()
 
 void disconnect_tty()
 {
-	if (disconnect_script == NULL || hungup)
+	if (hungup)
 		return;
 	if (real_ttyfd >= 0)
 		set_up_tty(real_ttyfd, 1);
+
+	if (disconnect_script == NULL)
+		return;
 	if (device_script(disconnect_script, ttyfd, ttyfd, 0) < 0) {
 		warn("disconnect script failed");
 	} else {
-- 
1.9.2


--------------000201090907090701010902--
