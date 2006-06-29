From: Jorge Daniel Sequeira Matias <martin@andorinha.ist.utl.pt>
Date: Thu, 29 Jun 2006 20:06:59 +0000
Subject: Re: pppd stuck in ioctl(TIOCSETD) in Linux 2.6.15.4+
Message-Id: <200606292106.59200.martin@andorinha.ist.utl.pt>
List-Id: <linux-ppp.vger.kernel.org>
References: <004b01c69a3a$6b80c660$0201a8c0@athlon64>
In-Reply-To: <004b01c69a3a$6b80c660$0201a8c0@athlon64>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org



On Wednesday 28 June 2006 00:03, you wrote:
> There were a couple of bugs recently in the TTY layer related to poptop
> and running pppd on PTYs, but I believe 2.6.15 did not contain them
> (though I find the git logs incomprehensible so could be wrong). See:
>
> http://bugzilla.kernel.org/show_bug.cgi?idd02
> http://bugzilla.kernel.org/show_bug.cgi?ide30
>
> Just in case, you should definitely try the latest kernel - 2.6.17.1 is
> stable.

  It didn't solve. After running 2.6.17.1 for almost 48 hours I already have 4 
pppd processes stuck in "ioctl(TIOCSETD..." in the connection finish section.
  Here's a log of one PPPd process:

--- Log ---
[...]
Jun 29 16:01:36 wifi pppd[18575]: No response to 10 echo-requests
Jun 29 16:01:36 wifi pppd[18575]: Serial link appears to be disconnected.
Jun 29 16:01:36 wifi pppd[18575]: pptpd-logwtmp.so ip-down ppp99
Jun 29 16:01:36 wifi pppd[18575]: Connect time 65.5 minutes.
Jun 29 16:01:36 wifi pppd[18575]: Sent 1927619 bytes, received 620442 bytes.
Jun 29 16:01:36 wifi pppd[18575]: Script /etc/ppp/ip-down started (pid 20428)
Jun 29 16:01:36 wifi pppd[18575]: MPPE disabled
Jun 29 16:01:36 wifi pppd[18575]: sent [LCP TermReq id=0x2 "MPPE disabled"]
Jun 29 16:01:36 wifi pppd[18575]: sent [LCP TermReq id=0x3 "MPPE disabled"]
Jun 29 16:01:36 wifi pppd[18575]: Script /etc/ppp/ip-down finished (pid 
20428), status = 0x0
Jun 29 16:01:39 wifi pppd[18575]: sent [LCP TermReq id=0x4 "MPPE disabled"]
Jun 29 16:01:39 wifi pppd[18575]: Connection terminated.
--- End of Log ---

  The process has not sent the "Exit." string to the syslog yet.
  One thing that all pppd processes have in common is that the end peer didn't 
respond to the our max number of echo-requests. Though not all pppd processes 
end up in this lock scenario.


>
> If that doesn't solve it and if you can reliably reproduce it you could
> do a "git bisect" to track the bug down (tedious though):
>
> http://www.kernel.org/pub/software/scm/git/docs/git-bisect.html
> http://www.kernel.org/pub/software/scm/git/docs/howto/isolate-bugs-with-bis
>ect.txt
> http://www.reactivated.net/weblog/archives/2006/01/using-git-bisect-to-find
>-buggy-kernel-patches/ -

  It is not easy to reboot the machine every day but I'll try it out.

