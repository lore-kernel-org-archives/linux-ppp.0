From: Babarovic Ivica <ivica@asist-traffic.com>
Date: Thu, 19 Jan 2006 11:36:33 +0000
Subject: Re: advice needed
Message-Id: <43CF79C1.4090804@asist-traffic.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <43CE76A1.1020409@asist-traffic.com>
In-Reply-To: <43CE76A1.1020409@asist-traffic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

Bill Unruh wrote:

> On Wed, 18 Jan 2006, Babarovic Ivica wrote:
>
>> Hi!
>>
>> I have a working setup with a vxworks machine sending
>> data over GPRS modem. It sets up a modem and establish
>> a ppp link with provider.
>>
>> Now I have to send some additional data(pictures) which hardware
>> that vxworks runs on cannot provide. That's why I included a small
>> industrial board with framegraber an put linux on it. Basically I
>> inserted
>> this linux box between vxworks box and a GPRS modem connecting
>> them with serial lines.
>>
>> Since I need to keep vxworks setup and programs untouched  (it needs to
>> work as
>> plug in linux box, plug out linux box) I've come with a following idea.
>>
>> I made a program that connects serial ports on linux board so vxworks
>> box can
>> freely access modem across linux box and initialize it. I'm catching the
>> "CONNECT" string here  and after that, I break the serial port
>> connection/exit
>> program. I start ppp link on serial side towards vxworks and that makes
>> it happy.
>>
>> Now the problem comes when I want to attach to a connected stream
>> towards
>> modem on linux. Remember this stream was created by vxworks box.
>> I thought I want be having any problems but pppd refuses to connect or
>> refuses to attach itself to this stream and start ppp negotiation.
>> I thought pppd will behave similar as when manually dialing to a
>> provider.
>> Scenario: Minicom, dial, connect, exit minicom, start pppd, ppp link
>> comes up.
>>
>> But for some reason pppd refuses this for the stream vxworks box
>> created.
>>
>> All I get in log is: pppd 2.4.3 started by root, uid 0
>> no further lines.
>>
>> Let me add that if I kill this stream somehow(enter minicom and exit)
>> I can easily establish my own link from scratch. But of course this
>> needs
>> to be automated. So what do you think is causing pppd not to establish
>> ppp link with the stream vxworks creates?
>
>
> Because it is already a ppp link. YOu cannot negotiate another ppp
> link on
> top of a ppp link.

Ppp link is not yet established by vxworks box since I disconnect the serial
line between vxworks box and modem immediately after I catch CONNECT string.
So when this happens:
CONNECT
~=FF}#.!}!}#} }9}"}&} }*} } }'}"}(}"}%}&..qq}#}%.#}%.};~~=FF}#.!}!}#} }9}"}=
&}

I break the serial line connection right after CONNECT string and unplug
the vxworks
side. Then I establish pppd over serial line with vxworks box without
problems with:
#!/bin/sh
exec /usr/sbin/pppd /dev/ttyS0 19200 novj novjccomp crtscts lock
proxyarp  192.168.254.150:192.168.254.151 debug


At the same time I try to connect linux pppd to the upper stream.:
~=FF}#.!}!}#} }9}"}&} }*} } }'}"}(}"}%}&..qq}#}%.#}%.};~~=FF}#.!}!}#} }9}"}=
&}
I guess, I naively expected this to work. When I tried same thing
manually with minicom
I saw things aren't working as I expected. I thought this was possible
since this was
my experience from the past and I read it in ppp howto. Maybe PPP over GPRS
is different.
I think I will just kill this stream and start a brand new GPRS ppp
connection from
linux side. Problem is that vxwoks side isn't happy until it gets
CONNECT string.
It constantly retry to init modem and dial out until CONNECT. As I mentioned
I can't mess with vxworks since it would require upgrading SW on a lot
of boxes.

BTW: How do I kill/clear the serial lines so I can start new connection?
Will +++ in chat script suffice?


> Can your vsworks box support ethernet? If it can just make an ethernet
> connection from Linux to the vxworks. (I have no idea what a vxworks
> box is
> so can make no suggestions)

Unfortunately there is no Ethernet on vxworks box. Things would be much
simpler that way. :)

>
>
> Why not have the linux box do everything the vxbox does.

Because software on vxworks box is configured that way. If I don't
give him what it wants at certain times it does all sort of
things(powers off modem, restarts itself, ...). I cannot change it. I
can but it would involve changing a lot of vxworks boxes and I wasn't to
keep them as they are. Programs on vxworks boxes expects certain things
on its serial ports at certain times and I have to make them happy with
a proper setup a linux box. :)

In short ... vxworks box must not notice there's anything between it and
modem.

regards,
i.B.

