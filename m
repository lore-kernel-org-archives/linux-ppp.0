From: Paul Mackerras <paulus@samba.org>
Date: Sun, 19 Aug 2007 04:22:57 +0000
Subject: Re: [patch 14/14] export $CALL_FILE to the link scripts
Message-Id: <18119.50593.245433.74472@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20070819014010.151126674@bongo.bofh.it>
In-Reply-To: <20070819014010.151126674@bongo.bofh.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Marco d'Itri writes:

> +    script_setenv("CALL_FILE", arg, 0);

Why?  Who wants this?

Paul.
