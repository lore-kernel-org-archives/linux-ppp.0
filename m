From: Matthias Kaehlcke <matthias.kaehlcke@gmail.com>
Date: Sun, 09 Dec 2007 19:53:01 +0000
Subject: Re: [PATCH] PPP synchronous tty: convert dead_sem to completion
Message-Id: <20071209195301.GF15658@traven>
List-Id: <linux-ppp.vger.kernel.org>
References: <20071208150954.GA8467@traven> <Pine.LNX.4.64.0712091203490.976@e-smith.charlieb.ott.istop.com>
In-Reply-To: <Pine.LNX.4.64.0712091203490.976@e-smith.charlieb.ott.istop.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Charlie Brady <charlieb@budge.apana.org.au>
Cc: linux-ppp@vger.kernel.org, linux-kernel@vger.kernel.org

El Sun, Dec 09, 2007 at 12:04:48PM -0500 Charlie Brady ha dit:

>
> On Sat, 8 Dec 2007, Matthias Kaehlcke wrote:
>
>> PPP synchronous tty channel driver: convert the semaphore dead_sem to
>> a completion
>>
>> Signed-off-by: Matthias Kaehlcke <matthias.kaehlcke@gmail.com>
>
> Excuse my ignorance please, but why is this a good idea? Should we not 
> record the reason for changes?

Semaphores can be used to signal completion of a job, but aren't the
optimal way to do so. According to LDD3 semaphores are optimized for
the 'available' case and performance suffers when using them as
completion. 

It is also clearer to use each synchronization mechanism according to
its purpose, i.e. semaphores for protection of critical sections and
completions for signalling that a job is done.

-- 
Matthias Kaehlcke
Linux System Developer
Barcelona

              You can't separate peace from freedom because no
               one can be at peace unless he has his freedom
                              (Malcolm X)
                                                                 .''`.
    using free software / Debian GNU/Linux | http://debian.org  : :'  :
                                                                `. `'`
gpg --keyserver pgp.mit.edu --recv-keys 47D8E5D4                  `-
