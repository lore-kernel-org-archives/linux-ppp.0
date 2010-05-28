From: PierrotLafouine <pierrotlafouine@gmail.com>
Date: Fri, 28 May 2010 17:02:01 +0000
Subject: Re: Question on pppd / reset?
Message-Id: <4BFFF709.5070002@gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <4BFFE5DA.3010608@workingcode.com>
In-Reply-To: <4BFFE5DA.3010608@workingcode.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

James Carlson wrote:
> PierrotLafouine wrote:
>   
>> My question is about reset.  I would like to understand more the stack
>> of the system, and why it failed to reconnect.  The GPRS modem is
>> connected trought full RS-232 signals, and RS-232 chips is on an ISA
>> bus.  How does ppp deal with this kind of hadware configuration ?  I
>> read ppp deal with modem reset, but how ?  Any idea what I should look
>> at to understand more the root cause of this failure ?
>>     
>
> If I had to bet on it, though, I'd bet on defects in the GPRS device
> itself. 
This is also my bet, as software reboot didn't work, and a power down
was needed to restore communication.  But now the question becomes : how
RS-232 chips translates a DCD into ISA bus signals ?  I'll check into
chips datasheet.

Your detailed answer (thank you very much) raise me an other questions :
some embedded boards (ex: BeagleBoard) are provided with GPRS modem. 
But looking at schematics, I notice most of them only connect Rx and Tx
between modem and UART/RS-232.  How would pppd deal with a lost of
carrier in these case ?  Is there a way (ex: command) to detect this
trought data ?

Thanks

Pierre
