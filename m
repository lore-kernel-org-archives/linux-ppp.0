From: Marshall Crocker <marshall@iconux.org>
Date: Mon, 11 Aug 2008 05:36:48 +0000
Subject: Re: How to fix continuous ConfReq's on celluar internet connection
Message-Id: <489FCFF0.7090402@iconux.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <489F746B.3040002@123mail.org>
In-Reply-To: <489F746B.3040002@123mail.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


> Yes, just block the packets that aren't from the source IP that pppd
> assigns to the link.

I tired adding the rule to drop packets with a source of 192.168.0.X 
destined for ppp0 but that didn't appear to work. Most likely due to 
some of the other chains created by MonMontha's script.  I'm curious as 
to why packets with a source from my internal LAN are getting sent out 
over ppp in the first place.  The FORWARD chain looks like:

Chain FORWARD (policy DROP)
target     prot opt source               destination        
INETIN     all  --  anywhere             anywhere           
INETOUT    all  --  anywhere             anywhere           
ACCEPT     all  --  192.168.0.0/24       anywhere 

Is it possible the INETOUT chain gets executed first and sometimes 
bypasses the accept for 192.168.0.0/24?   I'm sure I'll figure it out 
sooner or later but if anyone knows iptables better than me, I'll glady 
accept any suggestions :).
