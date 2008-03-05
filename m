From: Bill Unruh <unruh@physics.ubc.ca>
Date: Wed, 05 Mar 2008 22:31:28 +0000
Subject: Re: hanging tcsetattr call
Message-Id: <Pine.LNX.4.64.0803051429240.32362@info.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <15861511.post@talk.nabble.com>
In-Reply-To: <15861511.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Wed, 5 Mar 2008, bfc wrote:

>
> It seems when my chat script times out, i'll get an "alarm" notification from
> chat, then chat exits, and
> pppd hangs for a while on a tcsetattr() call -- it's trying to restore the
> terminal characteristics of
> our serial port.

Tell us how you set up yoru chat script. It should not be terminating while
pppd is running. It should start pppd when it successfully opens the port. 
So giving your details would be helpful.


>
> Eventually it syslogs:
> Mar  5 17:09:25 box pppd[21132]: tcsetattr: Interrupted system call (line
> 1001)
>
> Evidentally the pppd can no longer use the device, perhaps it's been reset
> from having an session attempted
> but not succeeding?  Anyone else ever see this problem?
>
> Should there be any signal flow that causes this to go correctly, e.g. a
> SIGCHLD going to the pppd?
> Or does pppd just see a non-zero exit value from chat, and should gracefully
> shut itself down?

???? chat runs. If it successfully connects it starts up pppd an exits.


>
> Thanks!
>

-- 
William G. Unruh   |  Canadian Institute for|     Tel: +1(604)822-3273
Physics&Astronomy  |     Advanced Research  |     Fax: +1(604)822-5324
UBC, Vancouver,BC  |   Program in Cosmology |     unruh@physics.ubc.ca
Canada V6T 1Z1     |      and Gravity       |  www.theory.physics.ubc.ca/
