From: "Milan P. Stanic" <mps@arvanta.net>
Date: Tue, 20 Oct 2009 13:33:31 +0000
Subject: Re: ppp sometimes receives bogus dns with 3G hsdpa modems
Message-Id: <20091020133331.GA14573@arvanta.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <4ADDB435.20705@powercraft.nl>
In-Reply-To: <4ADDB435.20705@powercraft.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Tue, 2009-10-20 at 14:59, Jelle de Jong wrote:
> I am having some question on why my hdspa ppp connection sometimes
> but not always receives a bogus dns server (10.11.12.13). That
> causes DNS resolving to break.
> 
> So I know there are several things I can use as workaround like
> using resolvconf or disable the domain-name-servers request in the
> dhclient.conf.
> 
> I am using Debian stable with ppp version 2.4.4rel-10.1
> 
> But I would like to see what the experts think what causes these
> issues and what would be the best solution?
> 
> This system connection should try to stay persistent connected no
> matter what.

Look here:
http://bugs.debian.org/cgi-bin/bugreport.cgi?bugD5711

There are more references on that matter on the Net. And is discussed
here some time ago.

-- 
Kind regards,  Milan
--------------------------------------------------
Arvanta, IT Security        http://www.arvanta.net
Please do not send me e-mail containing HTML code.
