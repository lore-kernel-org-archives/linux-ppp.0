From: Paul Mackerras <paulus@ozlabs.org>
Date: Mon, 30 Sep 2019 10:56:39 +0000
Subject: Re: [RFC] patch series to compile pppd with musl toolchain
Message-Id: <20190930105639.GA9567@blackberry>
List-Id: <linux-ppp.vger.kernel.org>
References: <1569482466-9551-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
In-Reply-To: <1569482466-9551-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, Sep 26, 2019 at 09:20:57AM +0200, Kurt Van Dijck wrote:
> Hello,
> 
> I'd like to add this series of 9 patches to pppd.
> The goal is to use pppd on an embedded system with musl instead of glibc.
> 
> Kind regards,
> Kurt

The series looks pretty good to me.  I would like a little more
explanation in the commit messages for patches 3 and 7, though, as to
why we want to make the change being made.  If you can give me a
couple of sentences for each of those two patches I will put them in
and apply the series.

Paul.
