From: walter harms <wharms@bfs.de>
Date: Fri, 13 Nov 2009 15:00:40 +0000
Subject: Re: getting the device of the ppp connection
Message-Id: <4AFD7498.9090400@bfs.de>
List-Id: <linux-ppp.vger.kernel.org>
References: <dac45060911130554u31df1580x13d2c901372567af@mail.gmail.com>
In-Reply-To: <dac45060911130554u31df1580x13d2c901372567af@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org



Charlie Brady schrieb:
> 
> On Fri, 13 Nov 2009, Mark Ryden wrote:
> 
>> What I mean is this: I have eth0 - eth3 on a machine, and a ppp
>> connection. I want to know by a
>> short program which device is the one which the ppp connection is
>> using (I know that usually this can
>> be deduced by running "ps" for the corresponding ppp daemon, and
>> inspecting the parameters; for example, with pppoe, I have "-I eth1"
>> parameter (-I stands for interface). But I want a more general
>> way which can be used in cases when we cannot get this info).
> 
> I would do this via an environment variable that you set via your start
> script:
> 
> PPPOE_DEVICE=eth1 pppoe .... -I eth1
> 
> Have a look at daemontools or runit for mechanisms to give you good
> reliable control of the execution environment of long-running processes.
> 
> ---

you can scan the output of ifconfig -a,
but normaly pppd setups a ppp0.

re,
 wh

