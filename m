From: Jaspreet Singh <jaspreet_sachdev@yahoo.com>
Date: Tue, 22 Jun 2004 16:58:12 +0000
Subject: Re: PPPd as a dialin server and dialout client
Message-Id: <20040622165812.77855.qmail@web50201.mail.yahoo.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20040622140754.68934.qmail@web50209.mail.yahoo.com>
In-Reply-To: <20040622140754.68934.qmail@web50209.mail.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Thank you all for the reply. Maybe I can do this using
"chat". Not sure if this will work.
-Jaspreet

--- "Milan P. Stanic" <mps@rns-nis.co.yu> wrote:
> On Tue, Jun 22, 2004 at 10:49:07AM -0400,
> carlsonj@workingcode.com wrote:
> > Jaspreet Singh writes:
> > > Is it possible to configure one PPPd as a dialin
> > > server and a dial out client? I have a situation
> where
> > > an incoming call should be handled and a dial on
> > > demand should be handled for the same port.
> > 
> > Handling the two instances on a single port
> shouldn't be a problem, as
> > pppd uses the traditional UUCP port locking
> scheme.
> > 
> > However, handling them from a single daemon
> wouldn't be supported by
> > the current code, and if these dial-in and
> dial-out instances need to
> > have the same IP addresses, then things get even
> more problematic.
> 
> I'm using mgetty in AUTO_PPP mode and diald
> (dial-on-demand) daemon
> for such servers for years. It would be better to
> have the same daemon
> to handle incoming/outgoing connections, but I don't
> know for such
> software. So, mgetty/diald is "good enough".
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
