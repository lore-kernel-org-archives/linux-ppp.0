From: soragan@guox.net
Date: Wed, 28 Apr 2004 02:15:38 +0000
Subject: Re: Interface Name
Message-Id: <11651.130.194.13.103.1083118538.squirrel@130.194.13.103>
List-Id: <linux-ppp.vger.kernel.org>
References: <408E24E6.6090900@guox.net>
In-Reply-To: <408E24E6.6090900@guox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

> On Tue, 27 Apr 2004, James Cameron wrote:
>
>> On Tue, Apr 27, 2004 at 07:16:22PM +1000, Soragan Guo wrote:
>> > how to modify the interface name become pptp0 or adsl0 or any other
>> > name according to type of connection?
>>
>> The name is set by the PPP kernel module.  With suitable expertise you
>> could modify the kernel module.
>
> Actually pppd 2.4.x includes an options called "unit" with which you can
> request pppd give you that numbr for the interface. If it is not
> available, it will use the next available one anyway.

never try that option, but what i am trying to do it to change the
interface name, not the number like ppp0 ppp1 :)

soragan
