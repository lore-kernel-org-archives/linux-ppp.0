From: James Carlson <carlsonj@workingcode.com>
Date: Wed, 02 Jun 2010 10:57:38 +0000
Subject: Re: PPPoA server setup how to?
Message-Id: <4C063922.3030003@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <AANLkTikV_j1ajMThiB8B6DoaZpZ4fhlIRVVk2jK30-h8@mail.gmail.com>
In-Reply-To: <AANLkTikV_j1ajMThiB8B6DoaZpZ4fhlIRVVk2jK30-h8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 06/02/10 05:26, James Chapman wrote:
> starts a pppd instance on ATM VPI 0, VCI 80 and assigns IP 192.168.1.1
> to the local interface and 192.168.1.2 to the peer when the PPPoA peer
> connects on VPI 0, VCI 80. If you are building a DSLAM-like box which
> accepts connections from many PPPoA clients, you will need to start a
> pppd instance for every possible ATM VPI/VCI that clients might use...

That's one possibility.  Another would be having UNI Q.2931 signaling
set up the virtual circuit for you, and launching pppd based on the
signaling.

I don't think the existing implementation includes the bits required to
do that.  You'd have to write it yourself.  And it (obviously) depends
on what sort of connection you have to the network.

>> Well I coated this (PADI, PADO,...) because, wanted to know does PPPoA
>> also follows these message sequence or it has new set of sequence ?
> 
> No, they are for PPPoE.

The closest equivalent to those messages I can imagine would be the ATM
signaling mechanism referenced above.

But I think it's probably time to take a step back and ask the obvious
question: can you tell us what you've got (in terms of hardware,
software, and operational environment) and what you're trying to do (in
as much high-level detail as possible)?

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
