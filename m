From: Andy <fs@globalnetit.com>
Date: Tue, 22 Jun 2004 06:31:34 +0000
Subject: pppstats and LCP
Message-Id: <1087885893.3348.149.camel@dell.tranquilitynj.net>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Does pppstats count LCP frames, or only higher layer packets?

I noticed that with LCP echo enabled but the link otherwise idle, the
pppstats counters don't change. So I guess pppstats isn't counting the
echo or reply frames. Question is, do the pppstats include any LCP
counts?






