From: James Cameron <james.cameron@hp.com>
Date: Tue, 19 May 2009 22:05:16 +0000
Subject: Re: [PATCH] Accept ms-wins settings provided by server
Message-Id: <20090519220516.GA3973@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <1241641599-32361-1-git-send-email-marcus@better.se>
In-Reply-To: <1241641599-32361-1-git-send-email-marcus@better.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Tue, May 19, 2009 at 09:28:12PM +0200, Marcus Better wrote:
> I cannot reproduce the problem anymore. I have changed UMTS provider
> in between (from Tele2 to 3 in Sweden), and modem (from Huawei E620 to
> E220). This may explain the differences.

The change of provider means you are faced with changed attachment
delays.

Are you verifying in your chatscript that the modem is attached to the
network before attempting to dial?

#
# cease if modem is not attached to network yet
ABORT '+CGATT: 0'
'' AT+CGATT?


> However I still have a very similar connection problem, but the patch
> makes no difference. I tried both pppd 2.4.4 and current git, patched
> and unpatched. In all cases it tends to fail at the first connection
> attempt after plugging in the modem. What helps however is setting
> ipcp-max-failure high enough, like 30.
> 
> Here is the log [...]

All three logs you provided in this post showed successful connection.
What makes you think it failed?

-- 
James Cameron
http://ftp.hp.com.au/sigs/jc/
