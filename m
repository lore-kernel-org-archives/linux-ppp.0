From: James Cameron <james.cameron@hp.com>
Date: Wed, 21 May 2008 23:12:08 +0000
Subject: Re: issue about PIDs ?
Message-Id: <20080521231208.GC6559@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <200805212131204066521@foxmail.com>
In-Reply-To: <200805212131204066521@foxmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Wed, May 21, 2008 at 09:31:20PM +0800, cyx_mail wrote:
> I modified the pppoe-server code ,and let pppoe-server spawn a pppd.
> then let the server send SIGTEM to pppd(using kill(pppd 2's pid ,
> SIGTEM)) not using the normal way(such as stopsession as the code
> written). the pppoe-server and pppd die both, why?

I guess you mean SIGTERM.  This matches my observation with pptpconfig.
Workaround is to define a handler or ignore the SIGTERM signal in your
pppoe-server code.

NetworkManager-pptp also specifically handles SIGTERM and SIGINT,
presumably for the same reason.

-- 
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/
