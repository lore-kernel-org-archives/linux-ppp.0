From: nick <lupusdacicus@netscape.net>
Date: Sat, 10 Apr 2004 18:33:06 +0000
Subject: pppd routing
Message-Id: <40799D08.40700@netscape.net>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


Hi, I am still trying to connect to the Internet from Linux and I cannot 
seem to get the network/routing right.

When I connect from windows, the DNS server, personal IP and routing are 
   established automatically, but not under linux ? Why ?


 >Did u get the ip address? Maybe you should check is there are DNS 
 >servers ips on your /etc/resolv.conf using the cat command if you want 
 >cat /etc/resolv.conf. If there is none, you should add the following 
 >line:
 >nameserver1 IP_ADDRESS of the DNS server
 >nameserver2 IP_ADDRESS of the second DNS server
 >Example:
 >nameserver1 200.176.3.10
 >nameserver2 200.176.3.11


I did that, but it did not solve anything.
Now, i cannot even get the Linux up and running. I had the bad idea to 
run 'setup' and tell Linux to start 'sendmail' at startup. When it gets 
to sendmail, it just blocks and Linux won't start. I tried to pass 
"linux single", to grub, so I can run setup againg and remove , but it 
does not work.

Someone else says:

"One of (at least) three possible things:
   - your local name service is misconfigured (what's in
           /etc/resolv.conf?)

     - your local routing configuration is wrong (what does
           'netstat -nr' or 'route -n' report?)"

I looked at "netstat -nr" and "route -n", but since I run windows/linux 
on the same laptop (and cannot connect to the net from Linux), I could 
not capture the output into a file and send it along with the email.

Again, I use 'usedefaultroute' (or 'defaultroute)in pppd script/conf, 
wasn't it suppose to add the routing automatically to the routing table 
? In /var/log/messages I have 4 IPs:
-IP_assigned to me
-peers_IP
-DNS_primary
-DNS_secondary

What is the form of route command that I am supposed to run in order to 
be able to go outside peers_ip ?

 >- the peer's routing is broken (is this your ISP or some other
 >          machine?)

Actually, I have a sprint cell phone with Vision on it, but from what I 
read on the net, this should work, plus, I am positive it does connect, 
because I see traffic on my cell (sending+receiving) when I do ping the 
machine I am connected to.


 >On the assumption that this peer is your ISP and that (therefore) the
 >peer isn't just plain broken, you'll need to check the other two
 >things.  At a guess, one or more of these is wrong:

 >    - you have a misconfigured default route and/or local Ethernet
           interface that is causing packets not to go through the PPP
           link when they should.

This is may be the problem.

 >    - you're missing the "defaultroute" option.

I've got this.

 >- you need to get DNS server addresses from your ISP -- either
 >use the "usepeerdns" option and link /etc/resolv.conf to
 >/etc/ppp/resolv.conf

How do I link /etc/resolv.conf to /etc/ppp/resolv.conf ?

 >*OR* create /etc/resolv.conf and add appropriate static addresses >there.

I did this.

 >When posting, please include complete debug logs and configuration
 >files.  Saying that you're able to connect is nice, but it's nicer
 >still to be able to look over the actual information.

Well, I would be happy to do that, but I have no floppy disk on the 
laptop and I don't know if the CDwrite function would work under linux, 
so I can get them under windows and send you this message.

Thank you for your effort,
Nick

