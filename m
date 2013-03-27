From: David Miller <davem@davemloft.net>
Date: Wed, 27 Mar 2013 17:09:46 +0000
Subject: Re: [PATCH 1/2] net: core: let's use native isxdigit instead of custom
Message-Id: <20130327.130946.2022129944371817627.davem@davemloft.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <1364399654-9729-1-git-send-email-andriy.shevchenko@linux.intel.com>
In-Reply-To: <1364399654-9729-1-git-send-email-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andriy.shevchenko@linux.intel.com
Cc: paulus@samba.org, linux-ppp@vger.kernel.org, netdev@vger.kernel.org

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Wed, 27 Mar 2013 17:54:13 +0200

> In kernel we have fast and pretty implementation of the isxdigit() function.
> Let's use it.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied.
