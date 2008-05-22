From: James Cameron <james.cameron@hp.com>
Date: Thu, 22 May 2008 01:29:27 +0000
Subject: Re: Re: issue about PIDs ?
Message-Id: <20080522012927.GL6559@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <200805212131204066521@foxmail.com>
In-Reply-To: <200805212131204066521@foxmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, May 22, 2008 at 09:23:06AM +0800, cyx_mail wrote:
> you mean define a handler in pppd code?

No, in your pppoe-server code.  Handle the SIGINT as if it is expected
side-effect.

> what function should call in the handler to bring the pppd down
> gracefully?

Sorry, I don't understand this question.

-- 
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/
