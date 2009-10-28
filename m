From: James Carlson <carlsonj@workingcode.com>
Date: Wed, 28 Oct 2009 23:38:00 +0000
Subject: Re: pty
Message-Id: <E46E2611-B910-4CC8-88FD-5E55C734A6EA@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <W5658327625161531256756882@webmail25>
In-Reply-To: <W5658327625161531256756882@webmail25>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Oct 28, 2009, at 6:48 PM, tony.chamberlain@lemko.com wrote:

> It did show connect ---> /dev/pts/3 or so, but then timed out.
>
> I really wanted just to make sure I understood correctly too that pppd
> communicates to ppp_relay via stdin and stdout.  And I understand
> pppd_relay talks to the phone and then sends whatever, via stdout,  
> to pppd
> and then ppp_relay also reads from pppd and converts and does whatever
> and sends back to the phone:
>
>
>
> pppd   <----->   ppp_relay  <========> phone
>
> ??

Yep; that's it exactly.


