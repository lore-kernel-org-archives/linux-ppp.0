From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Fri, 15 Oct 2004 18:45:03 +0000
Subject: Re: absolutely baffled as to why PPP link doesn't allow pings
Message-Id: <Pine.LNX.4.60.0410151442370.12564@localhost.localdomain>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.LNX.4.60.0410151211340.11955@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.60.0410151211340.11955@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Fri, 15 Oct 2004 carlsonj@workingcode.com wrote:

> Robert P. J. Day writes:
> >       host (10.1.1.96) <-> modem <-> teltone <-> embedded (10.1.1.97)
>
> So, if I understand this right (it's still hard to figure what you've
> done from the description provided):
>
> 	- Connecting the embedded system (running an unknown version
>           of PPP) to a Windows box works fine.
>
> 	- Connecting the embedded system (again, unknown PPP) to a
>           Linux box running pppd fails.
>
> Assuming that's right, try "noccp" on the Linux box.  I see that
> you've negotiated CCP with the Deflate algorithm.  That never would
> have happened when talking to a Windows system, and it's possible that
> one side or the other has bugs with data compression.  The symptoms of
> bugs there would be _exactly_ what you're now seeing.

well, we're making progress, although not the way i would have liked.
as a simple test, we just hooked up the serial ports of the systems
direct connect with a serial cable, and PPP worked just dandy.

putting the modems back in the circuit re-introduced the problem.  so
it could be the modems or the initialization strings we're using.
back to the drawing board ...

rday
