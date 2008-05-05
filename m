From: James Cameron <james.cameron@hp.com>
Date: Mon, 05 May 2008 03:42:11 +0000
Subject: Re: How and Where the pppd initialze its plugins?
Message-Id: <20080505034211.GO5497@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <200805051126252135973@foxmail.com>
In-Reply-To: <200805051126252135973@foxmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Mon, May 05, 2008 at 11:26:36AM +0800, cyx_mail@foxmail.com wrote:
> How and Where the pppd initialze its plugins?

pppd/options.c, the pppd plugin option loads a plugin and calls the
plugin specific initialiser.  See loadplugin().

-- 
James Cameron
http://ftp.hp.com.au/sigs/jc/
