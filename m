From: Sascha Kiefer <sk@intertivity.com>
Date: Wed, 16 Apr 2008 20:18:42 +0000
Subject: Re: Install ppp modules
Message-Id: <48065F22.3060308@intertivity.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <00bb01c89fde$e9dadd10$9602a8c0@saschaxp1>
In-Reply-To: <00bb01c89fde$e9dadd10$9602a8c0@saschaxp1>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Bill Unruh wrote:
> On Wed, 16 Apr 2008, Charlie Brady wrote:
>
>>
>> On Wed, 16 Apr 2008, Bill Unruh wrote:
>>
>>>  On Wed, 16 Apr 2008, Sascha Kiefer wrote:
>>>
>>> >   Hi,
>>> > >   /lib/modules/2.6.9-023stab043.1-smp is totally empty.
>>> > >   Centos 5, i believe
>>
>> That kernel is neither CentOS 4 nor CentOS 5 - but closer to the former.
>>
>>>  Something got really really screwed up in the installation.
>>
>> Perhaps. Another possibility is that somebody upgraded the kernel rpm 
>> and then hasn't yet rebooted.
>
> No idea how that would produce an installation with no modules. What 
> does ls /lib/modules
> give?
>
>
ls /lib/modules/
2.6.9-023stab043.1-smp

(i created that dir; it was not there before

ls /lib/modules/2.6.9-023stab043.1-smp/
modules.alias   modules.ieee1394map  modules.ofmap     modules.symbols
modules.ccwmap  modules.inputmap     modules.pcimap    modules.usbmap
modules.dep     modules.isapnpmap    modules.seriomap

(i made a  /sbin/depmod -ae)

not root, but used su
