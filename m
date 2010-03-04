From: James Cameron <quozl@laptop.org>
Date: Thu, 04 Mar 2010 02:53:21 +0000
Subject: Re: some problem
Message-Id: <20100304025321.GF26684@us.netrek.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <1267602954.2112.31.camel@rs.local>
In-Reply-To: <1267602954.2112.31.camel@rs.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, Mar 04, 2010 at 11:31:16AM +0900, Murali K. Vemuri wrote:
> That was perfect. I changed the device to /dev/ttyUSB0
> from /dev/ttyUSB1, and our entire lab was on cloud nine.
> Thanks a ton for the extraordinary help.

What others were saying is still important ... you must make sure that
the chatscript checks for an OK answer back from the modem, because that
is the way it is supposed to work.

You cannot rely on the AT+CGDCONT command always completing before you
send the ATDT*98# command.  The OK back from the modem is an
acknowledgement of completion of the command.

Doing this properly will make what you build more resilient to unusual
environmental conditions or events.  It may work fine now, but will it
work forever?

A 3G modem is an embedded system.  It may have other more important
things to do like answering a radio beacon than processing your command.
The interface definition for that embedded system may require that you
not send commands until OK is seen.

I'm not trying to frighten you.

-- 
James Cameron
http://quozl.linux.org.au/
