From: Jaspreet Singh <jaspreet_sachdev@yahoo.com>
Date: Wed, 23 Jun 2004 01:53:53 +0000
Subject: Re: PPPd as a dialin server and dialout client
Message-Id: <20040623015353.5521.qmail@web50201.mail.yahoo.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20040622140754.68934.qmail@web50209.mail.yahoo.com>
In-Reply-To: <20040622140754.68934.qmail@web50209.mail.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi,
I initially thought that I could use two different
instances of pppd on the same port. One will be issued
in demand mode and the other waiting for a connection.

pppd /dev/ttyS0 demand connect /etc/ppp/ppp-on-dialer
pppd /dev/ttyS0 connect "chat -v CONNECT ''"

Yes, I am using the demand option rather than dial on
demand program. 

Regards,
Jaspreet
--- Bill Unruh <unruh@physics.ubc.ca> wrote:
> On Tue, 22 Jun 2004, Milan P. Stanic wrote:
> 
> > On Tue, Jun 22, 2004 at 09:58:59AM -0700, Bill
> Unruh wrote:
> > > Note that I would not use dial on demand, since
> the incoming connection
> > > is liable to want to go out as well, and that
> could cause problems. In
> > > many cases dial on demand is more trouble than
> it is worth.
> > 
> > Diald *will not* try to access ttyS? if it is
> locked by mgetty.
> 
> It is not clear that he is using diald. He is
> probably using the "new"
> dial on demand option withing pppd itself. I am not
> sure how it works
> with respect to locking of the device. 
> It would make sense that it releases the lock when
> it is waiting and
> respects locks which are present when it tries to
> connect. But "make
> sense" and "that is how it works" need not be
> synonymous.
> 
> 
> -
> To unsubscribe from this list: send the line
> "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at 
> http://vger.kernel.org/majordomo-info.html
> 



		
__________________________________
Do you Yahoo!?
New and Improved Yahoo! Mail - Send 10MB messages!
http://promotions.yahoo.com/new_mail 
