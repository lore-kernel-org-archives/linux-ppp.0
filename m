From: James Carlson <carlsonj@workingcode.com>
Date: Tue, 22 May 2012 18:24:32 +0000
Subject: Re: PPP connection stuck at bad configuration-ack
Message-Id: <4FBBD9E0.9020407@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAN0ddOm5akxZaAJ-VN4fgSAVOKEOEaXNoUkHXhDdKe4UAMjv1w@mail.gmail.com>
In-Reply-To: <CAN0ddOm5akxZaAJ-VN4fgSAVOKEOEaXNoUkHXhDdKe4UAMjv1w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Kristian R. Evensen wrote:
> I am not sure where the error lays, so I wonder if anyone else has
> seen something similar or has any tips on how to proceed with figuring
> this out? Output from pppd, as well as the chatscript and pppd options
> can be found here: http://pastebin.com/z8crcxR6

The reason pppd considers the Configure-Nak to be "bad" is that the
negotiation is not converging due to a bug or misconfiguration on the
peer's side.  We say this:

May 21 12:17:50 nne5 pppd[2658]: sent [IPCP ConfReq id=0x1 <addr 0.0.0.0>]

The peer tells us (using the backwards and proprietary Microsoft
extensions) that we should be asking for DNS addresses:

May 21 12:17:51 nne5 pppd[2658]: rcvd [IPCP ConfNak id=0x1 <ms-dns1
10.11.12.13> <ms-dns2 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins
10.11.12.14>]

We modify our request exactly as the peer says and ask again:

May 21 12:17:51 nne5 pppd[2658]: sent [IPCP ConfReq id=0x2 <addr
0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns2 10.11.12.14> <ms-wins
10.11.12.13> <ms-wins 10.11.12.14>]

This is where it runs off the rails.  The peer idiotically repeats the
same response:

May 21 12:17:52 nne5 pppd[2658]: rcvd [IPCP ConfNak id=0x2 <ms-dns1
10.11.12.13> <ms-dns2 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins
10.11.12.14>]

We try again and again, only to get the same broken answer.

Note just how terribly invalid that reply from the peer really is.  He's
sending us a Configure-Nak, but every single "hint" value exactly
matches what we sent in our Configure-Request.  That's just beyond the
pale; if what you're "negatively acknowledging" exactly matches what the
peer is asking, you really should have just acknowledged it, right?

However, the key here (besides understanding that the peer is very
poorly designed and should be avoided) is noticing that we also politely
asked for an IP address, and the peer failed to supply one.

My guess (and it's just a guess at this point) is that this "huawei"
thing is one of those horrible 3G access devices that mangles PPP.  The
3G "standard" specifies that the access server must lie to the client
and return success during the authentication phase, even if the user
name and/or password are completely wrong, or if the named user does not
have the requested network service authorization.  The only way you find
out that something is wrong under this "standard" is when you ask for an
IP address and the peer is unable to supply one.

Most likely, your PAP user name "nne5" or password is incorrect or you
don't have the right configuration set up in the chat script.

Better still, stay as far as you can manage to get from badly-designed
"standards."

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
