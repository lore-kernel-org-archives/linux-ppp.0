From: Paul Mackerras <paulus@samba.org>
Date: Thu, 29 Jun 2006 23:02:43 +0000
Subject: Re: Radius plugin bug.
Message-Id: <17572.23571.497967.716675@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20060629065205.GA18383@digitalpath.net>
In-Reply-To: <20060629065205.GA18383@digitalpath.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Ray Van Dolson writes:

> I'm by no means a C master and am trying to find out where in the code the
> "lock" on the device name pppXXX is released at.  I'm trying to trace
> backwards from the sifdown() call in sys-linux.c but getting a little lost.

The device name gets released in generic_disestablish_ppp() in
sys-linux.c, called (usually) from tty_disestablish_ppp().

Paul.
