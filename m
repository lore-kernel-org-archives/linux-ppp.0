From: ryd994 <ryd994@163.com>
Date: Fri, 12 Dec 2014 06:36:17 +0000
Subject: Is it possible to use secret file to assign each user an ip while auto negociate?
Message-Id: <CAKAxj1MvBbM6spZH0G506qraOwjh18UV9x2VefhB8qZQQ2EKxA@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

To whom can help with this uncommon case:

I'm setting up a pptp server for a small group of users. For security,
I want all activity across my server can be traced,
so I want username one-to-multi mapped to address assigned.

I first tried with only one static address for each user. It works out
well until second connection with same username joined.
All clients used same username to authenticate got same address negotiated.

Then I used a subnet range, e.g. 192.168.2.128/25 . It failed because
pppd can't propose an address
to client while client didn't requesting one either. The log shows:
"
Could not determine remote IP address: defaulting to 10.64.64.65
Peer is not authorized to use remote address 10.64.64.65
"
Then server disconnected.

I also tried add a plus sign 192.168.2.128/25+ , and it didn't work
either, pppd can't determine a remote address.

What is the typical use of the "plus sign" format? and how should I
build a server-assigned one-to-multi mapping
from user to address?

Thank you,

