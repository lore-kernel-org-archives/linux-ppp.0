From: Nicholas Humfrey <njh@aelius.com>
Date: Sun, 14 Feb 2021 01:03:28 +0000
Subject: Configuring pppd to accept link-local IPv6 interface id from remote peer
Message-Id: <d529e496-ac5f-9498-0e3d-1fa1ec2c4750@aelius.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-ppp@vger.kernel.org

Hi,

I originally asked this question on the "Unix and Linux" StackExchange:
https://unix.stackexchange.com/questions/634033/configuring-pppd-to-accept-link-local-ipv6-address-from-remote-peer

But i suspect it is a bit too niche and have not had a response there.


I have two pppd (v2.4.7) instances running, talking to each over over a 
serial port link. But I can't work out how to get the 'client' pppd to 
accept the link-local IPv6 interface identifier provided by the 'server' 
pppd. I am trying to use static addresses so I know the link-local IP 
address of the remote peer.

On the 'server' I am running:
   pppd file ./ppp-options ipv6 ::1,::2 /dev/ttyAMA0 115200

And on the 'client', I am running:
   pppd file ./ppp-options ipv6cp-accept-local /dev/ttyAMA0 115200

This is the contents of ppp-options on both:
   nodetach
   noauth
   persist
   local
   noip
   +ipv6

The pppd man page says:
   ipv6cp-accept-local
     With this option, pppd will accept the peer's idea of our local 
IPv6 interface
     identifier, even if the local IPv6 interface identifier was 
specified in an option.

But that doesn't seem to be the behaviour I am experiencing.

The client always just uses a locally chosen interface identifier 
instead. It was suggested to me to try setting the 'client' local 
interface identifier to all-zero but I have not found a way of doing 
this through configuration. Or alternatively get the 'server' to Nack 
the clients choice of interface identifier - but I'm not sure how to 
achieve that with pppd.

I have now managed to get it working by hacking ipv6cp.c to keep the 
local identifier as all-zero, by disabling a couple of calls to 
eui64_magic_nz. But I am not sure what the proper solution is.

Does there need to be an IPv6 equivalent to 'noipdefault' to use in 
conjunction with 'ipv6cp-accept-local'?

Thanks,

nick.

