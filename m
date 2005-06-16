From: Arvin Schnell <arvin@suse.de>
Date: Thu, 16 Jun 2005 08:40:30 +0000
Subject: Re: Help - Auto PPPoA and PPPoE detection in ADSL line
Message-Id: <20050616084030.GA31282@suse.de>
List-Id: <linux-ppp.vger.kernel.org>
References: <61CBBC5FF0C80E4286E28E959D967F5A01FC9E60@SGEXCHG.aztech.com>
In-Reply-To: <61CBBC5FF0C80E4286E28E959D967F5A01FC9E60@SGEXCHG.aztech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, Jun 16, 2005 at 03:09:04PM +0800, Ranjeet Kumar - R&D wrote:
> Hi, 
> 
> I am new in this group, if anything is wrong, please excuse me in advance.
> 
> We have ADSL modem running Linux Version - 2.4 and pppd version 2.4.1. We
> want to detect the protocol, whether it is PPPoE or PPPoA, of the connected
> ADSL line. Can anybody help me in providing information on how to achieve
> this task? We are using pppoe and pppoa plugin with pppd to connect to DSLAM
> (ISP).

Detecting of PPPoE is easy: Send a PADI and see if you receive a
PADO.

This can be done with 'pppoe -A' included in the rp-pppoe source
or you can also write your one code.

I do not have experiences with PPPoA.

ciao Arvin
