From: James Carlson <james.d.carlson@sun.com>
Date: Wed, 05 May 2004 11:17:35 +0000
Subject: Re: ppp MULTILINK issue / problem
Message-Id: <16536.52559.133956.131223@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <BCBD226C.57C%tchen@on-go.com>
In-Reply-To: <BCBD226C.57C%tchen@on-go.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Thomas Chen writes:
> this is what james sent me:
> 
> in the userland pppd main loop, it calls get_input
> and in get_input, if the packet length is 0, it assume the link
> is bad and print out "Modem Hangup"

Excuse me?  I did *not* write that text.  I don't know where you got
it.

Zero is end of file.  There's no "assumption" there.

-- 
James Carlson, IP Systems Group                <james.d.carlson@sun.com>
Sun Microsystems / 1 Network Drive         71.234W   Vox +1 781 442 2084
MS UBUR02-212 / Burlington MA 01803-2757   42.497N   Fax +1 781 442 1677
