From: Bill Unruh <unruh@physics.ubc.ca>
Date: Wed, 24 May 2006 06:14:52 +0000
Subject: RE: DHCP failure on machine with ppp running.
Message-Id: <Pine.LNX.4.61.0605232304220.28842@info.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.LNX.4.61.0605230857220.8368@info.physics.ubc.ca>
In-Reply-To: <Pine.LNX.4.61.0605230857220.8368@info.physics.ubc.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Wed, 24 May 2006, JOBY THAMPAN wrote:

>
> Hi,
>
> 	This is company mail ID, so it is not easy to change the Format of
> mail ID. Sorry for any inconvenience.
>
> 	I am attaching the setup diagram... (Setup-sha)
>
> 	Explanation:
>
> 	DHCP Server running on Linux machine 1 on 192.168.10.1
>
> 	DHCP Relay started with Server IP as 192.168.10.1 and listening on
> ppp0. and eth1.

Do you mean 192.168.10.200?
and 192.168.20.1

> 	Link 2 is PPPoE link.

Why? PPPoE is ppp over ethernet. If you already have an ethernet link, why
in the world would you then want to have ppp running on top of that? pppoe
was and abortion which had life breathed into it by a commercail company
for no reason but to make money. It is used as a way of doing
authentication , but you have a single machine (#3) hanging off #2.
Strange.

>
> 	The client is expecting an IP in the range 192.168.40.X

Why?

>
> 	But the DHCP Offer packet from Server is reaching only upto PPPoE
> Client interface...

? firewall?

And how do you know it is reaching there?


>
>
> 	Then I did a setup like placing another machine between the client
> machine and pppoe-client machine
>
> 	and started dhcprelay on that machine which listens on eth
> interface.
>
> 	as shown in the attachment (Setup-jo).
>
> 	This worked..

Are you sure that it is not just that machine which is serving a dhcp
address? Ie, are you sure that the request is going all the way back to 1
and then back along the line?


>
> 	In effect when dhcp relay listened on ppp0 interface th OFFER Packet
> is not reaching Relay.

Which is Relay?

>
> 	But while dhcp relay is listening on eth0 interface the OFFER Packet
> is reaching client through relay.
>
> 	ipforwarding is enabled in all machines.
>
> 	Is there any other configuration I missed


>
>
> Rgds
> Joby
>
>
>
> -----Original Message-----
> From: Bill Unruh [mailto:unruh@physics.ubc.ca]
> Sent: Tuesday, May 23, 2006 9:31 PM
> To: Joby Thampan
> Cc: 'linux-ppp@vger.kernel.org'; 'dhcp-users@isc.org'
> Subject: DHCP failure on machine with ppp running.
>
>
> On Tue, 23 May 2006, JOBY THAMPAN wrote:
>
>> Hi all,
>>
>> 	When I made DHCP Relay listening on a machine containing PPP
>> Interface, the DHCP Relay is not recieving the offer packet from dhcp
> server
>
> Sounds like your routing is messed up. I do not knw what you mean  in your
> description of the problem however. Your machine contains both a ppp and an
> eth0 interface? and you want it to set up dhcp on eth0? How do you go about
> it?
>
> Also please use subjects to your emails and do NOT use all capitals in your
> name. both are typical of spam and your email almost certainly got tossed
> out from almost everyone in this group as spam.
>
>>
>> 	But when I made DHCP Relay listening on ethernet interface on a
>> different machine other than the machine containing PPP Interface DHCP
> Offer
>> Successfully recieved.
>>
>> 	If somebody knows, Please explain why this is so???
>>
>> Rgds
>> joby
>>
>>
>>
> ---------------------------------------------------------------------------
>>       "This e-mail and any files transmitted with it are for the sole use
>> of the intended recipient(s) and may contain confidential and privileged
>> information. If you are not the intended recipient, please contact the
>> sender by reply e-mail and destroy all copies of the original message.
>>
>>       Any unauthorized review, use, disclosure, dissemination, forwarding,
>> printing or copying of this email or any action taken upon this e-mail is
>> strictly prohibited and may be unlawful."
>>
> ---------------------------------------------------------------------------
>> -
>> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>
>

-- 
William G. Unruh   |  Canadian Institute for|     Tel: +1(604)822-3273
Physics&Astronomy  |     Advanced Research  |     Fax: +1(604)822-5324
UBC, Vancouver,BC  |   Program in Cosmology |     unruh@physics.ubc.ca
Canada V6T 1Z1     |      and Gravity       |  www.theory.physics.ubc.ca/
