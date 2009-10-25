From: Denys Fedoryschenko <denys@visp.net.lb>
Date: Sun, 25 Oct 2009 18:10:24 +0000
Subject: Re: kernel panic in latest vanilla stable, while using nameif with "alive" pppoe interfaces
Message-Id: <200910252010.24767.denys@visp.net.lb>
List-Id: <linux-ppp.vger.kernel.org>
References: <200910190002.39937.denys@visp.net.lb> <20091020190821.GO5181@lenovo> <20091023151837.GB5394@lenovo>
In-Reply-To: <20091023151837.GB5394@lenovo>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cyrill Gorcunov <gorcunov@gmail.com>
Cc: netdev <netdev@vger.kernel.org>, Michal Ostrowski <mostrows@gmail.com>, Eric Dumazet <eric.dumazet@gmail.com>, linux-ppp@vger.kernel.org, paulus@samba.org, mostrows@earthlink.net

On Friday 23 October 2009 18:18:37 Cyrill Gorcunov wrote:
> [Cyrill Gorcunov - Tue, Oct 20, 2009 at 11:08:21PM +0400]
> ...
>
> | Just to update status of the issue. The key moment is that
> | pppoe_flush_dev may be called asynchronously (especially via sysfs on dev
> | entry, for example we retrieve mtu of device and while we at it other
> | process may update mtu via sysfs). So I'm returning pppoe_hash_lock back
> | which should eliminate a number of lock complains and make locking scheme
> | easier. All-in-one: I'm working on it. Just need some more time.
> |
> | 	-- Cyrill
>
> Another status update -- the patch is under testing stage. Hope we will
> reveal proper patch soon (in a few days I guess).
>
> 	-- Cyrill
During normal operation till now no issues (2 days uptime, 100-150 users 
online on this pppoe). Testing more some stress scenarios.

