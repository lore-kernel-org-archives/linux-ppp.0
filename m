From: "Matthew N. Dodd" <mdodd@patton.com>
Date: Wed, 16 Jun 2004 17:51:47 +0000
Subject: RE: PPP state machine
Message-Id: <008401c453ca$9e9ac9a0$67160a0a@ATLANTIC>
List-Id: <linux-ppp.vger.kernel.org>
References: <1087365446.1118.10.camel@Bhaskar>
In-Reply-To: <1087365446.1118.10.camel@Bhaskar>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

linux-ppp-owner@vger.kernel.org wrote:
> Unfortunately the authors of the syncppp code in Linux have
> never converted it to use the ppp_generic module.  That would be the
> correct approach IMO. 

Dan Eble wrote some code that allows the HDLC layer to interface with
the normal PPP code.

It works great.

Check list archives for patches.

--
Matthew N. Dodd <mdodd@patton.com>
Software Engineer, Patton Electronics
7622 Rickenbacker Dr., Gaithersburg,  MD 20879
(301) 975-1000x184

