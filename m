From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Fri, 15 Oct 2004 16:33:52 +0000
Subject: Re: absolutely baffled as to why PPP link doesn't allow pings
Message-Id: <Pine.LNX.4.60.0410151233110.12070@localhost.localdomain>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.LNX.4.60.0410151211340.11955@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.60.0410151211340.11955@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Fri, 15 Oct 2004, Robert P. J. Day wrote:

>       host (10.1.1.96) <-> modem <-> teltone <-> embedded (10.1.1.97)
>
>   on the embedded side, after PPP comes up, the routing table has a
> single entry:
>
>   10.1.1.97  0.0.0.0  255.255.255.255  UH 0 0 0 ppp0

crap.  that first address should say 10.1.1.96, of course -- the host
on the *other* end of the link.  sorry.

rday
