From: ck@conrad-kostecki.de
Date: Fri, 27 Mar 2015 21:42:37 +0000
Subject: PADO answer incoming wrong VLAN since new linecard
Message-Id: <6a9afa782078cc73baeab500ddd86537@conrad-kostecki.de>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi There!
I've been running pppd for years with my PPPoE connection. That was 
working perfectly fine until yesterday.
I am not able to connect via PPPoE anymore, because after I am sending 
an PADI, the received PADO is incoming on a wrong VLAN.

That happend, after the linecard outside has been changed by my ISP. It 
was an Infineon 11.5.3, when it was working and stopped working, after 
it has been changed to a Broadcom 164.34.

Basically, my setup is, that I've to connect via vlan7. I am sending my 
requests on that specific vlan7. But now, after that, I am getting the 
PADO on vlan8, which now causes the problem, that pppd thinks, that 
there is no answer to the PADI request.

That also seems not to be a distribution problem. I am using Gentoo, but 
I've tried also Ubuntu and OpenSUSE. All distributions showed the same 
error. I've tried pppd 2.4.5, 2.4.6 and 2.4.7.

BUT!
If I am using a BSD-Distribution (like pfSense) or an external hardware 
router (like Fritz!Box), those are perfectly working fine. Those systems 
can connect via PPPoE, the PADO answer is getting there on the correct 
VLAN back (7).

So, what is going? Why does Linux PPP seems to have problems, where 
other systems do not have a problem?
Can anybody help? After my tests, I am just thinking, that there is some 
sort if a bug.. I mean, if was working for years fine and now stopped?

Here is an example paket file:
No VLAN: http://www.bl4ckb0x.de/ppp32/eth3.bin
VLAN7: http://www.bl4ckb0x.de/ppp32/eth3.7.bin
VLAN8: http://www.bl4ckb0x.de/ppp32/eth3.8.bin

Thanks!
Conrad

