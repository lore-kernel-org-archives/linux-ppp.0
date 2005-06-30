From: Ray Van Dolson <rayvd@digitalpath.net>
Date: Thu, 30 Jun 2005 15:25:06 +0000
Subject: Re: PPP Encapsulated in GRE with IP Precedence headers
Message-Id: <20050630152506.GA14484@digitalpath.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <20050630051424.GA13477@digitalpath.net>
In-Reply-To: <20050630051424.GA13477@digitalpath.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

> If it's just plain IP over PPP, and you're not negotiating any of MP,
> ECP, CCP, VJ Header Compression, or Robust Header Compression, then
> you should be able to get away with this.  The above protocols,
> though, generally assume strict ordering (it is point-to-point,
> right?) and will fall apart if that's compromised.

Unfortunately we are using MPPE, so perhaps this solution is not as viable as
I thought it would be.  Thanks for the clarification.
