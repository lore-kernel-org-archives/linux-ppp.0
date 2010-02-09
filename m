From: Iordan Neshev <ineshev@daisytechbg.com>
Date: Tue, 09 Feb 2010 08:54:46 +0000
Subject: Re: Why DNS1 is rejected twice?
Message-Id: <4B7122D6.8030208@daisytechbg.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <4B6ACD7E.9050603@daisytechbg.com>
In-Reply-To: <4B6ACD7E.9050603@daisytechbg.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Thank you very much, James!
I was worried that the bug is in our device.
We can not switch to another operator but we can now live with that 
because DNS is not really
needed in this special VPN. We solved the problem by removing 
usepeerdns=1 in our code.

Greetings,
Iordan

James Carlson wrote:
> Iordan Neshev wrote:
>   
>> This is the peer's response:
>> [0x7E 0x80 0x21 0x04 0x01 0x00 0x10 0x81 0x06 0x00 0x00 0x00 0x00 0x81
>> 0x06 0x00 0x00 0x00 0x00 0xF4 0x79 0x7E ] 
>> Our device reported:
>> pppInput[0]: IPCP len
>> fsm_input(IPCP): code 4,id 1, len 16
>> fsm_rconfnakrej(IPCP): Rcvd id 1 state=6 (LS_REQSENT)
>> ipcp_rejci: received bad Reject!
>>     
>
> Yep; that violates the RFC.  It's a garbage message.
>
>   
>> The qustion is: Does somebody know why the peer rejected twice DNS1?
>>     
>
> Only the designer of that peer system knows for sure.  It looks like a
> bug in that system.
>   
>> The GSM operator did not reply this question, that's why I'm asking here.
>> Also, does pppd behave properly in this case?
>>     
>
> I believe that it does.  It shouldn't tolerate obvious protocol
> violations from the peer, because it's not generally possible to "guess"
> what the peer might have meant for arbitrary nonsense.
>
> It should be possible, though, to create an option to allow pppd to
> ignore any unrequested (or duplicated) options in Reject messages.
> Whether doing so, and thus continuing to make a connection with an
> obviously malfunctioning peer, is a good idea is perhaps subject to some
> debate.
>
>   
>> We are using a slightly modified pppd 2.3.11 with some backports from
>> all releases till pppd 2.4.5
>> on an embedded device if it matters.
>>     
>
> My recommendation: get a peer that follows the standards.
>   
