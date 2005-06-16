From: md@Linux.IT (Marco d'Itri)
Date: Thu, 16 Jun 2005 12:56:47 +0000
Subject: Re: Help - Auto PPPoA and PPPoE detection in ADSL line
Message-Id: <20050616125647.GB13128@wonderland.linux.it>
List-Id: <linux-ppp.vger.kernel.org>
References: <61CBBC5FF0C80E4286E28E959D967F5A01FC9E60@SGEXCHG.aztech.com>
In-Reply-To: <61CBBC5FF0C80E4286E28E959D967F5A01FC9E60@SGEXCHG.aztech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Jun 16, Ranjeet Kumar - R&D <Ranjeet.Kumar@aztech.com> wrote:

> We have ADSL modem running Linux Version - 2.4 and pppd version 2.4.1. We
> want to detect the protocol, whether it is PPPoE or PPPoA, of the connected
> ADSL line. Can anybody help me in providing information on how to achieve
> this task? We are using pppoe and pppoa plugin with pppd to connect to DSLAM
> (ISP).
The PPP book by James Carlson explains how to do it.
OTOH it's probably better to implement this in a standalone application
than in pppd.

-- 
ciao,
Marco
