From: Michael Schlenstedt <Michael@schlenn.net>
Date: Sat, 03 Apr 2004 08:20:41 +0000
Subject: Re: byte counts in ip-down script
Message-Id: <20040403082040.GA2343@schlenn.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <1080923580.10220.5.camel@dell.tranquilitynj.net>
In-Reply-To: <1080923580.10220.5.camel@dell.tranquilitynj.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Fr Apr 02, 2004, Andy <fs@globalnetit.com> wrote:
> This isn't really clear in the doc, I'm hoping someone knows the answer
> quickly to save me from having to look through the code! -
> 
> If I have persist enabled, and the connection gets dropped and
> re-established several times, are the byte counts passed to ip-down each
> time it drops cumulative, or are they reset each time?
> 
> Thanks -
> Andy
>

Well, I don't know the situation with persist enabled, but with
"demand", the byte count is cumulative.

Bye,
Michael

