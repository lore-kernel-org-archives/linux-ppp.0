From: James Cameron <james.cameron@hp.com>
Date: Tue, 16 Mar 2004 00:12:30 +0000
Subject: Re: Moving logwtmp
Message-Id: <20040316001230.GB21112@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <91A5926EFF44D3118B1200104B7276EB02C56E0B@hart-exchange.hartwellcorp.com>
In-Reply-To: <91A5926EFF44D3118B1200104B7276EB02C56E0B@hart-exchange.hartwellcorp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I agree.

plogin() in auth.c calls logwtmp().  plogin() is only called if PAP
authentication is being done, and the secret is "@login", meaning that
the system's authentication is being used.  Or PAM.

plogin() is only called by upap_rauthreq() in upap.c.  It is PAP
specific, I don't think it could be called by CHAP; as CHAP uses a
different model.

But even so, I can see that a logwtmp() in the other authentication
paths would help with accounting, and "who".

-- 
James Cameron
