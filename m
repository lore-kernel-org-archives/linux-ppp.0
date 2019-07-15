From: James Carlson <carlsonj@workingcode.com>
Date: Mon, 15 Jul 2019 18:24:16 +0000
Subject: Re: monitoring raw data
Message-Id: <a5cba29c-1943-92db-0b6e-a61dae007ccc@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <5D29B187.6040400@bfs.de>
In-Reply-To: <5D29B187.6040400@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 07/13/19 08:03, walter harms wrote:
> while searching i found this:
>  https://github.com/ya-jeks/gsmmux
> 
> ever heard about it ?

I've never heard of it, but it does indeed look like the solution you're
looking for.  You would just run pppd over one of the ptys allocated by
that tool, and then use your AT commands on another pty.

More generally, neither pppd nor its associated kernel drivers have any
sort of multiplexing scheme for carriage of non-PPP data.

On a commercial system I once worked on, we had specially-designed
modems that had a separate management-only serial port so that we could
issue commands without disrupting the data port.  Life with
consumer-grade modems is different.  I've heard of people trying to do
the Hayes-patented TIES "<delay>+++<delay>ATH1<nl>AT...<nl>ATO<nl>"
stuff with modified drivers in the past, but none of that (if it ever
was successful) ended up merging into the main code.  A virtual-port
based scheme (as you're citing) sounds a lot more promising.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
