From: Frank Cusack <fcusack@fcusack.com>
Date: Tue, 03 Feb 2004 14:33:23 +0000
Subject: Re: ppp-2.4.2 released
Message-Id: <20040203063323.A12218@google.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
In-Reply-To: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Tue, Feb 03, 2004 at 01:17:56PM +0200, Pasi K?rkk?inen wrote:
> I'm not sure what is the correct behaviour, but www.yle.fi doesn't send
> shorter packets than mss+headers (mss told by the client).

That's incorrect on behalf of www.yle.fi.  The client can never know the
PMTU in the server->client direction.  Even in the client->server direction,
it can change during the lifetime of a connection.  Read the RFC I mentioned.

When doing PMTU-D, one must not clamp the segment size to the MSS.

> So either pppd is broken, or www.yle.fi tcp/ip stack is broken..

The latter.

/fc
