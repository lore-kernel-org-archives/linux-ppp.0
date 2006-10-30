From: Christian <crich-ml@beronet.com>
Date: Mon, 30 Oct 2006 13:44:54 +0000
Subject: Re: Way how frames are read in pppd
Message-Id: <454601D6.5040109@beronet.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <4540C35F.9010104@beronet.com>
In-Reply-To: <4540C35F.9010104@beronet.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello James,

>It's still not at all clear to me what you're trying to do, or why
>you're doing it.
>
>You're using async devices here -- ptys -- so why are you expecting
>synchronous behavior?
>
>  
>

OK, maybe i do not understand everything correctly, let me in short
explain what i have:

I have a device which gives me a function to transmit data in a hdlc
frame, so i can just call some function like:

tx_frame(char *p, int l);

and i can be sure the data will come out on the other side in exactly 1
hdlc frame with size l.

on the other hand i have installed a callback like

rx_frame(char *p, int l);

where i receive the data from exactly 1 hdlc frame with length l.

It means i'm handling data directly without any knowledge of hldc,
because the controller supports hdlc coding/decoding.

then i tried to use pppd with stdin/stdout, but this obviously did not
work, because there is no boundaries in stdin/stdout so it will fail
when data packets increase in size or in speed, also i needed to enable
the sync option which made it work for a few small slowly coming packets.

I assume sync=no hdlc, and when not using the sync option pppd will do
hdlc on stdin/stdout, maybe you can enlighten that to me a bit?

I have read that i can set a pty end into N_HDLC mode, so that each read
returns exactly 1 packet, do you think i can handle my task in that way ?


I hope very much you can help me,

Christian

