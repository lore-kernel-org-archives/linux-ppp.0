From: Frank Cusack <fcusack@fcusack.com>
Date: Mon, 02 Feb 2004 09:34:14 +0000
Subject: Re: ppp-2.4.2 released
Message-Id: <20040202013413.B1937@google.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
In-Reply-To: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Paul,

Any particular reason you removed the mppe patch from 2.4.2?  OK, it
does have a race where a few packets can escape unencrypted, but still.
Anyway, I plan to work up a more suitable patch for the kernel proper.

Are you now ok with me autoconf'ing things?  I was waiting for 2.4.2
before starting.

/fc
