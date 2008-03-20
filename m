From: James Cameron <james.cameron@hp.com>
Date: Thu, 20 Mar 2008 02:32:20 +0000
Subject: Re: modem session behavior
Message-Id: <20080320023220.GF9826@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <16169308.post@talk.nabble.com>
In-Reply-To: <16169308.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

ATH hangs up.  Perhaps the loss of CTS and DSR from the modem causes the
kernel and your terminal emulator to see nothing more.

Either configure the system to ignore the loss of CTS and DSR, or
configure the modem not to drop CTS and DSR during a hangup.  Then try
again.

I've no idea why you want to see anything more after ATH though.

-- 
James Cameron
http://ftp.hp.com.au/sigs/jc/
