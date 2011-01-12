From: James Cameron <quozl@laptop.org>
Date: Wed, 12 Jan 2011 21:05:44 +0000
Subject: Re: ifconfig ppp0 errors
Message-Id: <20110112210544.GA3760@us.netrek.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.GSO.4.64.1101111527150.23601@sunfire13.eecs.tufts.edu>
In-Reply-To: <Pine.GSO.4.64.1101111527150.23601@sunfire13.eecs.tufts.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I agree with James, it smells like hardware.

You might compare clock cycle, bit or byte counters at either end.

You might check for sensitivity to specific data patterns;

- all zero (00000000 repeating), 

- all ones (11111111 repeating), 

- proportion of bits set (00000001, then 00000011, then 00000111, etc), 

- full byte range sequences (00000000 through to 11111111), 

- random numbers (a file of them for cross checking), 

- long duration patterns that might cause lower frequency effects
  (00000000 repeating for 10ms, then 11111111 for 10ms, then change the
  low frequency).

You might test by excluding pppd, such as using cat, diff, and md5sum.

If you've passed all these tests already, then you should find out from
the kernel why the error count is being incremented.

-- 
James Cameron
http://quozl.linux.org.au/
