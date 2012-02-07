From: terry white <twhite@aniota.com>
Date: Tue, 07 Feb 2012 18:55:08 +0000
Subject: Re: CPU processing time between using TCP and UDP
Message-Id: <Pine.LNX.4.64.1202071044310.14971@aniota.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CADa7JjUrtiQF=bBm--a1WLBFSW877_=Ws95Z+rDpwhaWnXBuyg@mail.gmail.com>
In-Reply-To: <CADa7JjUrtiQF=bBm--a1WLBFSW877_=Ws95Z+rDpwhaWnXBuyg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

: on "2-7-2012" "Srinidhi M" writ:

: Could you please let me know, which module in TCP/IP is consuming more
: time than UDP? How can we reduce packet processing time when sending
: through TCP stack? Please let me know your thoughts.
  
... ciao:
 
    i could be "WAY" off base here, but, i would 'expect' there to be a 
difference.  a connectionless protocol, udp, suggests a "no-wait" interval, 
while 'tcp' demands it.
 
    i think a more meaningful investigation would compare the linux stack 
vis-a-vis another implementation ...


-- 
... it's not what you see ,
    but in stead , notice ...
