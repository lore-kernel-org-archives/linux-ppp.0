From: James Carlson <james.d.carlson@sun.com>
Date: Tue, 04 May 2004 14:42:03 +0000
Subject: Re: ppp MULTILINK issue / problem
Message-Id: <16535.43963.658974.456741@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <BCBD226C.57C%tchen@on-go.com>
In-Reply-To: <BCBD226C.57C%tchen@on-go.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Thomas Chen writes:
> now i am testing "UNBUNDLING" of the link.... if i unplug
> the one of the modem (not the master link), i do not see
> the IP traffic anymore, though i do see data on the serial
> link (i put a serial line monitor on the serial port),
> but no more IP packets coming out of PPP

Questions:

	1.  What is your configuration?  You haven't included any pppd
            configuration files or options with your message.

	2.  What are the debug messages?  Please include a *COMPLETE*
            set of debug messages with any problem report!  It's
            virtually impossible to troubleshoot without data.

	3.  Do the peers think the link went down or not?  If they do,
            then it's possibly a bug in the MP part of the Linux
            kernel.  If they don't, then more details on why they
            didn't detect the failure are needed.

> i do see a couple linkes of mp_construct sequencing error

That's what would be expected to happen *if* the peers think that the
link itself is still up.

-- 
James Carlson, IP Systems Group                <james.d.carlson@sun.com>
Sun Microsystems / 1 Network Drive         71.234W   Vox +1 781 442 2084
MS UBUR02-212 / Burlington MA 01803-2757   42.497N   Fax +1 781 442 1677
