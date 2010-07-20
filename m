From: Erik L <erik_list@caneris.com>
Date: Tue, 20 Jul 2010 22:33:37 +0000
Subject: Re: Multilink packet loss 2.6.32 - would like to resolve and have
Message-Id: <11429217.51.1279665217173.JavaMail.root@zimbra.caneris.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <15659855.171.1279078950097.JavaMail.root@zimbra.caneris.com>
In-Reply-To: <15659855.171.1279078950097.JavaMail.root@zimbra.caneris.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi Ben,

Thanks for the patches. What I've done so far was:
-Apply the kernel patches to our LNS Debian kernel and our CPE kernel
-Make the necessary modifications in userspace in pppd to make use of the new min frag ioctl. I picked a min fragment size of 49.

The results of testing as reported by a colleague are that there is still some dropped packets and speed tests are still not performing as well as with the round-robin patch. I can provide further details if this would help.

Next I will try setting SC_NOT_1_FRAG in PPPIOCSFLAGS and play around with various min frag sizes. 

In the meanwhile any further ideas would be appreciated.

BTW, this is all with homogeneous links still; haven't even tested heterogeneous yet as was hoping to first replicate the performance equivalent to the round-robin patch on homogeneous.   

Thanks
Erik

----- Original Message -----
From: "Ben McKeegan" <ben@netservers.co.uk>
To: "Erik L" <erik_list@caneris.com>
Cc: "linux-ppp" <linux-ppp@vger.kernel.org>
Sent: Wednesday, July 14, 2010 4:36:56 AM
Subject: Re: Multilink packet loss 2.6.32 - would like to resolve and have heterogenous links working

Erik L wrote:
>
> I also tried another patch [3] to the default 2.6.32+ behaviour, but
> this didn't resolve the problem. There is still some packet loss,
> though it's a bit better than before.
>
> [3] http://marc.info/?l=linux-ppp&m7555649304387&w=2

Due to other time pressures I've still not had time to do any real
testing of the rest of the patches in this series but if you want to try
them yourself please see attachments.

Regards,
Ben.

-- Ben McKeegan
Netservers Limited
01223 446000 ext 8103
