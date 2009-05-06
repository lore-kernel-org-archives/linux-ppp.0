From: Jiri Kosina <jkosina@suse.cz>
Date: Wed, 06 May 2009 21:59:36 +0000
Subject: Re: [PATCH] Accept ms-wins settings provided by server
Message-Id: <alpine.LNX.2.00.0905062359150.22532@wotan.suse.de>
List-Id: <linux-ppp.vger.kernel.org>
References: <1241641599-32361-1-git-send-email-marcus@better.se>
In-Reply-To: <1241641599-32361-1-git-send-email-marcus@better.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Wed, 6 May 2009, Marcus Better wrote:

> The PPP servers of some UMTS/HSPA modems, including the Huawei E220
> and E620, will send WINS server settings and insist that the client
> accepts these. If the client does not do so, the modem will sometimes
> provide bogus DNS server addresses like 10.11.12.13 and 10.11.12.14.
> 
> If we receive ms-wins settings from the server, save and include them
> in our ConfReqs.
> 
> See also discussions at
> 
>   http://thread.gmane.org/gmane.linux.ppp/2721
>   http://bugs.debian.org/cgi-bin/bugreport.cgi?bugD5711
> 
> Signed-off-by: Marcus Better <marcus@better.se>
Tested-by: Jiri Kosina <jkosina@suse.cz>

Thanks,

-- 
Jiri Kosina
SUSE Labs
