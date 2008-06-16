From: James Chapman <jchapman@katalix.com>
Date: Mon, 16 Jun 2008 15:22:14 +0000
Subject: Re: ppp on 2.6.18
Message-Id: <48568526.2080704@katalix.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <a1d91fa0806160536r646577e2n7099431aa934a556@mail.gmail.com>	 <48566242.1080306@katalix.com>	 <18518.29942.550676.275051@gargle.gargle.HOWL>	 <a1d91fa0806160719u3dc02e20w50f7e02570cd21f3@mail.gmail.com>	 <48567AC8.3080404@katalix.com> <a1d91fa0806160810l6341cef5hd0ed5c1115d8a9b8@mail.gmail.com>
In-Reply-To: <a1d91fa0806160810l6341cef5hd0ed5c1115d8a9b8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mohammed shareef <mdshareef@gmail.com>
Cc: James Carlson <carlsonj@workingcode.com>, omap <linux-omap@vger.kernel.org>, linux-ppp@vger.kernel.org

mohammed shareef wrote:
> Dear James,
> 
> i did the following as u said:
> 
> ./configure --target=arm-linux --enable-arm --prefix=/root/Desktop/pppbuild
> 
> make CC=arm-linux-gcc LD=arm-linux-ld
> 
> it compiles without any error;
> 
> but when i do:
> make install i get the following error:
> 
> install -d -m 755 /root/Desktop/pppbuild/sbin
> install -d -m 755 /root/Desktop/pppbuild/share/man/man8
> cd chat; make  install
> make[1]: Entering directory `/root/Desktop/ppp-2.4.4/chat'
> mkdir -p /root/Desktop/pppbuild/sbin /root/Desktop/pppbuild/share/man/man8
> install -s -c chat /root/Desktop/pppbuild/sbin
> strip: Unable to recognise the format of the input file

You need to add STRIP=arm-linux-strip and possibly 
INSTALL=arm-linux-install to the make install command line. If that 
fails, hack the -s out of the install command in chat/Makefile and strip 
the file by hand.

> `/root/Desktop/pppbuild/sbin/chat'
> install: strip process terminated abnormally
> make[1]: *** [install] Error 1
> make[1]: Leaving directory `/root/Desktop/ppp-2.4.4/chat'
> make: *** [install-progs] Error 2
> 
> thank you
> 
> On Mon, Jun 16, 2008 at 8:08 PM, James Chapman <jchapman@katalix.com> wrote:
>> mohammed shareef wrote:
>>> I downloaded a 2.4.4 ppp package and did the following to compile it
>>> for my omap-osk:
>>>
>>> ./configure --host=arm-linux --prefix=/root/Desktop/pppbuild
>>> make
>>> make install
>> The configure script isn't one that supports cross compilation,
>> unfortunately. So it is likely that you built files for your native desktop
>> system.
>>
>> To cross compile, do
>> make CC=arm-linux-gcc LD=arm-linux-ld
>>
>> but make sure that your compiler uses its own version of the system headers,
>> not your desktop versions.
>>
>>
>> --
>> James Chapman
>> Katalix Systems Ltd
>> http://www.katalix.com
>> Catalysts for your Embedded Linux software development
>>
>>
> 


-- 
James Chapman
Katalix Systems Ltd
http://www.katalix.com
Catalysts for your Embedded Linux software development

