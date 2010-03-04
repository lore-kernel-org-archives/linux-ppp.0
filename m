From: "Murali K. Vemuri" <murali@uczen.co.kr>
Date: Thu, 04 Mar 2010 02:31:16 +0000
Subject: Re: some problem
Message-Id: <1267669876.31778.3.camel@rs.local>
List-Id: <linux-ppp.vger.kernel.org>
References: <1267602954.2112.31.camel@rs.local>
In-Reply-To: <1267602954.2112.31.camel@rs.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi James et al,
That was perfect. I changed the device to /dev/ttyUSB0
from /dev/ttyUSB1, and our entire lab was on cloud nine.
Thanks a ton for the extraordinary help.
Regards
Murali


On Thu, 2010-03-04 at 07:30 +1100, James Cameron wrote:
> On Wed, Mar 03, 2010 at 11:41:15PM +0900, Murali K. Vemuri wrote:
> > Jan  1 00:02:37 (none) local2.info chat[109]: send (AT^M)
> > Jan  1 00:02:37 (none) local2.info chat[109]: send (AT
> > +CGDCONT=1,"ip","web.sktelecom.com",,,^M)
> > Jan  1 00:02:38 (none) local2.info chat[109]: send (ATDT*98#^M)
> > Jan  1 00:02:38 (none) local2.info chat[109]: expect (CONNECT)
> > Jan  1 00:03:23 (none) local2.info chat[109]: alarm
> 
> There's no evidence in that chat log that you are receiving anything
> back from the modem.  You should receive OK in response to AT and
> AT+CGDCONT.  Can you confirm that with a manual connection between
> keyboard and modem?
> 
> A common cause of this is modems that provide two USB endpoints; one for
> firmware update, one for communications.  The firmware update endpoint
> may not respond.  For one modem, I fixed this by using the next device
> name; /dev/ttyUSB1 instead of /dev/ttyUSB0.
> 
> Otherwise, the sequence looks acceptable.  For a sequence that I've
> tested with a different modem, but which works with every other modem
> I've tried, see:
> 
> http://quozl.linux.org.au/darcs/eee-bpw/etc/chatscripts/bpw
> 
> In this particular instance, an additional check AT+CGATT? is done to
> verify that the modem has attached to the network ... before attempting
> a connection.
> 

