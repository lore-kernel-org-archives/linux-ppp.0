From: "Piet Louw" <ploubser@thepub.co.za>
Date: Wed, 11 Aug 2004 06:37:09 +0000
Subject: pppd + multilink
Message-Id: <web-401286731@mail01.infosat.net>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


Hi!

My kernel = 2.4.25
My pppd   = 2.4.2

In the man page of pppd it states the following
in the MULTILINK section:

"
Currently, if the  first  pppd  terminates  (for
example, because of a hangup or a received signal)
the bundle is destroyed.
"

This means it removes the whole multilink interface when
the first connection dies.

I would like to change pppd in such a way that it would
not terminate the whole connection/bundle, but rather
adapt to the initial connection loss, and still keep the
bundle and connection at least until no more modems
is using it.

So I was wondering if anybody did this already, and
if so if they would maybe share that knowledge with me.

Or maybe if there is a type of patch for this I
would really appreciate it if you could point me to
it.


Thank you very much, and have a nice day!

-piet

_____________________________________________________________________
For super low premiums ,click here http://www.dialdirect.co.za/quote
