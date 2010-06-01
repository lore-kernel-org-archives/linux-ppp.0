From: James Carlson <carlsonj@workingcode.com>
Date: Tue, 01 Jun 2010 15:10:47 +0000
Subject: Re: PPPoA server setup how to?
Message-Id: <4C0522F7.7070702@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <AANLkTikV_j1ajMThiB8B6DoaZpZ4fhlIRVVk2jK30-h8@mail.gmail.com>
In-Reply-To: <AANLkTikV_j1ajMThiB8B6DoaZpZ4fhlIRVVk2jK30-h8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

arun b wrote:
> All,
> How to we test PPPoA using pppd deemon...
> I mean to understand the remote-server setup ?
> what devie has the pppoa server and  how is the iintial hannd shake ?
>  does this go with sequence of PADI, PADO,PADS .....etc... sequec?

Are you looking for PPPoA or PPPoE?  What hardware do you have?

PPP over ATM just uses ATM-related drivers and runs regular PPP.

PPPoE is quite different.  It runs over Ethernet and uses a separate
protocol to set up the point-to-point virtual link.  The messages you're
referring to (PADI, and so on) are parts of the PPPoE protocol.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
