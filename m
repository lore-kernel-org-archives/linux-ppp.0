From: Chris Wilson <chris@netservers.co.uk>
Date: Mon, 23 Feb 2004 10:54:26 +0000
Subject: Re: Problems with ppp
Message-Id: <Pine.LNX.4.44.0402231052380.7441-100000@chris.camcom.co.uk>
List-Id: <linux-ppp.vger.kernel.org>
References: <BAY15-F30oYAPNXRPmc0000689e@hotmail.com>
In-Reply-To: <BAY15-F30oYAPNXRPmc0000689e@hotmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi Pablo,

> My setup:
> mandrake 9.2
> Modem: Intel 536EP

This is a winmodem, with binary-only drivers for Linux. Did you load all
the necessary user-space software to drive it? Are you using the same
kernel as before, or a new one? If a new one, did you apply the patch, and
did it apply cleanly?  Could you try again with your old kernel?

Cheers, Chris.
-- 
_  __ __     _
 / __/ / ,__(_)_  | Chris Wilson -- UNIX Firewall Lead Developer |
/ (_  ,\/ _/ /_ \ | NetServers.co.uk http://www.netservers.co.uk |
\__/_/_/_//_/___/ | 21 Signet Court, Cambridge, UK. 01223 576516 |

