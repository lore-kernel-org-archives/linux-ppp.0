From: James Carlson <carlsonj@workingcode.com>
Date: Mon, 11 Jan 2010 14:38:12 +0000
Subject: Re: slow transfer speed issue between two ppp based servers
Message-Id: <4B4B37D4.1050505@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <4B4AFA68.4020500@powercraft.nl>
In-Reply-To: <4B4AFA68.4020500@powercraft.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Jelle de Jong wrote:
> Hello everybody,
> 
> I am having a connection speed issue between two ppp based servers,
> and I have no idea what is going wrong and how to fix it.
> 
> I would appreciated it if somebody with advanced networking skills can
> take a look at my attachments with tcpdumps and my analyse report.
> 
> http://filebin.ca/hgnpt/tcpdumps.tar.gz

Is there any chance you could make the raw tcpdump files (rather than
the decoded text output) available?  It's much harder to debug things
when information has been subtracted.

Based on what little is available here, I'm seeing what seems to be an
RTT that jumps around a lot, from a few milliseconds on up to 150
milliseconds, and causing TCP to misbehave.  It's likely that this is a
kernel issue that needs to be investigated.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
