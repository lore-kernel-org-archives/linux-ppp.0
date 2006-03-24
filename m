From: Ray Van Dolson <rayvd@digitalpath.net>
Date: Fri, 24 Mar 2006 23:27:38 +0000
Subject: Re: killing a pptp tunnel with a single ping
Message-Id: <20060324232738.GA18163@digitalpath.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <20060324232128.GA23810@wonderland.linux.it>
In-Reply-To: <20060324232128.GA23810@wonderland.linux.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Sat, Mar 25, 2006 at 12:21:28AM +0100, Marco d'Itri wrote:
> The other side is running 12.4(3) IOS.
> No MTU is explicitly set on either side.

Any reason not to explicitly set the MTU to something like 1450?  MPPE has
some overhead so it'd be nice to see that 1496 packet get fragmented.

Ray
