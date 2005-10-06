From: "Eugene Paskevich" <eugene@raptor.kiev.ua>
Date: Thu, 06 Oct 2005 05:39:10 +0000
Subject: Re: CBCP rewrite patch + feature request
Message-Id: <op.sx7lzkta2m4sxy@condor.raptor.kiev.ua>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Wed, 14 Sep 2005 09:57:06 +0300, Eugene Paskevich  
<eugene@raptor.kiev.ua> wrote:

> As you asked, Paul, I ported my patch to 2.4.4b1 version.
> All your remarks were took into the account while porting.
> But some things were changed so no surprise you will have
> more remarks. :-)
>
> Patch features:
>
> 1) README corrections and additions.
> 2) chat/chat.c: got rid of compilation warning complaining
>    trigraph misuse when compiled using gcc-3.4.4.
> 3) New hook and plugin for it. Both described in README.
> 4) Almost fully rewritten and reorganized cbcp.c
>    With addition of server side capabilities, code for list
>    callback type, retransmitting timeouted packets.
> 5) Some defines were enumerated in cbcp.h
> 6) #ifdef'ed out unused cbcp definitions if code is compiled
>    without CBCP_SUPPORT.
> 7) corrected tiny misspellings with dialling -> dialing.
>
> Feature request:
>
> 1) Utilize new hook in radius plugin.

I beg your pardon, Paul, but it's been three weeks since
I've sent this patch and I haven't seen any comments upon it.
Sorry for my impatience, but I think that this time must be
sufficient at least for reviewing and commenting, isn't it?

May be you'd like me to convert this patch into a series of
simple patches with some logical division?

-- 
Eugene Paskevich             |   *=)-----------   |     Plug me into
eugene@raptor.kiev.ua        |   -----------(=*   |      The Matrix
