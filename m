From: Christopher Fowler <cfowler@outpostsentinel.com>
Date: Thu, 20 Sep 2007 12:16:40 +0000
Subject: Re: ppp in D+ state
Message-Id: <1190290600.18387.25.camel@shuttle.linxdev.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <46EC9B4B.80809@poste.it>
In-Reply-To: <46EC9B4B.80809@poste.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I had this same problem but my solution may not be a good one.  I had a
server that worked flawlessly for 2 years. It only had 512m of memory
and we decided to upgrade.  I added 2 GB to make a total of 2.5GB.  This
system ran 2.6.5 kernel with FC2.  After the upgrade I saw this problem.
We use vtun and run pppd that way so after about 3 days I would see at
least a 100 pppd processes like this.  Kill -9 did not work and load
average was at 100+.  The system become non-responsive.  I could not log
in.  Luckily I invested in intelligent power strips that saved me a trip
to the data center.  To fix this problem I would issue an off then on
command to the strip for that outlet.  I thought it might have been a
memory issue but I downloaded the 2.6.10 kernel upgrade for FC2,
compiled it and my problem went away.  I'm not sure what was causing
this issue but it only started when I went from 512m to 2.5G of ram.

On Thu, 2007-09-20 at 02:07 -0400, Zygo Blaxell wrote:
> In article <46EC9B4B.80809@poste.it>,
> Michele Mencacci  <shire@inwind.it> wrote:
> >Hello there,
> >I don't know since when, ( before I had 2.6.16 and now I'm passed to
> >2.6.22.3), but now pppd while is running, it stops, or better it's live,
> >but I can't send or receive....and if I kill it, it hangs-up the modem,
> >but it remain live in D+state and I can only reboot the linux box  :(
> >Instead with 2.6.16 it works fine...well sometime it stops but I can
> >kill and restart, but less often than 2.6.22.
> >It appears to be random.....any hints?
> 
> For what it's worth I see this too (2.6.22.1).
> 
> pppd goes into D state, and so does 'ifconfig' and several other
> programs that try to use ioctl calls to enumerate network interfaces.
> Eventually every process on the system is in D state and I have to reboot
> to get anything to work.
> 
> I have two ADSL PPPoE feeds.  The second feed continues to work after the
> first goes down, except that if the second feed goes down too, its pppd
> process gets into the same state.  Actually all attempts to bring any
> network interface up or down have the same result:  the process trying to
> do this ends up in D state.
> 
> Sometimes, though not always, there is a kernel log message which complains
> that the ppp interface has reference count = 1.
> 
> I've also used 2.6.16.19, 2.6.16.42, and 2.6.18.8, which don't have this
> problem, but they did have other bugs which crash the whole machine.
> 
> At least with this bug, my system is able to reboot itself if it gets
> stuck.  Ah, progress.  ;-)
> 

