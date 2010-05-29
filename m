From: Paul Mackerras <paulus@samba.org>
Date: Sat, 29 May 2010 03:00:46 +0000
Subject: Re: [PATCH 6/6] Use Disconnect-Cause=Admin-Reset if SIGTERM
Message-Id: <20100529030046.GB2538@brick.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <1274984499-9633-6-git-send-email-squadette@gmail.com>
In-Reply-To: <1274984499-9633-6-git-send-email-squadette@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

First off, thanks for putting together this set of patches.  This one
needs a little more explanation, however, concerning what the
distinction between the existing EXIT_USER_REQUEST and the new
EXIT_SIGTERM is.  Why do we need a separate code for kill -TERM vs.
kill -HUP?  And shouldn't a ^C at pppd's controlling terminal result
in EXIT_USER_REQUEST rather than EXIT_SIGTERM?

Adding a new EXIT_SIGTERM also has the possibility of breaking
existing scripts that look at pppd's exit code.  Plus, if we're going
to add it, it would need to be documented in pppd.8.

On the whole, I think it would be better just to make
EXIT_USER_REQUEST result in PW_ADMIN_RESET and drop the new
EXIT_SIGTERM.

Paul.
