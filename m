From: James Cameron <james.cameron@hp.com>
Date: Tue, 27 Apr 2004 12:29:54 +0000
Subject: Re: Interface Name
Message-Id: <20040427122954.GA32211@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <408E24E6.6090900@guox.net>
In-Reply-To: <408E24E6.6090900@guox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Tue, Apr 27, 2004 at 07:16:22PM +1000, Soragan Guo wrote:
> how to modify the interface name become pptp0 or adsl0 or any other
> name according to type of connection?

The name is set by the PPP kernel module.  With suitable expertise you
could modify the kernel module.

There is a program called ifrename that will let you change the
interface name for a network interface.  This is also released as as
package by the same name in the Debian project.  

	http://packages.debian.org/ifrename

I've not investigated it for use with PPP.  The man page says it has to
run before the interface is brought up.  My experience with PPP so far
is that the interface is created and brought up immediately.

The author of ifrename is Jean Tourrilhes <jt@hpl.hp.com>

-- 
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/
