From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Fri, 15 Oct 2004 16:52:30 +0000
Subject: Re: absolutely baffled as to why PPP link doesn't allow pings
Message-Id: <Pine.LNX.4.60.0410151246550.12109@localhost.localdomain>
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

sorry, i did try to provide enough detail regarding the configuration
of the host once the PPP link was apparently up:

> 	- Connecting the embedded system (running an unknown version
>           of PPP) to a Windows box works fine.

yup.  worked flawlessly.

> 	- Connecting the embedded system (again, unknown PPP) to a
>           Linux box running pppd fails.

oops, yes, version numbers would have been useful, sorry.  both
systems are running PPP 2.4.1.  the embedded system is running a
2.4.22-pre8 kernel, while the host is running a 2.6.5 kernel.

> Assuming that's right, try "noccp" on the Linux box.  I see that
> you've negotiated CCP with the Deflate algorithm.  That never would
> have happened when talking to a Windows system, and it's possible that
> one side or the other has bugs with data compression.  The symptoms of
> bugs there would be _exactly_ what you're now seeing.

ok, i'll give it a shot.  one of the things we did was loaded the
"options" file on the host with every no-compression option we could
find, since we initially suspected a problem with compression.  but
we'll try it with just that additional option, thanks.

since we have no /etc/ppp/options file on the embedded system (it's
all crammed onto the call to pppd), i'll stick that into the options
file on the host.  i'll let you know.  thanks.

rday
