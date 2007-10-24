From: Bill Unruh <unruh@physics.ubc.ca>
Date: Wed, 24 Oct 2007 18:50:35 +0000
Subject: Re: ppp reconnects after receiving ConfReq id=0x3 <mru 1400>
Message-Id: <Pine.LNX.4.64.0710241146330.22475@info.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <64de5c8b0710241117t66196e80u8cc5109f5466133@mail.gmail.com>
In-Reply-To: <64de5c8b0710241117t66196e80u8cc5109f5466133@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Wed, 24 Oct 2007, Rajkumar S wrote:

> Hi,
>
> I am trying to connect to net via a USB CDMA device, on a debian etch
> system. I can configure ppp with out any problem and also connect to
> net, but after I connect ppp disconnects and reconnects frequently
> after receiving this message from the peer.
>
> rcvd [LCP ConfReq id=0x3 <mru 1400> <asyncmap 0x0> <auth chap MD5>
> <magic 0xfb6a0660>]
>
> my ppp config is:
>
> hide-password
> noauth
> connect "/usr/sbin/chat -v -f /etc/chatscripts/vsnl"
> debug
> /dev/ttyACM0
> 460800
> defaultroute
> replacedefaultroute
> noipdefault
> user "internet"
> ipparam vsnl
> usepeerdns
>
> This usually happens if there is a default gateway via ppp0 device.

I do not understand this statement. What is the purpose of the connection?
Is that supposed to be an ISP through which you connect to the rest of the
net, or is a peer yousimply want to connect to directly. If the latter,
then why make it your default gateway? 
I assume you mean by "there is a default gateway via ppp0" that you have
that defaultroute option, and when you do not have a default gateway you
have removed the defaultroute options from the ppp config file.

If this is not true, then what do you mean by that statement?

But as Carlson says, the problem seems not to be on your end, but on the
far end of your connection and that is where the solution will have to be
implimented.



> The  connection stays online for hours if there is no default gw. I am
> posting full logs at http://pastebin.ca/748250
>
> I am sitting behind this for couple of days with out any solution, any
> help to resolve this is much appreciated.
>
> raj
> -
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

-- 
William G. Unruh   |  Canadian Institute for|     Tel: +1(604)822-3273
Physics&Astronomy  |     Advanced Research  |     Fax: +1(604)822-5324
UBC, Vancouver,BC  |   Program in Cosmology |     unruh@physics.ubc.ca
Canada V6T 1Z1     |      and Gravity       |  www.theory.physics.ubc.ca/
