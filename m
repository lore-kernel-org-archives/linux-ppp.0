From: Jorge Daniel Sequeira Matias <martin@andorinha.ist.utl.pt>
Date: Wed, 12 Jul 2006 11:46:41 +0000
Subject: Re: pppd stuck in ioctl(TIOCSETD) in Linux 2.6.15.4+
Message-Id: <200607121246.41800.martin@andorinha.ist.utl.pt>
List-Id: <linux-ppp.vger.kernel.org>
References: <004b01c69a3a$6b80c660$0201a8c0@athlon64>
In-Reply-To: <004b01c69a3a$6b80c660$0201a8c0@athlon64>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Tuesday 11 July 2006 23:53, James Cameron wrote:
> On Tue, Jul 11, 2006 at 01:18:33PM +0100, Jorge Daniel Sequeira Matias 
wrote:
> > I have tried pppd v2.4.4 and didn't see any problem because with
> > 2.6.17.1 I have a new problem.
> > With 2.6.17.1, the "pptpctrl" processes, are heating all the CPU even
> > if the VPN user traffic is low (like 40kbits/sec).
>
> I'm the maintainer of pptpctrl.  Could you describe this problem
> technically please?  Write to poptop-server@lists.sourceforge.net.
> We do not have a goal of cooling a CPU, so heating is expected.

  Sorry for my English. What I meant was it as consuming all the CPU process 
time.
  Meanwhile I saw a reference to this problem in this e-mail

  "2.6.18-rc1-mm1 - VPN chewing CPU like crazy.." in
     http://lkml.org/lkml/2006/7/11/8

  But I have only seen the problem starting with 2.6.17.1

> >   I think this new problem is hiding the "pppd" problem because the
> >   VPN server is so slow that less people establishes connections. The
> >   OS network is now very lagged ...
>
> You've given your perceptions but not any measurements.  To obtain
> measurements, downgrade to the previous configuration and do some tests.
> We have test scripts in pptpd and pptp CVS.

  Unfortunatly I have no time at the moment to do any tests. For now I will be 
with my old setup. I'll get back to this subject during August.
  Thank you for your attention.

Regards,
Jorge Matias

