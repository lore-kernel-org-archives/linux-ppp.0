From: Clive Nicolson <clive@baby.bedroom.gen.nz>
Date: Thu, 08 Jul 2004 02:52:41 +0000
Subject: Re: pppd with radius-plugin seems to have troubles with traffic
Message-Id: <Pine.LNX.4.44.0407081449310.27897-100000@pentiumii.bedroom.gen.nz>
List-Id: <linux-ppp.vger.kernel.org>
References: <20040622154645.GA12959@kolmann.at>
In-Reply-To: <20040622154645.GA12959@kolmann.at>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

This is no bug, the counter is unsigned 32 bit, so can only count upto
4294967295. You have to watch out for roll over your self and correct for 
the situation. There maybe useful tricks in doing that.

Clive

