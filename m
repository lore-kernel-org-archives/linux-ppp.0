From: James Carlson <carlsonj@workingcode.com>
Date: Fri, 13 Nov 2009 16:34:40 +0000
Subject: Re: getting the device of the ppp connection
Message-Id: <4AFD8AA0.9060105@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <dac45060911130554u31df1580x13d2c901372567af@mail.gmail.com>
In-Reply-To: <dac45060911130554u31df1580x13d2c901372567af@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

walter harms wrote:
> 
> Charlie Brady schrieb:
>> Have a look at daemontools or runit for mechanisms to give you good
>> reliable control of the execution environment of long-running processes.
>>
>> ---
> 
> you can scan the output of ifconfig -a,
> but normaly pppd setups a ppp0.

I think he's actually asking about the device _underneath_ PPP that's in
use, not the "ppp0" network interface that's visible to IP.

For a serial link, that underlying interface is something like "tty0"
(perhaps including information about the number dialed, if it's a modem
or TA link), and for a PPPoE session, that's something like "eth0" plus
access server name and server Ethernet address.  There are many other
cases, including tunneled connections (L2TP and the like) and more
exotic media such as PPPoA and Frame Relay where the underlying
mechanism may have multiple forms of addressing.  In fact, it may have
multiple layers of information to dig through.  (SNMP uses ifstack for
this, I think.)

This is information that's really known only to the dialer involved, and
not to pppd, which 'sees' only a channel for PPP frames.  You can hack
around the issue by setting an environment variable to communicate the
information needed, but there's no native support in the current design
for recording this medium-dependent information.

There probably should be something added, and I'm sure something could
be hacked together for a few special cases, but it's likely a
complicated problem to solve _well_.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
