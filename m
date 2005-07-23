From: Clifford Kite <kite_linux-ppp@ev1.net>
Date: Sat, 23 Jul 2005 21:19:52 +0000
Subject: Re: Pass-filter, multilink and [LCP ProtRej ...]
Message-Id: <Pine.LNX.4.21.0507231523480.19272-100000@corncob.inetport.tld>
List-Id: <linux-ppp.vger.kernel.org>
References: <200507231544.13556.jhm@mtdata.com>
In-Reply-To: <200507231544.13556.jhm@mtdata.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Sat, 23 Jul 2005, James Henry Maiewski wrote:

|Hello,
|
|Before I desrcibe some problems I've been having with PPP (or at leastusing
|PPP], I would ask anyone familiar with KPPP, how one can get a listing of the 
|arguments that KPPP will use with pppd.  I'm using KPPP v2.4.1; pppd v2.4.1; 
|kernel 2.6.3-7mdk (Mandrake 10.0).

I'm not familiar with kppp, but that said putting the pppd option dryrun in
/etc/ppp/options should do it.  Afterwards dryrun will need to be removed.

|Of late, the PPP link to my dial-up ISP has developed a tendency to cut 
|transmission rates to zero, sometimes staying there.  For a while now, I've 
|been unable to establish the link at all unless I pass pppd the -persist 
|option, but it worked fine even so until recently.  Some of the control 
|messages that are new are:
|
|Couldn't set pass-filter in kernel: Invalid argument

The 2.4.1 binary wasn't compiled with the FILTER=y option in pppd/Makefile
set:  Uncomment #FILTER=y and recompile - if you can, otherwise ignore it.  
Apparently kppp attempts to use the pppd pass-filter option for something.

|sent [LCP ConfRej id=0x1 <mrru 1500>] #This is something my ISP has started  
|#asking for recently, i don't think that I have multilink going, or that I 
|#should.

Add the pppd option nomp and the Configure-Reject will become a Protocol-
Reject.

|rcvd [LCP ProtRej id=0x3 80 fd 01 01 00 0f 1a 04 78 00 18 04 78 00 15 03 2f]
|#I have no idea what this is all about.  I thought that LCP had been completed 
|at this point

The peer just rejected all CCP protocols pppd offered, very common.  Add
the pppd noccp option and pppd won't offer any.

|I have included the latest DEBUG details below.  I killed the process 
|manually.

...

If the problems you mentioned were the messages you asked about then
nothing was really wrong.  The link should have been viable.

---
Clifford Kite                                 http://ckite.no-ip.net


