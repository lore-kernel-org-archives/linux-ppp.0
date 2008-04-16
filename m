From: Bill Unruh <unruh@physics.ubc.ca>
Date: Wed, 16 Apr 2008 18:20:31 +0000
Subject: RE: Install ppp modules
Message-Id: <Pine.LNX.4.64.0804161117590.7141@info.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <00bb01c89fde$e9dadd10$9602a8c0@saschaxp1>
In-Reply-To: <00bb01c89fde$e9dadd10$9602a8c0@saschaxp1>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Wed, 16 Apr 2008, Sascha Kiefer wrote:

> rpm and yum ...
>
> So, ppp has to build into the kernel? Can not run otherwise?
> Send an ticket to the provider ... Maybe he knows ...

No, it can be a module as well. But your system has no modules, which is
very very weird. (Or did you forget to look as root, rather than as a
user?)

So as root, do 
rpm -Uhv --force kernel-?????.rpm

To reinstall the kernel, if it is really true that there are no modules.
(but first log on as root, and make sure that there really are no modules
for your kernel.


>
> -----Original Message-----
> From: Bill Unruh [mailto:unruh@physics.ubc.ca]
> Sent: Mittwoch, 16. April 2008 21:55
> To: Sascha Kiefer
> Cc: linux-ppp@vger.kernel.org
> Subject: RE: Install ppp modules
>
>
> On Wed, 16 Apr 2008, Sascha Kiefer wrote:
>
>> I figured.
>> Can i reinstall the missing files? How?
>
> reinstall the kernel? I donot know Centos, so do not know how they install
> stuff (rpm?)
>
>>
>> -----Original Message-----
>> From: linux-ppp-owner@vger.kernel.org
>> [mailto:linux-ppp-owner@vger.kernel.org] On Behalf Of Bill Unruh
>> Sent: Mittwoch, 16. April 2008 21:40
>> To: Sascha Kiefer
>> Cc: linux-ppp@vger.kernel.org
>> Subject: RE: Install ppp modules
>>
>>
>> On Wed, 16 Apr 2008, Sascha Kiefer wrote:
>>
>>> Hi,
>>>
>>> /lib/modules/2.6.9-023stab043.1-smp is totally empty.
>>>
>>> Centos 5, i believe
>>
>> Something got really really screwed up in the installation.
>>
>>>
>>> On Wed, 16 Apr 2008, Sascha Kiefer wrote:
>>>
>>>> Hi,
>>>>
>>>> I have a v-server; godaddy.com ist my provider
>>>>
>>>> Linux ip-xxx-xxx-xxx-xxx.ip.secureserver.net 2.6.9-023stab043.1-smp
>>>> #1 SMP Mon Mar 5 16:35:19 MSK 2007 i686 i686 i386 GNU/Linux
>>>
>>> You do not tell us what distro this is. Try
>>> ppp_generic, ppp_async
>>> as modules to load.
>>>
>>>>
>>>> Ppp is not in the kernel
>>>>
>>>> /usr/sbin/pppd says:
>>>>
>>>> /usr/sbin/pppd: This system lacks kernel support for PPP.  This
>>>> could be because the PPP kernel module could not be loaded, or
>>>> because PPP was not included in the kernel configuration.  If PPP
>>>> was included as a module, try `/sbin/modprobe -v ppp'.  If that
>>>> fails, check that ppp.o exists in /lib/modules/`uname -r`/net. See
>>>> README.linux file in the ppp distribution for more details.
>>>>
>>>> /sbin/modprobe -v ppp says:
>>>> FATAL: Module ppp not found.
>>>>
>>>> Ok. I guess i can not rebuild the kernel.
>>>> What other options do i have?
>>>> I'm not that fmiliar with linux so please be gentle! ;)
>>>
>>> First look in config (/boot/config maybe) to see if PPP is in the
>>> kernel.
>>>
>>>
>>>>
>>>> Regards,
>>>> Sascha
>>>>
>>>>
>>>> --
>>>> To unsubscribe from this list: send the line "unsubscribe linux-ppp"
>>>> in the body of a message to majordomo@vger.kernel.org More majordomo
>>>> info at  http://vger.kernel.org/majordomo-info.html
>>>>
>>>
>>>
>>
>>
>
>

-- 
William G. Unruh   |  Canadian Institute for|     Tel: +1(604)822-3273
Physics&Astronomy  |     Advanced Research  |     Fax: +1(604)822-5324
UBC, Vancouver,BC  |   Program in Cosmology |     unruh@physics.ubc.ca
Canada V6T 1Z1     |      and Gravity       |  www.theory.physics.ubc.ca/
