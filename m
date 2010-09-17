From: tony.chamberlain@lemko.com
Date: Fri, 17 Sep 2010 15:13:27 +0000
Subject: Re:  COuple questions regarding ppp
Message-Id: <W363832083584211284736407@webmail10>
List-Id: <linux-ppp.vger.kernel.org>
References: <W297245581100211284730447@webmail32>
In-Reply-To: <W297245581100211284730447@webmail32>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Oh and I got mppe to work finally.  I just misunderstood the
chap-secrets file.

-----Original Message-----
From: James Carlson [mailto:carlsonj@workingcode.com]
Sent: Friday, September 17, 2010 09:10 AM
To: tony.chamberlain@lemko.com
Cc: 'ppp Linux'
Subject: Re: COuple questions regarding ppp

On 09/17/10 09:34, tony.chamberlain@lemko.com wrote:
> We had a customer, call them BT.  They set up a PPP server for us, so
> that I would do a ppp connection from my machine (Linux) to their's it
> would establish a connection.  My machine is a 192 and they set up a remote
> IP address for me something like 10.1.1.16 or something.

"192" isn't a type of machine I recognize, so I'm going to assume that
you meant that you have a local network (perhaps Ethernet) configured
for an address in the RFC 1918 private address space 192.168.0.0/16.

>  Their local network
> was 10.0.0.0/8 so I did an  ip route replace 10.0.0.0/8 dev ppp0 or something
> like that.  Then I could route to their machines from mine.
> 
> Now, I am setting up ppp.  I have a client (call it florida) that people
> from here will use at a trade show in florida.  I am setting up a server
> (call it illinois).  I succesfully established a connection from florid
> to illinois.  Got an IP of the following:
>    inet addr:192.168.0.1  P-t-P:192.168.0.234  Mask:255.255.255.255

Continuing with my assumption above, that link should be using
proxy-ARP, because the remote address is (probably) in the same subnet
as the assumed local network above.  (Maybe ... there's a lack of
details here.)

> (this on the server.  Client is reversed of course).  On the client
> (florida) is also a 192 network.

That's bad news unless you've got distinct subnets.  I hope you do.

There's unfortunately a lack of detailed information here about the
networks and interfaces in use.

>  The illinois machine has no 192 network
> on it, so I did an  ip route replace 192.168.5/0 dev ppp0.  When I try
> from illinois to ssh to 192.168.5.191 (which I can do from florida as it is
> the same network) it times out and cannot find a route.

What does 192.168.5/0 mean?  Did you perhaps intend 192.168.5.0/24
instead?  It sounds like you added a host route for 192.168.5.0 (a
single IP address) rather than the required network route for the remote
subnet.

"netstat -nr" on each of the machines and a simple ASCII-art picture of
the network would help greatly.

The questions you're asking sound like straightforward Linux routing
questions, and not issues specifically related to PPP.  You might do
better on a different mailing list.

>  I did do the
> sysctl on each machine to set net.ipv4.ip_forward to 1.  Is there something
> else I am not doing that I need to? Yes and I know I am trying to route
> from ppp server to client which is opposite of BT.  And yes I can ssh to
> 192.168.0.234 and even 192.168.5.65 which is the IP address of florida.

Which indicates that there's no PPP issue here, but rather a routing
configuration problem.

For what it might be worth, I'm a big fan of dynamic routing protocols
(such as RIP and OSPF) because they take care of all the route
computation problems for you, rather than forcing you to configure every
single machine in your network with an obscure list of static routes.
There's a downside (you have to learn about setting up routing
protocols), but the upside is better manageability in the longer term.

> The other question.  Both machines are in my control and are Linux.  florida
> is CentOS 4.5 and flordia just says redhat release 5.  Anyway right now I
> have no encryption.  Not sure it is necessary but I would feel better.  But
> any combination of requires and refuses I try results in SIGUSR1 on the
> client (florida) side.  What is a good configuration to have at both sides
> so packets are encrypted?  This is not super duper top secret info so
> a lower encryption method would be OK.

"It depends."

I would recommend first investigating the use of higher-level encryption
mechanisms, such as IPsec and SSL, rather than something at the PPP
level.  There's a lot to be said for end-to-end security, though it
certainly takes a lot more effort to get right.

If you insist on using encrypted PPP links, there's not much to choose
from right now.  On some platforms, you might be able to get Microsoft's
proprietary MPPE to work.  Otherwise, you've got the source, so go to
town on it.  :-/

If you have specific problems (I don't recognize SIGUSR1 as any sort of
error that pppd ever produces; it's a signal that the daemon recognizes
and uses to increase debug level, and not an error), you should post
complete copies of your configuration files and your debug logs.
Without details, it's not really possible to come up with a solution.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>



