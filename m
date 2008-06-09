From: James Cameron <james.cameron@hp.com>
Date: Mon, 09 Jun 2008 23:32:31 +0000
Subject: Re: PPP difficulties regarding connection establishment and bogus
Message-Id: <20080609233231.GA5187@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <66abdca00806060145ua700d3cydeb3e37df39b94f8@mail.gmail.com>
In-Reply-To: <66abdca00806060145ua700d3cydeb3e37df39b94f8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

G'day,

This is common.  There exist many implementations.  The "modem" device
contains firmware that invents DNS server IPs and presents them to the
host before the radio network has provided them.  I see 10.11.12.13 and
10.11.12.14 quite often.

(The modem firmware is the PPP peer, acting as a protocol translator to
the radio network, and is not compliant with the RFC, in my opinion).

This delay in providing IP addresses can be caused by either:

1.  invalid access point name (APN), set by AT+CGDCONT ... which causes
the modem to not receive any reply from any access point on the
provider's network,

2.  incorrect profile set, causing incorrect APN to be used,

3.  refusal of the provider's access point to send an IP address,

4.  use of incorrect username and password, (it is reported by the modem
as valid before it is checked by the radio network),

5.  incorrect username and password set on modem, (for some reason the
modem can also keep the username and password in AT commands),

6.  use of incorrect authentication method (PAP vs CHAP),

7.  modem has not yet finished attaching to the radio network, because
there is no signal, or too much radio noise,

8.  modem has not yet finished attaching to the radio network, because
the radio network is congested,

9.  modem has not yet finished attaching to the radio network, because
it was only just powered on.

There is very little that can be done to isolate to the exact cause, at
the PPP level.

One method to decrease the probability of the normal delays (7, 8 & 9)
is to ensure the modem is attached to the radio network before you begin
a connection.  This is what I do in the eee-maxon-bp3 package, the
/etc/chatscripts/bp3 file contains:

# cease if modem is not attached to network yet
ABORT '+CGATT: 0'
'' AT+CGATT?

And the invokation of pppd fails, and is retried by a shell script,
until the modem advises successful connection.

This does not eliminate the problem, but it certainly reduces the
frequency of it.  Happy users.

I was going to add an option to pppd that would detect this particular
buggy peer and persist with obtaining a valid DNS configuration.  But
this workaround was sufficient.

References:

http://quozl.linux.org.au/bp3-usb/

-- 
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/
