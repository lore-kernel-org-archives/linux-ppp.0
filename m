From: Bhaskar-ROCSYS <vbhaskar@rocsys.com>
Date: Thu, 17 Jun 2004 04:33:02 +0000
Subject: RE: PPP state machine
Message-Id: <1087446065.1004.0.camel@Bhaskar>
List-Id: <linux-ppp.vger.kernel.org>
References: <1087365446.1118.10.camel@Bhaskar>
In-Reply-To: <1087365446.1118.10.camel@Bhaskar>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Oh thats great.  Can I get the code ?


Regards
bhaskar
On Wed, 2004-06-16 at 23:21, Matthew N. Dodd wrote:
> linux-ppp-owner@vger.kernel.org wrote:
> > Unfortunately the authors of the syncppp code in Linux have
> > never converted it to use the ppp_generic module.  That would be the
> > correct approach IMO. 
> 
> Dan Eble wrote some code that allows the HDLC layer to interface with
> the normal PPP code.
> 
> It works great.
> 
> Check list archives for patches.
> 
> --
> Matthew N. Dodd <mdodd@patton.com>
> Software Engineer, Patton Electronics
> 7622 Rickenbacker Dr., Gaithersburg,  MD 20879
> (301) 975-1000x184
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


