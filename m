From: James Cameron <james.cameron@hp.com>
Date: Thu, 29 Jan 2004 01:46:45 +0000
Subject: Re: MPPE required but peer negotiation failed
Message-Id: <20040129014645.GQ19059@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <ADF6087CA978A4418AF7F76DDCF2F72102757859@europa.ats.sensis.com>
In-Reply-To: <ADF6087CA978A4418AF7F76DDCF2F72102757859@europa.ats.sensis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

The "PPP 2.4.1" you were using was a fork, as the originally released
PPP 2.4.1 here didn't have MPPE support.  I think the code is likely to
be different.

But you raise an interesting point; if the response was ConfNak, the
client tries again and eventually negotiates successfully.  PPP 2.4.2
however issues a ConfRej.

Should PPP give up so quickly?

-- 
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/
