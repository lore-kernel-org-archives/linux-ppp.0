From: md@Linux.IT (Marco d'Itri)
Date: Wed, 04 May 2005 09:50:17 +0000
Subject: persist + tty is broken in 2.4.3
Message-Id: <20050504095017.GA7882@wonderland.linux.it>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Multiple users reported (Debian bugs #306820, #276550 and private
reports) that ppp 2.4.3 breaks the persist option when used with a modem
connection (I cannot reproduce the bug with my PPPoATM connection and I
only received reports from modem users).
I believe that this may be related to the multilink changes, because
CVS 20040428 still works.
Any help is welcome, because I do not know how to debug this.

These are the common failure modes:

Apr 23 11:18:07 saturn pppd[2233]: Connection terminated.
Apr 23 11:18:07 saturn pppd[2233]: tcflush failed: Bad file descriptor
Apr 23 11:18:07 saturn pppd[2233]: Modem hangup
Apr 23 11:18:17 saturn pppd[2233]: tcsetattr: Invalid argument (line 964)
Apr 23 11:18:18 saturn pppd[2233]: tcsetattr: Invalid argument (line 1003)
Apr 23 11:18:18 saturn pppd[2233]: Exit.

May  2 09:31:14 shed pppd[8131]: Starting link
May  2 09:31:14 shed pppd[8131]: tcgetattr: No such device or address (line 909)
May  2 09:31:15 shed pppd[8131]: tcsetattr: No such device or address (line 1003)
May  2 09:31:15 shed pppd[8131]: Exit.

-- 
ciao,
Marco
