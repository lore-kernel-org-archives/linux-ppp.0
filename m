From: Roland Dreier <rdreier@cisco.com>
Date: Wed, 08 Feb 2006 22:23:56 +0000
Subject: Re: [PATCH] ppp: don't use 0 in pointer context
Message-Id: <ada8xslbibn.fsf@cisco.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20060208222559.GA14543@mipter.zuzino.mipt.ru>
	<17386.27957.822041.83512@gargle.gargle.HOWL>
In-Reply-To: <17386.27957.822041.83512@gargle.gargle.HOWL> (James Carlson's
 message of "Wed, 8 Feb 2006 17:14:13 -0500")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Carlson <carlsonj@workingcode.com>
Cc: Alexey Dobriyan <adobriyan@gmail.com>, Al Viro <viro@ftp.linux.org.uk>, netdev@vger.kernel.org, linux-ppp@vger.kernel.org

    James> And the solution is to treat it as a boolean instead?!  I'm
    James> not sure which is more ugly.

    James> Why wouldn't explicit comparison against NULL be the
    James> preferred fix?

"if (ptr)" and "if (!ptr)" are the preferred idiom for testing whether
a pointer is NULL.  What is gained by writing "if (ptr != NULL)" ?
