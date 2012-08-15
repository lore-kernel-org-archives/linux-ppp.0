From: walter harms <wharms@bfs.de>
Date: Wed, 15 Aug 2012 07:14:55 +0000
Subject: Re: Using pppd as a library
Message-Id: <502B4C6F.4070407@bfs.de>
List-Id: <linux-ppp.vger.kernel.org>
References: <502A3A31.2050106@ibtechnology.com>
In-Reply-To: <502A3A31.2050106@ibtechnology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org



Am 15.08.2012 08:20, schrieb Marcel Holtmann:
> Hi James,
> 
>>> Can somebody help me with this. Is there any pppd library already
>>> available?
>>
>> To my knowledge, it's never been done.  When I was with a start-up many
>> years ago, I did modify the code so that it could handle multiple links
>> at once, because we scaled to many thousands of links, but I still did
>> the control and monitoring through an IPC.  (No, I don't have that code
>> ... it went with the start-up.  :-<)
> 
> we have written PPP from scratch for the oFono project for exactly the
> same reason. We needed something in form of a library and not a daemon.
> 
> http://git.kernel.org/?p=network/ofono/ofono.git
> 
> Look under gatchat directory.
> 
> Especially when it comes to intermixing of 3GPP 27.007 and 27.010 with
> PPP for online mode, the current pppd causes too much overhead. It is
> not only that you have to spawn the pppd process and its extra plugin
> for handling feedback. You also need to have a TTY or PTY to use it. And
> that was causing overhead that was not acceptable to us.
> 

hi,

The question is do they need ppp at all ? I certainly has advantages to use
tcp/ip but it is no requirement is several cases. Going with a more simple
protocol can reduce the overhead considerable.

re,
 wh
