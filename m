From: Paul Mackerras <paulus@samba.org>
Date: Sat, 19 Jul 2008 09:22:41 +0000
Subject: Re: pppd with mISDN and capi
Message-Id: <18561.45665.837194.364657@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <8140AAF341CC904BA92C3D6A5A190978440A63@ditech-1.ditechllc.com>
In-Reply-To: <8140AAF341CC904BA92C3D6A5A190978440A63@ditech-1.ditechllc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Nicholas Hickman writes:

> Is there any way to see how many links are attached to a currently
> connected multilink bundle?  Is this information stored in the tdb
> database?

Yes, it is in the tdb database.  There isn't a program to print it out
but it wouldn't be hard to write one using tdb_traverse() from
pppd/tdb.c.

Paul.
