From: Cyrill Gorcunov <gorcunov@gmail.com>
Date: Tue, 20 Oct 2009 19:08:21 +0000
Subject: Re: kernel panic in latest vanilla stable, while using nameif with
Message-Id: <20091020190821.GO5181@lenovo>
List-Id: <linux-ppp.vger.kernel.org>
References: <200910190002.39937.denys@visp.net.lb> <200910201650.10066.denys@visp.net.lb> <20091020135920.GB5181@lenovo> <200910201720.00473.denys@visp.net.lb>
In-Reply-To: <200910201720.00473.denys@visp.net.lb>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Denys Fedoryschenko <denys@visp.net.lb>
Cc: Michal Ostrowski <mostrows@gmail.com>, Eric Dumazet <eric.dumazet@gmail.com>, netdev <netdev@vger.kernel.org>, linux-ppp@vger.kernel.org, paulus@samba.org, mostrows@earthlink.net

[Denys Fedoryschenko - Tue, Oct 20, 2009 at 05:20:00PM +0300]
| It panics almost immediately on boot(even on old operations  that was stable, 
| seems on first pppoe customer login attempt), i will rebuild kernel and if 
| interesting will try to get panic message.
| 
...

Just to update status of the issue. The key moment is that pppoe_flush_dev
may be called asynchronously (especially via sysfs on dev entry, for example
we retrieve mtu of device and while we at it other process may update mtu
via sysfs). So I'm returning pppoe_hash_lock back which should eliminate a
number of lock complains and make locking scheme easier. All-in-one: I'm
working on it. Just need some more time.

	-- Cyrill
