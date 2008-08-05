From: James Cameron <james.cameron@hp.com>
Date: Tue, 05 Aug 2008 01:00:44 +0000
Subject: Re: timeout
Message-Id: <20080805010044.GD5416@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <W821531458670521217882275@webmail39>
In-Reply-To: <W821531458670521217882275@webmail39>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Mon, Aug 04, 2008 at 08:37:55PM +0000, tony.chamberlain@lemko.com wrote:
> I am using pptp which calls pppd.  I use ip-up.local to add routes.
> 
> Problem is, when connecting, after only 10 or 15 seconds the link gets
> dropped by the peer due to inactivity (I think it is the peer and not
> me).

If you have added routes that change the route used by pptp for the GRE
packet stream, then the peer will drop the connection because the LCP
echo requests are not replied to.

Does the same problem occur without your route changes?

Which version of pppd?  Which version of pptp?

> Anyway I can make a stupid script to ping the other side every 5
> seconds, which keeps the link up.

I'm surprised.

It would be more useful to see a "debug dump" log posted on a web page
for us to look at.

-- 
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/
