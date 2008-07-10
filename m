From: James Cameron <james.cameron@hp.com>
Date: Thu, 10 Jul 2008 04:01:21 +0000
Subject: Re: Re: about re-negotiate dns server IP
Message-Id: <20080710040121.GE5946@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <200807101053023595691@gmail.com>
In-Reply-To: <200807101053023595691@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, Jul 10, 2008 at 11:30:09AM +0800, cyx wrote:
> pppoe-server give its clients DNS address from ms-dns in
> pppoe-server-options FILE.

Does it not use pppd for this?

> If I change ms-dns when the ppp link established, will the server
> re-negotiate the DNS address to its clients?

Yes, I understand your question, I just don't know whether you can
restart IPCP negotiation.  I imagine it might be possible, with suitable
coding.

I don't see the need for such a feature though.  It would be more common
to use a virtual IP for DNS instead, and readdress packets as they
arrive.

--
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/
