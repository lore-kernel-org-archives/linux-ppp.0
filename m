From: Jiri Kosina <jkosina@suse.cz>
Date: Wed, 06 May 2009 13:30:12 +0000
Subject: pppd handling of ms-wins
Message-Id: <alpine.LNX.2.00.0905061523590.22532@wotan.suse.de>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi,

there are situations out there, in which pppd is not able to handle 
ms-wins negotiation with certain UMTS/HSDPA/.... modems properly. More can 
be seen on [1] and [2], including the discussion patch which fixes the 
issue.

I am ocasionally seeing the behavior myself, and looking at git tree of 
pppd it doesn't seem that the patch has been merged.

Was there any discussion about the patch being rejected, or has it just 
never been submitted properly to maintainers?

Thanks.

[1] http://www.opensubscriber.com/message/linux-ppp@vger.kernel.org/7889888.html
[2] http://bugs.debian.org/cgi-bin/bugreport.cgi?bugD5951

-- 
Jiri Kosina
SUSE Labs
