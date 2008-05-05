From: James Cameron <james.cameron@hp.com>
Date: Mon, 05 May 2008 10:05:38 +0000
Subject: Re: about option_t
Message-Id: <20080505100538.GA12474@fax.sno.cpqcorp.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <200805051534292917103@foxmail.com>
In-Reply-To: <200805051534292917103@foxmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Mon, May 05, 2008 at 03:34:29PM +0800, cyx_mail@foxmail.com wrote:
> Which piece of code call the void *addr. some plugins uses this
> pointer to call functions when the plugin loads. BTW, what is the
> exactly meaning of each value of enum opt_type struct? Thanks a lot!

Not an interesting question, sorry.  Refer to the PPP source.  It is
truly fascinating and well coded.  Explore references to the option_t
typedef.  Take particular note of ->addr and where o_bool appears in the
source.  It is amazing.  Truly, amazing.  Use a capable editor and cross
referencing tool.  I use emacs with etags, but you might find something
else more appropriate.

-- 
James Cameron
