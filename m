From: James Carlson <carlsonj@workingcode.com>
Date: Mon, 22 Dec 2014 19:09:08 +0000
Subject: Re: PPP compression
Message-Id: <54986C54.5030707@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <3b4526880d737ed5094d632636e6fef8@great.ufc.br>
In-Reply-To: <3b4526880d737ed5094d632636e6fef8@great.ufc.br>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-ppp@vger.kernel.org

On 12/22/14 13:06, arthurpaulino wrote:
> First, I appreciate all your support.
> 
> I tried to convert from .pcap to .pppdump and use pppdump (with -p and -d)
> to decompress the data.
> But again, the output contains the same data as the compressed packets.
> The files are attached.

Looking at the traces provided, it seems to be just a partial trace, so
there's no way anyone could decode it.

It's important to know that data compression is a stateful operation.
It retains an LZ string dictionary between packets.  As a result, if you
don't have all of the data from the very beginning of the connection,
any attempt to decode it is going to go terribly awry.

For that reason, pppdump won't attempt to decode unless it sees the
initial handshake and CCP negotiation.

That's why I said in the first place that the *SIMPLEST* option to debug
the higher-level data is to disable compression.  Any system built on
non-proprietary standards should work fine with data compression disabled.

> I have some questions:
> 
> 1 - I tried to use pppd with the recording option (pppd record
> output.pppdump), but all it did was print
> "~�}#�!}!}!} }4}"}&} } } } }%}&v��}<}'}"}(}">*~" over and over on the
> terminal. Also, no output file was saved. Am I doing something wrong?

That result indicates that no tty was provided for pppd to use, so it's
falling back to the default -- which is your current tty.  I don't know
what specific options you were using or what issues there are on your
system, so it's hard for me to tell what might be wrong here.

> 2 - How does pppdump know that he has to use deflate for decompression?

It watches the CCP negotiation.  See pppdump.c for details.  It's a
pretty simple program.

For what it's worth, I'd be at least mildly surprised if someone was
running Deflate with PPTP.  That'd be a weird combination of things --
Deflate comes from the open standards world, but PPTP is a Microsoft
proprietary thing that relies on a number of Microsoft proprietary
extensions.

Are you sure the data are compressed with Deflate as originally stated?

Note that pppdump knows only about the open standards -- BSD Compress
and Deflate algorithms.  If this link is using MPPC instead (Microsoft's
proprietary data compression algorithm), then you're sunk.  I don't know
of any simple tools that currently deal with that situation.

Assuming that's the problem, it's possible that there are third party
network analyzers out there that can handle MPPC over PPP over PPTP.  I
haven't researched the state of the art for commercial network
monitoring gear in many years now.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
