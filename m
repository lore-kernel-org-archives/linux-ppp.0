From: Michal Ostrowski <mostrows@watson.ibm.com>
Date: Tue, 19 Oct 2004 14:07:05 +0000
Subject: Re: Linux Kernel PPPoE/PPP Interactions
Message-Id: <1098194825.25095.203.camel@brick.watson.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <NIBBLPOFOMEFBJKBJLGFKEFACEAA.murugaiyan@banyannetworks.com>
In-Reply-To: <NIBBLPOFOMEFBJKBJLGFKEFACEAA.murugaiyan@banyannetworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

PPPoE discovery/negotiation is done in user-space.

Once a session is established a pppoe socket is created and "attached"
to to a ppp channel.

Consequently,  pppoe session packets coming in are directly streamed
into the ppp driver.

On Tue, 2004-10-19 at 17:11 +0530, Murugaiyan N wrote:
> 
> I am trying to understand the kernel mode pppoe and ppp interactions and how
> packet flow through them.
> Someone give me some directions on where to start?
> 
> what do the files /usr/src/linux/driver/net/pppox.c and pppoe.c for?
> 

Basically transfer pppoe ethernet frames to and from a ppp device,
stripping and adding in a pppoe header as necessary.



> The roaring penguin code doesn't seem to interact with functions in the
> kernel space. Is is so?
> 

You can build a pppoe plugin that loads into pppd to perform pppoe
negotiation and ths socket attachment described above.

-- 
Michal Ostrowski <mostrows@watson.ibm.com>

