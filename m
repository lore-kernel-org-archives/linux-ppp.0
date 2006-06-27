From: Phil Mayers <p.mayers@imperial.ac.uk>
Date: Tue, 27 Jun 2006 23:03:06 +0000
Subject: Re: pppd stuck in ioctl(TIOCSETD) in Linux 2.6.15.4+
Message-Id: <44A1B92A.1050608@imperial.ac.uk>
List-Id: <linux-ppp.vger.kernel.org>
References: <004b01c69a3a$6b80c660$0201a8c0@athlon64>
In-Reply-To: <004b01c69a3a$6b80c660$0201a8c0@athlon64>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Jorge Daniel Sequeira Matias wrote:
> 
>  Hi everyone,
> 
>  I'm running a PPTP VPN Server for almost 4 years now. This server is 
> running in a Debian Linux (unstable).
>  The configuration for the last 1 year and a half was the following:
> 
>  Computer 2x Intel Xeon 2.6GHz and 512MB RAM
>  Linux v2.6.11.6 (vanilla) with MPPE patch

>   After the upgrade to a Linux v2.6.15.4 (vanilla) with no patches to 

There were a couple of bugs recently in the TTY layer related to poptop 
and running pppd on PTYs, but I believe 2.6.15 did not contain them 
(though I find the git logs incomprehensible so could be wrong). See:

http://bugzilla.kernel.org/show_bug.cgi?idd02
http://bugzilla.kernel.org/show_bug.cgi?ide30

Just in case, you should definitely try the latest kernel - 2.6.17.1 is 
stable.

If that doesn't solve it and if you can reliably reproduce it you could 
do a "git bisect" to track the bug down (tedious though):

http://www.kernel.org/pub/software/scm/git/docs/git-bisect.html
http://www.kernel.org/pub/software/scm/git/docs/howto/isolate-bugs-with-bisect.txt
http://www.reactivated.net/weblog/archives/2006/01/using-git-bisect-to-find-buggy-kernel-patches/
