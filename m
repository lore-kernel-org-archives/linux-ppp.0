From: James Carlson <carlsonj@workingcode.com>
Date: Mon, 03 Oct 2016 16:52:12 +0000
Subject: Re: Problem: How to force(?) pcomp and accomp
Message-Id: <0578b27c-a790-4c79-b0d4-eae53934afa9@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAAAUBLR3EqnpES7FrcABVZWB1j-NeOyH7_MoTH-iVYFJD14_XQ@mail.gmail.com>
In-Reply-To: <CAAAUBLR3EqnpES7FrcABVZWB1j-NeOyH7_MoTH-iVYFJD14_XQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 10/03/16 12:39, Manish Kambdur wrote:
> I wasn't sure my diagnosis was right till you confirmed it was, thanks a lot.
> 
> I was able to get the setup working!

Good to hear!

>> Assuming you can't find those options present in /etc/ppp/options
> 
> I had misunderstood how the command line option "file" works as I was
> thinking that it override all other options.
> 
> I was starting pppd as `pppd call gprs` (with gprs in /etc/ppp/peers/)
> and didn't think that pppd reads both the /etc/ppp/options and gprs
> file.

Yes, it does.  /etc/ppp/options sets the system-wide options required
for all links.  The privileged "call" and unprivileged "file" options
are there (along with the command line) to add options that are specific
to an individual link.

>> For what it's worth, I think the peer you're talking to is garbage.  At
>> a minimum, any reasonable implementation of PPP should accept the
>> defaults, which means that dropping the link just because your end
>> doesn't want to do ACFC and PFC is pure nonsense.  How could any
>> competent implementation fail to operate without header compression?
>> How much do you trust that peer if they can't get the basics of PPP right?
> 
> The "peer" here refers to the serial modem or the remote server?
> pppd succeeds when I use a modem from a different brand, with the same
> SIM and with 'noaccomp' and 'nopcomp'
> 

I'm guessing this is GPRS/3GPP, and not a real modem.

That information would have helped.  GPRS has a number of built-in
design flaws.  One of them is that the LCP negotiation is done locally
(not end-to-end) along with a completely faked-out authentication layer.
 The "real" negotiation with the remote endpoint doesn't occur until the
Network phase -- that is, during IPCP.

So, yes, I'm referring to the device doing LCP negotiation.  It's not
doing it right.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
