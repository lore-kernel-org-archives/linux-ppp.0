From: "Milan P. Stanic" <mps@rns-nis.co.yu>
Date: Thu, 18 Mar 2004 22:01:36 +0000
Subject: Re: MS Calback Protocol for Server Side
Message-Id: <20040318220136.GA6503@rns-nis.co.yu>
List-Id: <linux-ppp.vger.kernel.org>
References: <BCB494E8B7BF2D40B56D1164C67BC2A801B1676E@kher443a.ww004.siemens.net>
In-Reply-To: <BCB494E8B7BF2D40B56D1164C67BC2A801B1676E@kher443a.ww004.siemens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, Mar 18, 2004 at 02:00:26PM +0100, Winkler Andreas wrote:
> as far as I know, the ppp-2.4.2 supports CBCP (Call Back Control Protocol)
> only for client application.
> Where can I find a CBCP implementation for the server side, so that a
> windows client can initiate a connection via CBCP?

I forward-ported patch made by Aleksander Kanevsky for 2.4.1 to 2.4.2

http://www.rns-nis.co.yu/~mps/

I'm using it from 2.4.2b3 every day and it works.

[ And don't look at ugly home page :-) I'll beatify it some day ]
