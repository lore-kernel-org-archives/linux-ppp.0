From: James Carlson <carlsonj@workingcode.com>
Date: Fri, 09 May 2008 18:06:20 +0000
Subject: Re: PPPd ioctl, please help!
Message-Id: <18468.37532.591441.525544@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <17153241.post@talk.nabble.com>
In-Reply-To: <17153241.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

rketcham writes:
> Dec 31 16:18:25 gumstix user.info kernel: TIOCSETD
> Dec 31 16:18:25 gumstix user.info kernel: I don't know what the hell you
> just sent... 0x80047437

That last one looks to me like PPPIOCGCHAN.  You're getting this
because the TIOCSETD ioctl before it didn't set N_PPP mode.

Did you implement your new device on tty_io.c, or did you just break
out in your own direction?  If it's the latter (which is consistent
with your other problems with ioctls), you might want to reconsider
doing that.

But if not, then read through the tty subsystem and figure out what
TIOCSETD does.  You need to do the same.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
