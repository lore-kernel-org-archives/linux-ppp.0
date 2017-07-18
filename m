From: James Carlson <carlsonj@workingcode.com>
Date: Tue, 18 Jul 2017 12:07:02 +0000
Subject: Re: Session 152 terminated -- received PADT from peer
Message-Id: <0c594ed2-12cf-5783-b8dd-d133ca2f4a33@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAGc3wVBAcgaGFtzDVTksaLgs0CX=mirK7osVJRNM2_JjtNYM6w@mail.gmail.com>
 <CAGc3wVD85YJhKgMq-4R3T=oQLy8WM9ti-tbP6z+ApyZBw8mTdQ@mail.gmail.com>
In-Reply-To: <CAGc3wVD85YJhKgMq-4R3T=oQLy8WM9ti-tbP6z+ApyZBw8mTdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sekar D <sekar.linux@gmail.com>, linux-ppp@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

On 07/18/17 07:42, Sekar D wrote:
> Please let me know if someone can help here.

Probably not, but I'll give a try.

>> I am getting the following error messages through PPP connection
>> without any manual intervention.
>>
>> Session 152 terminated -- received PADT from peer

PADT is the PPPoE termination message.  It means that your peer has
decided to close the session.  It could do so for any of a wide number
of reasons, and this doesn't seem to indicate any details.  For example,
your peer:

  - may be rebooting or administratively disabled
  - may have a session time limit that's enforced by shutdown
  - may have a bug that causes the session to crash
  - may have detected some configuration problem
  - may have some other internal limitation

It's really not clear without getting information from the peer.  You
might possibly try getting a tcpdump (or wireshark) trace on the
Ethernet interface over which PPPoE is being run, and that might help
reveal the events surrounding the connection closure.

>> PADT: Generic-Error: RP-PPPoE: Child pppd process terminated
>> Sent PADT
>> Modem hangup
>> Exit
>> Connection terminated.
>> ADSL connection lost; attempting re-connection

Looks like all is working as expected following a disconnect by the peer.

>> Please let me know if any configuration needs to be added.
>>
>> /etc/ppp/pppoe-server-options
>> # PPP options for the PPPoE server
>> # LIC: GPL
>> require-chap
>> login
>> lcp-echo-interval 10
>> lcp-echo-failure 2

Are you really running a PPPoE server?  I had expected that you were
running a client.

What exactly are you doing with PPPoE?  In general, if you're trying to
connect to your ISP, then at least "require-chap" and "login" are wholly
inappropriate.  They demand that your peer identify itself to you --
which ISPs almost never do -- and weirdly ask to use both CHAP and local
authentication, a combination that's _fundamentally_ impossible because
CHAP doesn't reveal the passphrase on the wire.  Whoever set up those
options was probably pretty confused.

If you can do so, I suggest running with "debug" and "updetach" options,
and forwarding the complete trace output to the list.  If there's a
problem with pppd configuration (as opposed to PPPoE or some other
issue), that should help reveal what's going on at the PPP level.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
