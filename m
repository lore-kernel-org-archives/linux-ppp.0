From: "Feighery,Patrick D." <FEIGHERY@mitre.org>
Date: Mon, 29 Aug 2005 16:47:58 +0000
Subject: RE: Current size of PPP transmit queue
Message-Id: <87ABB5B9BD11A240B9CBB3F0485AEC894BD3BB@IMCSRV4.MITRE.ORG>
List-Id: <linux-ppp.vger.kernel.org>
References: <87ABB5B9BD11A240B9CBB3F0485AEC89236138@IMCSRV4.MITRE.ORG>
In-Reply-To: <87ABB5B9BD11A240B9CBB3F0485AEC89236138@IMCSRV4.MITRE.ORG>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Paul thanks for the follow up.

Hmmm  I thought I understood what was going on, but now I am not sure.
After looking at the code, I thought there were essentially two queues.
One at the ppp layer and one at the serial driver.  After looking
though the code I thought the serial driver queue was a character queue
whose max queue length was 1K bytes.

If I do an ifconfig ppp0, the default max queue is 3 packets. (which I
do change)  This queue I thought was in ppp_generic.c  This is what I
thought was the interesting queue.

Therefore when a packet gets routed through IP, a routing table look-up
which returns a pointer to a routing table entry which has a pointer to
the ppp0 device.  IP then puts the packet on that network interface
queue.  ppp then periodically wakes up to see if there is anything it
can do.  If the serial driver queue is not full, ppp then adds the ppp
header stuff to the IP packet and compress the data if need be and puts
this data is a small buffer to be feed to the serial driver queue.

Please correct my misunderstanding.

What I did to get a queue length - which now I question is the
following.

To get the ppp queue size I just created another ioctl (SIOCGPPPQLEN)
and added the snippit of code in driver/net/ppp_generic:ppp_net_ioctl()

        case SIOCGPPPQLEN:
printk (KERN_INFO "PDF XXX qlen (%d)\n", ppp->dev->qdisc->q.qlen);
                qlen = ppp->dev->qdisc->q.qlen;
                if (copy_to_user(addr, &qlen, sizeof(qlen)))
                        break;
                err = 0;
                break;

I would rather have a byte count versus packet count, however the only
way I could get that value is to walk through the queue and do the
addition myself - is there another way. Then I just hacked pppstat to
get the value.

I created an ioctl because, well, err, I knew how to do it. When the
only tool you know how to use is a hammer, everything looks like nails
;-(  However I agree putting something in the sysfs is a better
approach.

This may have applicability to others so do you think this is something
that should be permanently added to the code tree.  The following is a
quick synopsis on why I am hoping to do this.

I have created a TCP Performance Enhancing Proxy (TCP PEP) to improve
the performance of TCP over challenging environments (e.g., satellite
links, Line of sight radio links, etc.)  Now, I am looking to use this
TCP PEP over an iridium phone set (possible a series of iridium phone
sets.)  One of the key features of this PEP is that the bandwidth on
the RF side needs to be known apriori and dedicated to the proxy.  For
example, if you have a 2.4 Kbps link, the PEP will emit data at 2.4
Kbps and not self congest the pipe - it also has other techniques to
indicate loss to TCP and other ways to react to loss.  In most cases
knowing the bandwidth is easy.  However because of deflate and other
compression techniques to squeeze data over constrained ppp links, the
effective bandwidth can vary tremendously based on the compressibility
of the data.   Thus the effective capacity of this link is unknown.
Well, the PPP driver does know how much data is in the PPP queue and
the goal here is to keep the PPP queue large enough so based on the
compressibility of data the link will always have data to send, but not
large enough to cause issues with the transport layer.  Once this works
well for a single ppp link, I was planning on using teql to stripe data
over multiple iridium phone links.

Thanks again for your help

Best Regards

	Pat


>>-----Original Message-----
>>From: Paul Mackerras [mailto:paulus@samba.org] 
>>Sent: Thursday, August 25, 2005 7:15 AM
>>To: Feighery,Patrick D.
>>Cc: linux-ppp@vger.kernel.org
>>Subject: Re: Current size of PPP transmit queue
>>
>>Feighery,Patrick D. writes:
>>
>>> I have an application that needs to know the number of
packets/bytes
>>> that are currently in ppp's transmit queue.  My understanding is no
>>> utility currently exists to capture and display this 
>>attribute - please
>>> correct me if I misspeak.
>>
>>The flow of data is from the network code into the ppp_generic
module,
>>and from there to the ppp_async module (assuming you're doing PPP
over
>>an async serial port), and then to the serial driver.  Both the
>>ppp_generic and the ppp_async modules buffer no more than one packet.
>>The network code and the serial driver have queues in them.  I don't
>>know of any utility that can display how much is buffered at the
>>various points.
>>
>>> I've been going the kernel (2.6.5) trying to find this 
>>queue (which I
>>> assume is in the serial driver) so I can write an ioctl to get this
>>> information to my application.  I'm familiar with other operating
>>> systems, but this is my first real time going through the 
>>linux kernel.
>>> Any pointer to this information and how I can get hold of 
>>it would be
>>> greatly appreciated.
>>
>>Which level are you most interested in?  The ppp_generic and
ppp_async
>>modules are probably the least interesting in terms of having the
>>least amount of data buffered.
>>
>>In any case, adding an attribute in the sysfs filesystem is probably
a
>>better approach than a new ioctl.
>>
>>Paul.
>>
