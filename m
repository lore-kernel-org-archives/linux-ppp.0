From: Bill Unruh <unruh@physics.ubc.ca>
Date: Mon, 23 Jul 2007 16:23:13 +0000
Subject: Re: Can we run a PPP server & client simultaneously???
Message-Id: <Pine.LNX.4.64.0707230920300.26784@info.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <11741524.post@talk.nabble.com>
In-Reply-To: <11741524.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Mon, 23 Jul 2007, LeeD wrote:

>
> Is it possible for linux to support both a PPP server and PPP client (with
> dial on demand) simultaneously on the same serial port?

ppp is peer to peer, so any ppp is both a client and a server at the same
time. However one serial port or modem can only be used for one connection
at a time. not for more than one at a time.

>
> I have a PPP client setup to support dial on demand, however this locks the
> serial port preventing any call answering programs (such as mgetty) from
> using the same serial port and modem.

Stop using dial on demand. It is completely useless when you are connected
as a server anyway. Ie, if you want to use outgoing ppp, just run a progrm
to start it instead of trying to do on demand.

>
> I have seen server advertised which offer both PPP client and server, so how
> to they do it?
>
> Regards,
>
> Lee
>

-- 
William G. Unruh   |  Canadian Institute for|     Tel: +1(604)822-3273
Physics&Astronomy  |     Advanced Research  |     Fax: +1(604)822-5324
UBC, Vancouver,BC  |   Program in Cosmology |     unruh@physics.ubc.ca
Canada V6T 1Z1     |      and Gravity       |  www.theory.physics.ubc.ca/
