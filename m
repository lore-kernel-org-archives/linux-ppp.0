From: Woody Wu <narkewoody@gmail.com>
Date: Fri, 17 Mar 2017 04:42:28 +0000
Subject: Re: Setup pppd over rs-485 point-to-point
Message-Id: <09d59516-dd8f-7496-01c4-34594eaac582@gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <2d19b2f1-bb0f-9a09-6d40-f05388c66af5@gmail.com>
In-Reply-To: <2d19b2f1-bb0f-9a09-6d40-f05388c66af5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org



On 03/17/2017 11:45 AM, Mike O'Connor wrote:
> On 17/03/2017 1:48 PM, Woody Wu wrote:
>> Hi,
>>
>> I want to setup pppd to connect a Linux laptop to an embedded Linux
>> device. The Linux box connected to a rs-232 to rs485 converter, then
>> the convert connected via a two-wire rs-485 cable to the embedded
>> Linux device's rs-485 port.
>>
> This generally will not work as rs-485 is half duplex, the issue is that
> the switching time between transmit and receive will mean loss of data,
> how ever RS-422 will work.
>
>> On the otherhand, I can make success with similar commands when two
>> devices connected with rs-232.  So I guess, this failure was because
>> the rs-485 is half-duplex.  But I searched google, people seemed say
>> pppd should work over a point-to-point rs-485 connection.  So I want
>> to get help from your experts.
>>
> I've not done any searches but I can not see how it could ever work. PPP
> is a an async meaning it can transmit and receive at any time.
>> Thanks in advance.
>> -woody
> Mike
>

One of the search result is this: 
"http://linux-ppp.vger.kernel.narkive.com/Xcw4wgUF/ppp-over-rs-485", in 
which Karthik mentioned he has success with the rs-485 point to point 
connect although he still has problem with multi-drop bus.  To me, I 
only has interests in point-to-point and hope there exits a solution.

-woody

