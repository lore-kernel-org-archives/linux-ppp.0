From: Woody Wu <narkewoody@gmail.com>
Date: Sun, 19 Mar 2017 14:43:15 +0000
Subject: Re: Setup pppd over rs-485 point-to-point
Message-Id: <f057501a-9f11-8df0-7e84-189ef54c3a75@gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <2d19b2f1-bb0f-9a09-6d40-f05388c66af5@gmail.com>
In-Reply-To: <2d19b2f1-bb0f-9a09-6d40-f05388c66af5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org



On 03/17/2017 11:13 PM, Michael Richardson wrote:
>
> Woody Wu <narkewoody@gmail.com> wrote:
>     > I want to setup pppd to connect a Linux laptop to an embedded Linux
>     > device. The Linux box connected to a rs-232 to rs485 converter, then
>     > the convert connected via a two-wire rs-485 cable to the embedded Linux
>     > device's rs-485 port.
>
> Depending upon what you really want to do (is it run ppp? Or is it, get IP
> connectivity?), you may want to look at:
>
>                https://datatracker.ietf.org/doc/draft-ietf-6lo-6lobac/
>
> There is some userspace code out there from Carsten I think.

Michael, the 6lobac you mentioned looks exactly what I needed. But it 
looks a quite new standard and no a real implementation on Linux or 
Windows, right?

>
> --
> ]               Never tell me the odds!                 | ipv6 mesh networks [
> ]   Michael Richardson, Sandelman Software Works        | network architect  [
> ]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [
>
