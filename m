From: James Cameron <james.cameron@hp.com>
Date: Thu, 22 May 2008 02:37:01 +0000
Subject: Re: Re: Re: issue about PIDs ?
Message-Id: <20080522023701.GM6559@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <200805212131204066521@foxmail.com>
In-Reply-To: <200805212131204066521@foxmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, May 22, 2008 at 09:37:29AM +0800, cyx_mail wrote:
> so if I define a handler in pppd ,and kill pppd himself in the
> handler?

No, I said define a handler for SIGINT in the other program in the
process group that you don't want terminated.  Perhaps you'd like to
have another try at defining the problem?

> if I want to kill pppd himself in the handler that user defined in
> pppd, what function should I call to kill pppd himself safely?

I wasn't suggesting adding a handler to pppd, so I don't need to answer
this question.

-- 
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/
