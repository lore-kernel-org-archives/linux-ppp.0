From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Tue, 13 Apr 2004 16:28:52 +0000
Subject: Re: PPP connect hangs at "getlogname (AUTO_PPP), read:"
Message-Id: <Pine.LNX.4.58.0404131223550.10578@localhost.localdomain>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.LNX.4.58.0404130851580.8284@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.58.0404130851580.8284@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org



On Tue, 13 Apr 2004, James Carlson wrote:

> The very beginning.  There's no PPP data coming from this peer at all,
> and there should be.

ok, i think i've narrowed this down somewhat.  i've bypassed the scripts 
on the client side and typed in the pppd command manually, and here's what
happens:

# pppd -detach /dev/modem 9600 debug \
> connect "chat -v '' AT OK ATDT102 CONNECT '\d\c'"
Serial connection established.                     <-- a good sign
Couldn't get channel number: Invalid argument      <-- not a good sign
#

"Couldn't get channel number: Invalid argument"?  that sounds like a
fundamental problem at the kernel level, where the kernel itself is unable
to allocate something critical for PPP.

i'm about to go looking for that error message in the kernel source, but
it would go a long way to explaining why the client peer simply fails to 
even start talking PPP, no?

any hints as to what that error message means, and how to fix it, while
i'm hunting?

rday

p.s.  thanks loads for the help thus far, i'm feeling a bit out of my 
depth at the moment.  historically, i remember it being so much easier to 
configure PPP, but i wasn't working with a single-board computer running
embedded linux at the time. :-P
