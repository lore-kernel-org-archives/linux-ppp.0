From: Thomas Chen <tchen@on-go.com>
Date: Tue, 04 May 2004 23:05:02 +0000
Subject: Re: ppp MULTILINK issue / problem
Message-Id: <BCBD9931.591%tchen@on-go.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <BCBD226C.57C%tchen@on-go.com>
In-Reply-To: <BCBD226C.57C%tchen@on-go.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

this is what james sent me:

in the userland pppd main loop, it calls get_input
and in get_input, if the packet length is 0, it assume the link
is bad and print out "Modem Hangup"

if someone can tell me what it IS SUPPOSED to do, i can trace
it down and report back the issue

when the modem line drop, the CARRIER DETECT should go away, and
serial driver (lowest level) should send SIG_HANGUP to someone (to
the userland pppd or kernel ppp) ???  and when that does happen

should kernel ppp automaitcally disassociate the link or wait for
the userland PPPD to call ioctl to do that ???

thanks



thomas chen writes:
> when i disconnect the phone cable of LINE 2 (2nd line)...
> in the userland application PPPD, get_input (called in the main loop)
> it actually think the first (master link) MODEM hangs up, and drop the link
> all togehter...
> 
> is this right ?

It sure looks broken, and it looks to me like a Linux kernel problem.

That SIGHUP comes from the kernel -- it's the kernel's responsibility
to notify the correct daemon.

That said, I see no good way to explain what you're seeing.  It
doesn't make sense.  You'll need to contact someone who maintains the
Linux kernel code.

(The logs you're showing now would be helpful to forward to the
mailing list.)

> May  4 13:44:08 sys_1u pppd[1298]: Serial connection established.
> May  4 13:44:12 sys_1u pppd[1298]: Connect:  <--> /dev/ttyR0
> May  4 13:44:16 sys_1u pppd[1298]: Using interface ppp0
> May  4 13:44:16 sys_1u pppd[1298]: New bundle ppp0 created
> May  4 13:44:16 sys_1u modprobe: modprobe: Can't locate module ppp-compress-21
> May  4 13:44:16 sys_1u /etc/hotplug/net.agent: assuming ppp0 is already up
> May  4 13:44:16 sys_1u kernel: PPP Deflate Compression module registered
> May  4 13:44:16 sys_1u kernel: PPP Deflate Compression module registered
> May  4 13:44:16 sys_1u modprobe: modprobe: Can't locate module ppp-compress-21
> May  4 13:44:16 sys_1u pppd[1298]: Deflate (15) compression enabled
> May  4 13:44:16 sys_1u pppd[1298]: local  IP address 10.100.200.1
> May  4 13:44:16 sys_1u pppd[1298]: remote IP address 10.100.200.10

That all looks good.

> May  4 13:46:06 sys_1u pppd[1355]: Serial connection established.
> May  4 13:46:10 sys_1u pppd[1355]: Connect:  <--> /dev/ttyR2
> May  4 13:46:14 sys_1u pppd[1355]: Using interface ppp0
> May  4 13:46:14 sys_1u pppd[1355]: Link attached to ppp0

That looks like normal multilink.

> AFTER I unplug the 2nd phone cable  (NOTE i unplug the second line
> but it is the FIRST process that indicate MODEM HANG UP)!!!!!
> 
> 
> May  4 13:51:55 sys_1u pppd[1298]: Modem hangup
> May  4 13:51:55 sys_1u pppd[1298]: Connection terminated.
> May  4 13:51:55 sys_1u pppd[1298]: Connect time 7.8 minutes.
> May  4 13:51:55 sys_1u pppd[1298]: Sent 7002 bytes, received 3353 bytes.
> May  4 13:51:55 sys_1u /etc/hotplug/net.agent: NET unregister event not
> supported

Assuming there's nothing obvious amiss (such as a mislabeled cable
that actually connects to /dev/ttyR0 rather than /dev/ttyR2), it looks
like you have the makings of a kernel bug here.

-- 
James Carlson, IP Systems Group                <james.d.carlson@sun.com>
Sun Microsystems / 1 Network Drive         71.234W   Vox +1 781 442 2084
MS UBUR02-212 / Burlington MA 01803-2757   42.497N   Fax +1 781 442 1677







on 5/4/04 3:45 PM, Paul Mackerras at paulus@samba.org wrote:

> Thomas Chen writes:
> 
>> now i am testing "UNBUNDLING" of the link.... if i unplug
>> the one of the modem (not the master link), i do not see
>> the IP traffic anymore, though i do see data on the serial
>> link (i put a serial line monitor on the serial port),
>> but no more IP packets coming out of PPP
> 
> Does the pppd process that is controlling the link that you unplug see
> the disconnection?  Use the debug flag to pppd and look for a message
> in the logs like "Modem hangup".  If pppd doesn't see that the link
> has gone it won't take it out of the bundle.
> 
> Paul.
> 

