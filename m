From: walter harms <wharms@bfs.de>
Date: Sat, 13 Jul 2019 12:03:08 +0000
Subject: Re: monitoring raw data
Message-Id: <5D29C87C.9070400@bfs.de>
List-Id: <linux-ppp.vger.kernel.org>
References: <5D29B187.6040400@bfs.de>
In-Reply-To: <5D29B187.6040400@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org



Am 13.07.2019 13:10, schrieb Lev:
> On Sat, 13 Jul 2019 12:25:11 +0200
> walter harms <wharms@bfs.de> wrote:
> 
>> Hello list,
>> this is a bit off-topic.
>>
>> I am looking for a tools to monitor the connection quality
>> when i send data via a LTE-Modem.
>>
>> Background:
>> I collect data on remote place and send them to a server.
>> At some places i have strange problems, so i would like to
>> monitor the connection quality and perhaps other informations
>> the modem can offer.
>>
>> Is there a programm or a hook i can use inside pppd ? i am pretty
>> sure i am not the first one with such kind of problems.
>>
>> short:
>> I want a simple way to send 1 or 2 AT cmds store the results and
>> continue with ppp.
>>
>> re,
>>  wh
> 
> Hi Walter,
> 
> 
> See the record option of PPPd. Which LTE modem are you using?
> 

modem: Coniugo

the record option seems to be over the top. So far i understand
i can record all trafic. I would prefer a side channel like /dev/ptsX
where i can connect directly to the modem and get data, or something
like a signal that send a given AT line to the modem and returns into
a file. Only ideas no code for now :)

while searching i found this:
 https://github.com/ya-jeks/gsmmux

ever heard about it ?

re,
 wh
