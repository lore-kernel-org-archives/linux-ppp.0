From: James Cameron <james.cameron@hp.com>
Date: Thu, 22 May 2008 03:18:42 +0000
Subject: Re: why kill pppd but pppoe-server die?
Message-Id: <20080522031842.GP6559@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <200805221054295315414@foxmail.com>
In-Reply-To: <200805221054295315414@foxmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, May 22, 2008 at 10:54:30AM +0800, cyx_mail wrote:
> (1) when a pppoe connections established, pppoe-server spawns a child
> process "pppd".

Okay.

> I modified the pppoe-server code a little, and let pppoe-server send
> SIGTERM to the child process.

Okay.  If pppd has not detached, then the SIGTERM will also be delivered
to your pppoe-server process.  You must handle this signal.

> pppoe-server die not the child pppd die.

Your observation matches.

> (2) But if I use command "kill pppd pid" in SHELL to kill the child
> pppd, the result pppd die is what I expected.
> 	why?

I don't know.  This is a question about pppoe-server and your current
source code.  Are SIGINT and SIGTERM handled differently by pppoe-server
at different times?  What version of pppoe-server source are you using?
I've just looked at rp-pppoe-3.8/src/pppoe-server.c and the signals are
both handled by exiting, in termHandler().

-- 
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/
