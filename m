From: James Cameron <james.cameron@hp.com>
Date: Sun, 19 Feb 2006 23:02:16 +0000
Subject: Re: final repost - MPPE incorrect REJECT/NAK behaviour (was Re: Windows mobile 2005 clients)
Message-Id: <20060219230216.GB3621@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <43F8F60F.70106@imperial.ac.uk>
In-Reply-To: <43F8F60F.70106@imperial.ac.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Looked fine to me, and so I began to test it, but it would not apply to
PPP CVS, which appears to contain code that does something similar.

Is it already fixed in CVS?  Could you try CVS?  Or adapt your change to
what is already there?

ccp.c 1.50

		} else {
		    /* Neither are set. */
		    /* We cannot accept this.  */
		    newret = CONFNAK;
		    /* Give the peer our idea of what can be used,
		       so it can choose and confirm */
		    ho->mppe = ao->mppe;
		}

-- 
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/
