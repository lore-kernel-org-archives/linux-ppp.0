From: Bill Unruh <unruh@physics.ubc.ca>
Date: Mon, 05 Oct 2009 17:33:19 +0000
Subject: Re: ppp question
Message-Id: <Pine.LNX.4.64.0910051031340.32187@info.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <008201ca45e2$eb8f8f60$0413010a@scu.escambray.com.cu>
In-Reply-To: <008201ca45e2$eb8f8f60$0413010a@scu.escambray.com.cu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Mon, 5 Oct 2009, Davy Leon wrote:

> Hi folks
>
> I have a question. Every time I dialup to the internet pppd executes an 
> script called ip-up. My question is, everytime someone dials in it's executed 
> too? If the answer is yes, how can I handle the script to execute one part 
> when dianing out and another part when dialing in. I meant something like

One of the arguments given to ip-up is the IP addresses assigned to the remote
and local systems. Since when someone calls in the IP address is assigned by
you and is almost certainly different from the IP address assigned to you when
you dial out. You can base the response on the IP address range

man pppd

>
> if dialing in then
>
> ...
> ...
>
> if dialing out then
>
> ...
> ....
>
>
>
> Thanks in advance
>
> David 
> --
