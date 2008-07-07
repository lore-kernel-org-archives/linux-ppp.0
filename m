From: "Tony Indrali" <tony.indrali@gmail.com>
Date: Mon, 07 Jul 2008 16:19:49 +0000
Subject: Dial on demand of ISP that require opening a page
Message-Id: <94a1de140807070919w5ab1c5dao30ade0a44202be8e@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Dear subscribers,

I want to start pppd on demand where the first thing it do is:
1. open a page
2. wait until the page is fully loaded, or at least wait n seconds
3. continue whatever request that start up the link.

I tried to open the page in ip-up.d script but the request that start
up the link always precede the page I need to open first. Meanwhile
ip-pre-up doesn't allow ip packet yet.

Therefore I plan to compile my own version of pppd that can do the above.

Since I have minimal C knowledge, forgive me if my question is too
silly. My question is: Can it be done elegantly, or I need to tinker
with other package instead? If it can be done elegantly, can someone
give me a general direction on what to do?

Thank you in advance.

NB: I need to do the above because my ISP require me to choose the
surfing package before I'm connected to internet.

Best regards,
Tony Indrali
