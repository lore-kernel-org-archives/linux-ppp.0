From: Bill Unruh <unruh@physics.ubc.ca>
Date: Tue, 15 Feb 2005 17:19:01 +0000
Subject: Re: 2 questions about dialup pppd use
Message-Id: <Pine.LNX.4.61.0502150914040.26677@string.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <20050212173525.GA27282@iceland.spb.ru>
In-Reply-To: <20050212173525.GA27282@iceland.spb.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Tue, 15 Feb 2005, Clifford Kite wrote:

> On Sat, 12 Feb 2005, Serge Koksharov wrote:
>
> |Question2:
> |If in the same script /etc/ppp/ip-up.local I use following command to
> |synchronize time:
> |ntpdate ntp.someserver.org
> |And in the /etc/ppp/ip-down.local I use command to log sent/received byte count
> |and connection time by this command:
> |echo " TX: $BYTES_SENT RX: $BYTES_RCVD for $((CONNECT_TIME/60)) minutes"\
> |>> /etc/ppp/history                        ^^^^^^^^^^^^^^^^^^^^
>
> That should be $(($CONNECT_TIME/60)) .

That is what I thought at first too. But try it
A0
echo $((A/10))

At least in bash.

>
> I often get wrong connection time in /etc/ppp/history, for example:
> TX: 41180 RX: 291021 for 71582784 minutes.
>
> I don't see how you ever got the _right_ time.

man bash under ARITHMETIC EVALUATION
       Shell  variables  are  allowed as operands; parameter expansion is per-
        formed before the expression is evaluated.  Within an expression, shell
        variables  may  also  be referenced by name without using the parameter
        expansion syntax.
