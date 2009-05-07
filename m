From: James Cameron <james.cameron@hp.com>
Date: Thu, 07 May 2009 23:00:07 +0000
Subject: Re: [PATCH] Accept ms-wins settings provided by server
Message-Id: <20090507230006.GA2854@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <1241641599-32361-1-git-send-email-marcus@better.se>
In-Reply-To: <1241641599-32361-1-git-send-email-marcus@better.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, May 07, 2009 at 02:47:24PM +0200, Jiri Kosina wrote:
> For the one without the patch, I have one handy myself (from 2.4.4)

Include timings next time.  ;-)  I've reviewed this debug log, and it is
consistent with what I see from various HSDPA modem users where the
modem takes a touch longer to attach to the network.  I've seen times
between 3 and 30 seconds.

I'd like to see what you get with times, without the patch.

On the eee-bpw package that I maintain, the chatscript used contains
this:

#
# cease if modem is not attached to network yet
ABORT '+CGATT: 0'
'' AT+CGATT?

... and the connection is retried by the enclosing script until
attachment is reported.  I don't think I've seen 10.11.12.13 if the
attachment query succeeds.

Looking at the debug log with the patch ... three seconds elapse before
an address is given, and so the negotiation at 06:09:00 through to
09:09:02 appears more a delaying tactic by the modem because it hasn't
completed the negotiation with the provider's equipment.

Was the modem powered off and on before each test?

(I'd like to see you succeed ... if there's a way to encourage the modem
to complete connection sooner, I'm all for it.)

-- 
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/
