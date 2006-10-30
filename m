From: Christian <crich-ml@beronet.com>
Date: Mon, 30 Oct 2006 15:06:23 +0000
Subject: Re: Way how frames are read in pppd
Message-Id: <454614EF.3000301@beronet.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <4540C35F.9010104@beronet.com>
In-Reply-To: <4540C35F.9010104@beronet.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


>>>      
>>>
>>do you know of any library implementing AHDLC ? I'm right now trying to
>>use spandsps implemetation, but it seems not receive a frame..
>>    
>>
>
>  
>
I've done some progress in using the hdlc stuffing/destuffing from
spandsp, it reports that it first has some good FRAME_OK, then after 3
bytes it gets an ABORT, but still says it found a (bad) frame, which
looks like:

received [37]: 3f f1 0 a1 9f d0 4f e8 27 f0 b3 f8 89 fc 64 7e 2 3f 81 9f
c0 4f e0 27 f5 93 cd fb c9 e3 8d fc e4 7e 22 3f 85

would you say this is a correct ppp frame? (looks like it contains a 7e
which should be part of hdlc i think .. )

>You can feel free to use this one:
>
>  ftp://ftp.workingcode.com/pub/carlson/ppp/ahdlc.c
>  ftp://ftp.workingcode.com/pub/carlson/ppp/ahdlc.h
>
>  
>
I tried to fetch them, but i got:


wget ftp://ftp.workingcode.com/pub/carlson/ppp/ahdlc.c
--15:58:57--  ftp://ftp.workingcode.com/pub/carlson/ppp/ahdlc.c
           => `ahdlc.c'
Resolving ftp.workingcode.com... 24.128.38.122
Connecting to ftp.workingcode.com[24.128.38.122]:21... connected.
Logging in as anonymous ... ^[[ALogged in!
=> SYST ... done.    => PWD ... done.
=> TYPE I ... done.  => CWD /pub/carlson/ppp ... done.
=> PASV ...


couldn't connect to 24.128.38.122:31221: Connection timed out
Retrying.




Many thanks so far for clarifying these things to me :-)

