From: James Cameron <james.cameron@hp.com>
Date: Tue, 17 Apr 2007 04:21:40 +0000
Subject: Re: ppp interface
Message-Id: <20070417042140.GK5181@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <10028998.post@talk.nabble.com>
In-Reply-To: <10028998.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Mon, Apr 16, 2007 at 09:17:17PM -0700, maimam wrote:
> I am having a hard time getting PPTP to work in a lab environemnt.

Works for me every time.  I last checked it yesterday with the release
of pptpd 1.3.4.

> since i dont have a modem i dont have a ppp interface. pptp tries to use
> ppp0 as a tunnel interface. 

This is entirely normal.  If you did have a modem interface, pppd would
use ppp1 as the tunnel interface.

> [root@localhost ppp]# pppd pty 'pptp 1.1.1.101 --nolaunchpppd' call pptp1
> Connect: ppp0 <--> /dev/pts/3
> Child process pptp 1.1.1.101 --nolaunchpppd (pid 26619) terminated with
> signal 15

This suggests that pptp has failed with a SIGTERM.  There is no sign
there of any pppd problem.

> Although i have pppd in the processes i dont have any ppp interface. pppd
> version 2.4.2. What should i do?

Contact the PPTP Client mailing list.
http://pptpclient.sourceforge.net/contact.phtml

Have you tried OpenVPN yet?

-- 
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/
