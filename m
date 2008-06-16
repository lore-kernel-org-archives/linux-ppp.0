From: James Chapman <jchapman@katalix.com>
Date: Mon, 16 Jun 2008 14:38:00 +0000
Subject: Re: ppp on 2.6.18
Message-Id: <48567AC8.3080404@katalix.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <a1d91fa0806160536r646577e2n7099431aa934a556@mail.gmail.com>	 <48566242.1080306@katalix.com>	 <18518.29942.550676.275051@gargle.gargle.HOWL> <a1d91fa0806160719u3dc02e20w50f7e02570cd21f3@mail.gmail.com>
In-Reply-To: <a1d91fa0806160719u3dc02e20w50f7e02570cd21f3@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mohammed shareef <mdshareef@gmail.com>
Cc: James Carlson <carlsonj@workingcode.com>, omap <linux-omap@vger.kernel.org>, linux-ppp@vger.kernel.org

mohammed shareef wrote:
> I downloaded a 2.4.4 ppp package and did the following to compile it
> for my omap-osk:
> 
> ./configure --host=arm-linux --prefix=/root/Desktop/pppbuild
> make
> make install

The configure script isn't one that supports cross compilation, 
unfortunately. So it is likely that you built files for your native 
desktop system.

To cross compile, do
make CC=arm-linux-gcc LD=arm-linux-ld

but make sure that your compiler uses its own version of the system 
headers, not your desktop versions.


-- 
James Chapman
Katalix Systems Ltd
http://www.katalix.com
Catalysts for your Embedded Linux software development

