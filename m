From: David Fernandez <david.fernandez.work@googlemail.com>
Date: Thu, 26 Oct 2017 10:39:53 +0000
Subject: SOLVED: kernel-mode PPPoE does not seem able to work with MPPE.
Message-Id: <7587137d-f9ae-a4ac-843e-6688af5ff017@googlemail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-ppp@vger.kernel.org

On 25/10/17 18:45, David Fernandez wrote:
> On 24/10/17 13:09, David Fernandez wrote:
>> On 24/10/17 09:52, David Fernandez wrote:
>>> Hi there,
>>>
>>> I've tried to run MPPE in a PPPoE connection to my LEDE linux 
>>> server. The log is below.
>>>
>>> Looking at wireshark traces, it seems to negotiate mschap-v2 and 
>>> mppe fine, but then ppp seems not to accept encrypted payloads.
>>>
>>
>>> Although it should not be needed, if I use the option require-mppe, 
>>> pppd complains of unrecognized option.
>>>
>>> If I grep for mppe in the 2.4.7 sources downloaded by the LEDE build 
>>> system, I see that it appears only in the pptp plugin, which is 
>>> strange, as the mppe options are in the pppd manual page as 
>>> generally available ones.
>>>
>>> I've tried to load both plugins (rp-pppoe.so and pptp.so) in an 
>>> attempt to have the mppe working with require-mppe, but the result 
>>> seems the same (unrecognized option).
>>>
>> On this bit, looking at the sources I found that the way it works is 
>> by making the option like:
>> mppe require
>> I guess that this should be updated in the manual...
>> With it I get this logging line:
>> Feb  3 09:09:16 LEDE pppd[3307]: mppe xxx # [don't know how to print 
>> value]#011#011# (from /etc/ppp/pppoe-server-options)
>> Everything else is the same.
>> So I guess this is some kind of bug in pppd/ccp.c?
>>
>>> Anybody knows why it does not work as expected?
>>>
>>> (started with pppoe-server -k -C myserver -S myservice -I eth1)
>>>
>>>
>>> Feb  2 12:05:20 LEDE pppoe-server[1580]: Session 1 created for 
>>> client 7c:d3:0a:15:22:49 (10.67.15.1) on eth1 using Service-Name 
>>> 'myservice'
>>> Feb  2 12:05:20 LEDE pppd[1580]: Plugin /etc/ppp/plugins/rp-pppoe.so 
>>> loaded.
>>> Feb  2 12:05:20 LEDE pppd[1580]: RP-PPPoE plugin version 3.8p 
>>> compiled against pppd 2.4.7
>>> Feb  2 12:05:20 LEDE modprobe: failed to find a module named 
>>> netdev-10.0.0.1
>>> Feb  2 12:05:20 LEDE modprobe: failed to find a module named 
>>> netdev-10.0.0.1
>>> Feb  2 12:05:20 LEDE pppd[1580]: pppd options in effect:
>>> Feb  2 12:05:20 LEDE pppd[1580]: debug#011#011# (from 
>>> /etc/ppp/pppoe-server-options)
>>> Feb  2 12:05:20 LEDE pppd[1580]: nodetach#011#011# (from command line)
>>> Feb  2 12:05:20 LEDE pppd[1580]: dump#011#011# (from 
>>> /etc/ppp/pppoe-server-options)
>>> Feb  2 12:05:20 LEDE pppd[1580]: plugin 
>>> /etc/ppp/plugins/rp-pppoe.so#011#011# (from command line)
>>> Feb  2 12:05:20 LEDE pppd[1580]: require-mschap-v2#011#011# (from 
>>> /etc/ppp/pppoe-server-options)
>>> Feb  2 12:05:20 LEDE pppd[1580]: name myserver#011#011# (from 
>>> /etc/ppp/pppoe-server-options)
>>> Feb  2 12:05:20 LEDE pppd[1580]: eth1#011#011# (from command line)
>>> Feb  2 12:05:20 LEDE pppd[1580]: rp_pppoe_service myservice#011#011# 
>>> (from command line)
>>> Feb  2 12:05:20 LEDE pppd[1580]: rp_pppoe_sess 
>>> 1:7c:d3:0a:15:22:49#011#011# (from command line)
>>> Feb  2 12:05:20 LEDE pppd[1580]: eth1#011#011# (from command line)
>>> Feb  2 12:05:20 LEDE pppd[1580]: rp_pppoe_service myservice#011#011# 
>>> (from command line)
>>> Feb  2 12:05:20 LEDE pppd[1580]: rp_pppoe_sess 
>>> 1:7c:d3:0a:15:22:49#011#011# (from command line)
>>> Feb  2 12:05:20 LEDE pppd[1580]: noaccomp#011#011# (from command line)
>>> Feb  2 12:05:20 LEDE pppd[1580]: default-asyncmap#011#011# (from 
>>> command line)
>>> Feb  2 12:05:20 LEDE pppd[1580]: mru 1492#011#011# (from command line)
>>> Feb  2 12:05:20 LEDE pppd[1580]: mtu 1492#011#011# (from command line)
>>> Feb  2 12:05:20 LEDE pppd[1580]: nopcomp#011#011# (from command line)
>>> Feb  2 12:05:20 LEDE pppd[1580]: lcp-echo-failure 2#011#011# (from 
>>> /etc/ppp/pppoe-server-options)
>>> Feb  2 12:05:20 LEDE pppd[1580]: lcp-echo-interval 10#011#011# (from 
>>> /etc/ppp/pppoe-server-options)
>>> Feb  2 12:05:20 LEDE pppd[1580]: noipdefault#011#011# (from 
>>> /etc/ppp/pppoe-server-options)
>>> Feb  2 12:05:20 LEDE pppd[1580]: nodefaultroute#011#011# (from 
>>> /etc/ppp/pppoe-server-options)
>>> Feb  2 12:05:20 LEDE pppd[1580]: netmask 255.0.0.0#011#011# (from 
>>> /etc/ppp/pppoe-server-options)
>>> Feb  2 12:05:20 LEDE pppd[1580]: 10.0.0.1:10.67.15.1#011#011# (from 
>>> command line)
>>> Feb  2 12:05:20 LEDE pppd[1580]: pppd 2.4.7 started by root, uid 0
>>> Feb  2 12:05:20 LEDE pppd[1580]: Connected to 7c:d3:0a:15:22:49 via 
>>> interface eth1
>>> Feb  2 12:05:20 LEDE pppd[1580]: Using interface ppp0
>>> Feb  2 12:05:20 LEDE pppd[1580]: Connect: ppp0 <--> eth1
>>> Feb  2 12:05:22 LEDE pppd[1580]: peer from calling number 
>>> 7C:D3:0A:15:22:49 authorized
>>> Feb  2 12:05:22 LEDE pppd[1580]: MPPE 128-bit stateful compression 
>>> enabled
>>> Feb  2 12:05:22 LEDE pppd[1580]: local  IP address 10.0.0.1
>>> Feb  2 12:05:22 LEDE pppd[1580]: remote IP address 10.67.15.1
>>> Feb  2 12:05:22 LEDE pppd[1580]: Unsupported protocol 0xc8c8 received
>>> Feb  2 12:05:22 LEDE pppd[1580]: Unsupported protocol 0x3d received
>>> Feb  2 12:05:22 LEDE pppd[1580]: Unsupported protocol 0x79 received
>>> Feb  2 12:05:22 LEDE pppd[1580]: Unsupported protocol 'PPP Muxing' 
>>> (0x59) received
>>> Feb  2 12:05:22 LEDE pppd[1580]: Unsupported protocol 0x2805 received
>>> Feb  2 12:05:26 LEDE pppd[1580]: Unsupported protocol 0xf6a9 received
>>> Feb  2 12:05:29 LEDE pppd[1580]: Unsupported protocol 0x2e59 received
>>> ...
>>
> Seems that this problem was kind of reported here as this:
>
> I Found it originally here: 
> https://www.spinics.net/lists/linux-ppp/msg01106.html
>
> It is indeed in the list here: 
> https://marc.info/?l=linux-ppp&m9753728204109&w=2
>
> Seems that it does solve two problems, but not all of them... Anyway, 
> it seems that it is an olde kernel version problem, as I'm using 
> kernel 4.4 and this might be fixed entirely in modern kernels...
>
> I'll check what the latest kernel ppp_mppe.c looks like.

