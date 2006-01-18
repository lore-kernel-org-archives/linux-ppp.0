From: Bill Unruh <unruh@physics.ubc.ca>
Date: Wed, 18 Jan 2006 17:19:55 +0000
Subject: Re: advice needed
Message-Id: <Pine.LNX.4.61.0601180916490.19177@info.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <43CE76A1.1020409@asist-traffic.com>
In-Reply-To: <43CE76A1.1020409@asist-traffic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Wed, 18 Jan 2006, Babarovic Ivica wrote:

> Hi!
>
> I have a working setup with a vxworks machine sending
> data over GPRS modem. It sets up a modem and establish
> a ppp link with provider.
>
> Now I have to send some additional data(pictures) which hardware
> that vxworks runs on cannot provide. That's why I included a small
> industrial board with framegraber an put linux on it. Basically I inserted
> this linux box between vxworks box and a GPRS modem connecting
> them with serial lines.
>
> Since I need to keep vxworks setup and programs untouched  (it needs to
> work as
> plug in linux box, plug out linux box) I've come with a following idea.
>
> I made a program that connects serial ports on linux board so vxworks
> box can
> freely access modem across linux box and initialize it. I'm catching the
> "CONNECT" string here  and after that, I break the serial port
> connection/exit
> program. I start ppp link on serial side towards vxworks and that makes
> it happy.
>
> Now the problem comes when I want to attach to a connected stream towards
> modem on linux. Remember this stream was created by vxworks box.
> I thought I want be having any problems but pppd refuses to connect or
> refuses to attach itself to this stream and start ppp negotiation.
> I thought pppd will behave similar as when manually dialing to a provider.
> Scenario: Minicom, dial, connect, exit minicom, start pppd, ppp link
> comes up.
>
> But for some reason pppd refuses this for the stream vxworks box created.
>
> All I get in log is: pppd 2.4.3 started by root, uid 0
> no further lines.
>
> Let me add that if I kill this stream somehow(enter minicom and exit)
> I can easily establish my own link from scratch. But of course this needs
> to be automated. So what do you think is causing pppd not to establish
> ppp link with the stream vxworks creates?

Because it is already a ppp link. YOu cannot negotiate another ppp link on
top of a ppp link.

And you now have horrendous timing problems. How do you make sure your
linux box does not send data interleaved with the data from the vxbox?


Can your vsworks box support ethernet? If it can just make an ethernet
connection from Linux to the vxworks. (I have no idea what a vxworks box is
so can make no suggestions)

Why not have the linux box do everything the vxbox does.

>
>
> I hope I was clear enough since my English is a bit basic. If not please ask
> for whatever info you need. I'll provide.
>
>
