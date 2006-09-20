From: James Carlson <carlsonj@workingcode.com>
Date: Wed, 20 Sep 2006 12:40:28 +0000
Subject: Re: syncppp
Message-Id: <17681.14012.758805.271099@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <4510F774.4080104@beronet.com>
In-Reply-To: <4510F774.4080104@beronet.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Christian writes:
> i'm trying to understand how ppp transports frames in the "sync" mode. I
> want to do the following scenario:

In sync mode, each write from pppd represents a complete PPP frame,
including the HDLC-like Address and Control fields, but not including
the trailing FCS or any 0-bit stuffing.

Each read returns a complete PPP frame, again including the HDLC-like
Address and Control fields, but not including the FCS or 0-bit
stuffing.

> I've hacked pppd  to use a simple framing method for stdin/stdout, to
> guarantee the transport of complete ppp frames.

I'm confused.  At what point are stdin/stdout connected to a sync
device that preserves frame boundaries?

> But unfortunately i
> found out, that in the tty.c i get mixed up frames from the
> master_pty_f, like i read a buffer and in the buffer i get :

If you're talking about ptys, then you're not talking about sync.

> so that is what i transmit to my sync device, but the other side rejects
> the second frame because it seems not valid.

Indeed.  It looks like you have an async stream (a pty pair) in the
way.

> I don't really understand yet where pppd reads the frames from the
> kernel device, maybe somebody could give me a pointer.

It happens in the read_packet() function.

> I just want to check if the frames come like that from the kernel or if
> it happens because the slave side pty-buffer gets full befor we can read
> it on the master side, so the framing is messed up.

I think using a pty pair and expecting sync-like operation to happen
is just a bug.  It won't work, because ptys are async serial emulation
devices.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
