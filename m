From: Paul Mackerras <paulus@ozlabs.org>
Date: Fri, 27 Sep 2019 01:36:11 +0000
Subject: Re: [PATCH 1/9] magic: remove K&R style of arguments
Message-Id: <20190927013611.GA28486@blackberry>
List-Id: <linux-ppp.vger.kernel.org>
References: <1569482466-9551-2-git-send-email-dev.kurt@vandijck-laurijssen.be>
In-Reply-To: <1569482466-9551-2-git-send-email-dev.kurt@vandijck-laurijssen.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, Sep 26, 2019 at 09:20:58AM +0200, Kurt Van Dijck wrote:
> The __P() macro does not exist in libmusl e.g.
> I swicthed magic.{c,h} to using the std-c argument style, which had
> already been used in some functions.

Right.  I was thinking of doing this across the whole tree in fact.

Paul.
