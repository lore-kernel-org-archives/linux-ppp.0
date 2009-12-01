From: Johannes Jakob <jj@globalways.net>
Date: Tue, 01 Dec 2009 09:24:30 +0000
Subject: Re: [PATCH] Re: [Openl2tp-users] OpenL2TP, multilink, ppp[PID] and bundle
Message-Id: <4279c9ed2a7083900ac678e5af7f80f9@imap.globalways.net>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


Hi Ben!
Hi Lists,

On Mon, 30 Nov 2009 10:47:27 +0000 (GMT), Ben McKeegan
<ben@netservers.co.uk> wrote:
> On Fri, 27 Nov 2009, Johannes Jakob wrote:
> 
>> With multilink disabled, radattr works fine and creates
>> /var/run/radattr.ppp0:
>>
>> RADATTR plugin wrote 8 line(s) to file /var/run/radattr.ppp0.
>>
>> but with enabled multilink it doesn't:
>>
>> rc_map2id: can't find tty /dev/ in map database
>> RADATTR plugin wrote 8 line(s) to file /var/run/radattr..
>>
>>
>> pppd in both cases did attach to ppp0, and ip-up gets called with
>> iface=ppp0, but at the time /var/run/radattr.$iface was written
>> pppd-radattr didn't know the interface the session had been attached to.
> 
> 
> Here's a patch we use for radattr that delays writing the file until the
> interface name is known.


Thank you very much for your patch! It is working absolutely great and as I
hoped it would (pppd-2.4.5)!

As I think you might have had other similar problems we have, what are your
experiences with openl2tp for dialin users in a large scale? Are there
problems still unsolved?



Currently I'm having trouble monitoring mlppp bundles. Is there any
reasonable and reliable way to check how many ppp links are in a bundle and
if they are up and running?
Because of it's nature, there aren't any pid files in /var/run/ except for
the bundle, ip, ifconfig and netstat aren't of any help, too.  Is there any
status plugin, that is multilink aware?


We are still looking for a patch to get pppd to name it's interfaces
ppp[PID] instead of ppp[incrementor], just changing the ifname didn't work
(of course ;)

# diff main.c.orig main.c
740,741c740,741
<     info("Using interface %s%d", PPP_DRV_NAME, ifunit);
<     slprintf(ifname, sizeof(ifname), "%s%d", PPP_DRV_NAME, ifunit);
---
>     info("Using interface %s%d", PPP_DRV_NAME, getpid());
>     slprintf(ifname, sizeof(ifname), "%s%d", PPP_DRV_NAME, getpid());


relevant messages:

sess 51907/65380: spawned pppd pid1763
rc_map2id: can't find tty /dev/ in map database
Using interface ppp31763
ioctl(SIOCSIFMTU): No such device (line 1188)
RADATTR plugin wrote 8 line(s) to file /var/run/radattr.ppp31763.
ioctl(SIOCSIFADDR): No such device (line 2332)
Interface configuration failed
Couldn't get PPP statistics: No such device
openl2tp send: sent PPP_UPDOWN_IND, 100 bytes
ioctl (SIOCGIFFLAGS): No such device (line 2292)
ioctl(SIOCSIFADDR): No such device (line 2452)
sent [IPCP TermReq id=0x2 "Interface configuration failed"]
rcvd [IPCP TermAck id=0x2]
Couldn't get PPP statistics: No such device
ioctl(SIOCSIFMTU): No such device (line 1188)
PPPoL2TP options: sendseq lnsmode tid 51907 sid 65380 debugmask 10
sent [LCP TermReq id=0x3 "No network protocols running"]
rcvd [LCP TermAck id=0x3]
Connection terminated.
RADATTR plugin removed file /var/run/radattr.ppp31763.



I know that rp-l2tp provides an option to set interface names with PID, but
we are using OpenL2TP ;)




Again, Ben, thanks a lot for your patch, you saved my day!

Thanks for any other hint to anybody how want's to help me out on the other
issues ;)


Greetings,

Johannes Jakob
