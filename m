From: Clifford Kite <kite_linux-ppp@ev1.net>
Date: Thu, 16 Sep 2004 18:38:48 +0000
Subject: Re: no ppp-link
Message-Id: <Pine.LNX.4.21.0409161240100.14999-100000@corncob.localhost.tld>
List-Id: <linux-ppp.vger.kernel.org>
References: <OF2DE58F2A.8E19EA8C-ONC1256F11.005437DB@bln.d-trust.de>
In-Reply-To: <OF2DE58F2A.8E19EA8C-ONC1256F11.005437DB@bln.d-trust.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On Thu, 16 Sep 2004 p.boehm@d-trust.net wrote:

|Hi, I try to set up a ppp link of course, but if I use pppd or diald or
|wvdial or somethings else: never a ppp-device is created.
|
|     /* command-line to set up a ppp-link ... */
|     # pppd -d call isp
|
|     /* content of /etc/ppp/peers/isp */
|     ttyS0 19200 crtscts
|     connect '/usr/sbin/chat -v -f /etc/ppp/chat-isp'
|
|     /* content of /etc/ppp/chat-isp */
|     ABORT "NO CARRIER"
|     ABORT "NO DIALTONE"
|     ABORT "ERROR"
|     ABORT "NO ANSWER"
|     ABORT "Username/Password Incorrect"
|     "" "at"
|     OK "at&d0&c1"
|     OK "atdt0172229000"
|     "name:" "^Ua"
|     "word:" "\qa"
|     "ispts" "\q^Uppp"
|     "~-^Uppp-~"

What purpose are the preceding 4 lines supposed to serve?  They don't
make much sense to me.  The ^U, interpreted as a control-character,
is a form-feed!  Do you KNOW that these lines are appropriate?

|Connection is established, but data will not routed to ppp-device,
|because it not exists...

The serial connection may be established but not the PPP link.

|I thought (and I still thinking that) it's a problem in configuration
|(kernel, pppd, network config-files) So I read documentations, man pages,
|messageboards in INet and all other stuff I could get. But nothing helps.
|And the problem is always the same. No PPP-Device!

The last time you asked for help here the log looked to me as if the ISP
started PPP immediately but you were setup to do login/password (as you
again seem to be trying to do above).  If the ISP starts PPP negotiations
immediately then it wants to authenticate you as a valid customer during
those negotiations, usually with a PAP or CHAP authentication protocol,
NOT with login/password.

|pb
|
|(If someone needs config files or somethings else for analyzing the
|problem feel free to ask me!)

Replace everything in the /etc/ppp/chat-isp file with this:

"" AT&F
OK ATDT0172229000
CONNECT \d\c

You can put whatever ABORTs you want after you are able to establish the
PPP link.  If the modem is a USR Sportster then use AT&F1 instead of AT&F.

Configure each of /etc/ppp/{pap,chap}-secrets with this line

  Your_ISP_username    *    Your_ISP_password

and add the pppd option

  user Your_ISP_username

to /etc/ppp/peers/isp, using the obvious substitutions.

Use the recipe in my signature and post the contents of ppp-debug.log
if the PPP link is still not established.  Do not hand-copy the contents.
Since you have the (deprecated) -d pppd option and the chat -v option
the log should show what's going on.

---
Clifford Kite                                 http://ckite.no-ip.net
/* Recipe for a unified PPP debug log file:  Add the line
   " local2.*;*.=DEbug;*.=3Dnotice	/var/log/ppp-debug.log "
   (may need Tab separators) to the /etc/syslog.conf file, and then do
   " kill -HUP `pidof syslogd` " to make syslogd reread it. */



