From: David Ronis <ronis@ronispc.chem.mcgill.ca>
Date: Sun, 13 Mar 2005 20:43:35 +0000
Subject: Re: Problem makeing a ppp-ssh tunnel.
Message-Id: <16948.42487.347193.82463@montroll.chem.mcgill.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <42346881.mailIHA11VZX9@ronispc.chem.mcgill.ca>
In-Reply-To: <42346881.mailIHA11VZX9@ronispc.chem.mcgill.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

>>>>> "Bret" = Bret Hughes <bhughes@elevating.com> writes:

    Bret> On Sun, 2005-03-13 at 10:21, David Ronis wrote:
    >> Hi,
    >> 
    >> I'm trying to use ssh and pppd to set up a ppp tunnel between
    >> my laptop at home and a machine at work.  Both machines are
    >> running a 2.6.11 kernel, slackware 10.[01] and have pppd 2.4.3
    >> installed.  I more or less followed the instructions in the
    >> ppp-ssh howto, which essentially runs the following command as
    >> root:
    >> 
    >> /usr/sbin/pppd ktune noauth updetach passive pty
    >> "${REMOTE_COMMAND}" ipparam vpn
    >> ${CLIENT_IFIPADDR}:${SERVER_IFIPADDR}
    >> 
    >> where
    >> 
    >> REMOTE_COMMAND=ssh -l ${SERVER_USERNAME} ${SERVER_HOSTNAME} \
    >> sudo /usr/sbin/pppd ktune noauth nodetach notty proxyarp
    >> ipparam vpn
    >> 
    >> where ${SERVER_USERNAME} has sudo privilages on
    >> ${SERVER_HOSTNAME}.
    >> 
    >> and where ${CLIENT_IFIPADDR} is the IP address my laptop has
    >> when it's connected at work and where ${SERVER_IFIPADDR} is the
    >> IP address of the server 132.206.205.86 and 132.206.205.91,
    >> respectively.
    >> 
    >> ifconfig shows:
    >> 
    >> ppp0 Link encap:Point-to-Point Protocol inet
    >> addr:132.206.205.86 P-t-P:132.206.205.91 Mask:255.255.255.255
    >> UP POINTOPOINT RUNNING NOARP MULTICAST MTU:1500 Metric:1 RX
    >> packets:4 errors:0 dropped:0 overruns:0 frame:0 TX packets:21
    >> errors:0 dropped:0 overruns:0 carrier:0 collisions:0
    >> txqueuelen:3 RX bytes:62 (62.0 b) TX bytes:4590 (4.4 Kb)
    >> 
    >> on the client and
    >> 
    >> ppp0 Link encap:Point-to-Point Protocol inet
    >> addr:132.206.205.91 P-t-P:132.206.205.86 Mask:255.255.255.255
    >> UP POINTOPOINT RUNNING NOARP MULTICAST MTU:1500 Metric:1 RX
    >> packets:4 errors:0 dropped:0 overruns:0 frame:0 TX packets:49
    >> errors:0 dropped:0 overruns:0 carrier:0 collisions:0
    >> txqueuelen:3 RX bytes:62 (62.0 b) TX bytes:4302 (4.2 Kb)
    >> 
    >> on the server.
    >> 
    >> pppd has created route entries:
    >> 
    >> 132.206.205.86 0.0.0.0 255.255.255.255 UH 0 0 0 ppp0
    >> 
    >> on the server
    >> 
    >> and 132.206.205.91 0.0.0.0 255.255.255.255 UH 0 0 0 ppp0
    >> 
    >> on the client
    >> 
    >> If I ping 132.206.205.86 from the client I get a response, but
    >> if I ping the server (132.206.205.91) I get nothing.
    >> 
    >> Similarly, pinging the client from the server doesn't get a
    >> reply.
    >> 
    >> Finally, the connection times out.
    >> 
    >> 
    >> My suspicion is that I'm close, but am making some sort of
    >> trivial mistake.  Any ideas?
    >> 

    Bret> I am certainly no expert but I would next try traceroute
    Bret> ip_of_remote_end on bothe ends and try to figure out where
    Bret> the packets are going.  The route command output is curious
    Bret> it may be valid but I am used to seeing * instead of 0.0.0.0
    Bret> for the gateway ip.

That's because I ran netstat -rn, simply using -r gives the *.

    Bret> Looking at eh transmit and recieve byte counts looks like
    Bret> the packets are not getting there. I would delete the routes
    Bret> manually and recreate them if the packets are not getting
    Bret> there.

I've tried that.  It doesn't help.



Thanks for your help.


David
