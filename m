From: Alan Cox <alan@redhat.com>
Date: Fri, 13 Jun 2008 19:38:16 +0000
Subject: Re: possible bug on ppp_async
Message-Id: <20080613193816.GA2386@devserv.devel.redhat.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <6b53b1990806091123l74a06bebu34160ad08366d1a8@mail.gmail.com>
In-Reply-To: <6b53b1990806091123l74a06bebu34160ad08366d1a8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Fri, Jun 13, 2008 at 03:01:52PM -0300, Gustavo Fernando Padovan wrote:
> > The problem seems the ioctl TCSETS, with the patch (and on kernel
> > 2.6.23) it returns immediately, and on kernel 2.6.24 (without the
> > patch) it goes to tty_mode_ioctl().

That is a fix for a long standing bug. It makes TCSETS/TCGETS work correctly
on a ppp session.  So the bug is in your user space code somewhere it appears
and just happens to be triggered by fixing other bugs.

