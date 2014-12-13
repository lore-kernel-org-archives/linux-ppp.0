From: terry white <twhite@aniota.com>
Date: Sat, 13 Dec 2014 08:12:19 +0000
Subject: Re: [PATCH v2 0/6] net-PPP: Deletion of a few unnecessary checks
Message-Id: <Pine.LNX.4.64.1412122320150.9095@yossarian>
List-Id: <linux-ppp.vger.kernel.org>
References: <5480DA32.8000201@users.sourceforge.net>
In-Reply-To: <5480DA32.8000201@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


... ciao:

: on "12-12-2014" "SF Markus Elfring" writ:

:> I don't want error pointers left in data structure members.
:> I cannot describe my requirements any more precisely than that.

    to me, "error pointers 'left' in data structure members", seems a
little cavalier.  objection to their existence tends to suggest that not
a function of the design, or logic involved.

 
: I hope that a bit more constructive suggestions will be contributed by
: involved software developers around the affected source code. 
 
    so, this 'error pointers' issue fails to meet your 'constructive' 
suggestion threshold.  to my mind, what i choose to ignore, imposes a 
dangerous minimum. what are you willing to ignore.


: Now it seems that a small code clean-up becomes a more challenging 
: development task.
 
    first, if you've EVER dealt with imperfect code, that should be a 
given.  but more importantly to me, i never knew "code clean-up", wasn't 
"REQUIRED" ...


-- 
... it's not what you see ,
    but in stead , notice ...