Right, seems that the latest kernel has not bother with this at all (at 
least in kernel.org).

The two patches proposed in the links above are basically all that is 
needed AFAICS, only that the first one seems wrong in using only ccount 
to avoid the first re-rekeying, as ccount will wrap around to 0 every 
now and then, so this is the patch that works for me (applied to LEDE 
kernel 4.4.45, I guess it will apply fine to later kernels, only the 
line numbers might be different).

--- a/drivers/net/ppp/ppp_mppe.c
+++ b/drivers/net/ppp/ppp_mppe.c
@@ -521,11 +521,12 @@ mppe_decompress(void *arg, unsigned char
                 state->sanity_errors += 100;
                 goto sanity_error;
         }
-       if (state->stateful && ((ccount & 0xff) = 0xff) && !flushed) {
+       if (state->stateful && ((ccount & 0xff) = 0xff) && !flushed) {/*
                 printk(KERN_DEBUG "mppe_decompress[%d]: FLUSHED bit not 
set on "
                        "flag packet!\n", state->unit);
                 state->sanity_errors += 100;
-               goto sanity_error;
+               goto sanity_error;*/
+                flushed = 1;
         }

         /*
@@ -586,8 +587,11 @@ mppe_decompress(void *arg, unsigned char
                                  */
                         }
                 }
-               if (flushed)
+               if (flushed && (state->bits & 1) != 0)
                         mppe_rekey(state, 0);
+                else
+                if ((state->bits & 1) = 0 && ccount = 0 && flushed)
+                  state->bits |= 1;
         }

         /*

Basically use the state->bits & 1 as a start flag, given that they are 
not used at all in the decompressor, is a way of quickly doing it with 
minimal changes... Feel free to add a proper boolean to the state 
structure and make it more obvious, but with thos two things I get it 
working just fine for a long while now.

Regards

