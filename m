From: tony.chamberlain@lemko.com
Date: Fri, 30 Jan 2009 16:10:00 +0000
Subject: Routing
Message-Id: <W3133827767292401233331800@webmail16>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I have a machine, accessible from outside our company, running PPP.
It's local IP address is 10.0.1.29 (the address it gets from PPP).
I also have another machine whose IP address is 10.0.1.3 and also has
an IP address of 192.168.5.88 connected to our local network.

I can get to the 10.0.1.29 machine through an external IP address (which
I won't list here, for security reasons) and from there ssh to 10.0.1.3
and from 10.0.1.3 to the 192 network.

I would like to be able to get right from 10.0.1.29 to the 192 network.
On 10.0.1.3 I set the ip_forard (I forgot exaclty what it is called) to 1
and restarted the network.

On 10.0.1.29 I did an

     ip route add '192.168.5.0/24' via 10.0.1.3 dev ppp0
and
     ip route add '192.168.5.0/24' via 10.0.1.3 

tried both.  It was entered succesfully and showed up in "route -n" but
when I tried from 10.0.1.29 to do for example

     ssh -l root 192.168.5.191

it wouldn't let me and couldn't connect (though it would work from 10.0.1.3).

Did I miss something, or what else do I need to do?

I somehow got this to work earlier between our 192.168.5 nextwork and
our 10.0.0.0 network where a machine (10.0.0.215/192.168.5.15) was on
both networks, and I set its address (192.168.5.15) as default router
for 192.168.5 networks and 10.0.0.215 for 10 networks.

192.168.5 mask is 255.255.255.0 and 10 network mask is 255.0.0.0

Tony


