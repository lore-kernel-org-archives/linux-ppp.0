From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Tue, 13 Apr 2004 13:02:22 +0000
Subject: PPP connect hangs at "getlogname (AUTO_PPP), read:"
Message-Id: <Pine.LNX.4.58.0404130851580.8284@localhost.localdomain>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


  as an initial attempt to configure PPP as simply as possible, i set up
both the client and the server on my laptop, dialing out thru /dev/ttyS0
connected to an external USR modem, thru a teltone telephone line
emulator, and from there back into a xircom pcmcia modem which is
associated with /dev/ttyS3.  no problem, everything worked fine, resulting
in my laptop having, of course, both a ppp0 and ppp1 interface added to 
it, being both the client and the server at the same time.  (yes, it's 
incestuous, but it's a convenient way to test both sides of the 
connection.)

  having verified that the server side worked, i then set up a small
embedded linux system we have here as the client, installed all of the 
essential client-side stuff on it, and dialed out as before, again thru
the teltone box.

  i tracked the server-side log file /var/log/mgetty.log.ttyS3, and what i 
saw was:

... snip ...
wfr: waiting for ``RING''
04/13 08:51:13 yS3   got: [0a][0d][0a]RING[0d]
04/13 08:51:13 yS3   wfr: rc=0, drn=0
04/13 08:51:13 yS3  send: ATA[0d]
04/13 08:51:13 yS3  waiting for ``CONNECT''
04/13 08:51:13 yS3   got: ATA[0d][0d][0a]CONNECT ** found **
04/13 08:51:27 yS3  send:
04/13 08:51:27 yS3  waiting for ``_''
04/13 08:51:27 yS3   got:  38400[0d][0a] ** found **
04/13 08:51:27 yS3   waiting for line to clear (VTIME), read:
04/13 08:51:27 yS3   utmp + wtmp entry made
04/13 08:51:28 yS3   tio_set_flow_control( HARD )
04/13 08:51:28 yS3   print welcome banner (/etc/issue)
04/13 08:51:28 yS3   getlogname (AUTO_PPP), read:


  and that's where it hung.  i used the equivalent files and chat scripts 
on the embedded system as i did on my laptop, so i'm puzzled why the PPP
negotiation that worked before is hanging now.

  my login.config file contains:

/AutoPPP/ -     a_ppp   /usr/sbin/pppd -chap -pap debug

and i can supply the chat scripts if necessary, but i was hoping that 
someone would know offhand the reason for the hanging at that point in the
process.    what does that call to "getlogname" represent?  i'm not using
any authentication, so i'm not clear on what i'm supposed to be looking 
for at that point.

rday
