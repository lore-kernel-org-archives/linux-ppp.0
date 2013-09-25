From: terry white <twhite@aniota.com>
Date: Wed, 25 Sep 2013 17:14:46 +0000
Subject: Re: pppoe_connect fucntion
Message-Id: <Pine.LNX.4.64.1309251006450.12892@yossarian>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAJVjm4BRr4oU0Z92jpTsaY-D5esgEydu_pdnSgK4nOrbX+nZbQ@mail.gmail.com>
In-Reply-To: <CAJVjm4BRr4oU0Z92jpTsaY-D5esgEydu_pdnSgK4nOrbX+nZbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


... ciao:

: on "9-24-2013" "Murat Sezgin" writ:
: Why the pppoe_connect() is called in this tear down process?

     'not' having read all the "source", i'm thinking "pppoe_connect()" 
points to "/usr/sbin/pppoe-connect" (on this system). where, near the 
bottom, this snippet found.

    "if test "$RETRY_ON_FAILURE" = "no" ; then
        exit
     fi"

    if memory serves, the 'pppoe' stuff likes to talk to itself ...


-- 
... it's not what you see ,
    but in stead , notice ...
