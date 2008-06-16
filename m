From: "mohammed shareef" <mdshareef@gmail.com>
Date: Mon, 16 Jun 2008 14:31:35 +0000
Subject: Re: ppp on 2.6.18
Message-Id: <a1d91fa0806160719u3dc02e20w50f7e02570cd21f3@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <a1d91fa0806160536r646577e2n7099431aa934a556@mail.gmail.com>
	 <48566242.1080306@katalix.com>
	 <18518.29942.550676.275051@gargle.gargle.HOWL>
In-Reply-To: <18518.29942.550676.275051@gargle.gargle.HOWL>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Carlson <carlsonj@workingcode.com>
Cc: James Chapman <jchapman@katalix.com>, omap <linux-omap@vger.kernel.org>, linux-ppp@vger.kernel.org

I downloaded a 2.4.4 ppp package and did the following to compile it
for my omap-osk:

./configure --host=arm-linux --prefix=/root/Desktop/pppbuild
make
make install

then i copied the binaries to the filesystem of my omap. but when i
say: "pppd -h" the system hangs. i guess this is because my filessytem
files are not proper or i didnt compile them properly.
please help.
thank you,
regards

On Mon, Jun 16, 2008 at 7:43 PM, James Carlson <carlsonj@workingcode.com> wrote:
> James Chapman writes:
>> mohammed shareef wrote:
>> > Dear all,
>> >
>> > i have enabled ppp services when configuring the kernel 2.6.18.
>> >
>> > the kernel bootup  of omap5912 osk says this:
>> >
>> > PPP generic driver version 2.4.2
>> > PPP Deflate Compression module registered
>> > PPP BSD Compression module registered
>> >
>> > but when i type "pppd -h" in the osk console i get:
>> >
>> > # pppd -h
>> > -sh: pppd: not found
>>
>> You don't have the userspace pppd installed.
>
> Or your path is such that the shell cannot find it.
>
> --
> James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
>
