From: walter harms <wharms@bfs.de>
Date: Fri, 30 Oct 2009 17:31:33 +0000
Subject: Re: pppd & ntpd
Message-Id: <4AEB22F5.3080402@bfs.de>
List-Id: <linux-ppp.vger.kernel.org>
References: <4AEAFDE0.2060600@bfs.de>
In-Reply-To: <4AEAFDE0.2060600@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org



Bill Unruh schrieb:
> On Fri, 30 Oct 2009, walter harms wrote:
> 
>> Hi list,
>> the question is a bit of topic, but
>> has someone a dial-in server with ntpd running ?
>> we have noticed that  'ntpd 4.2.4p6' seems
>> to have problems accepting connections from ppp0.
>>
> 
> Lets understand your problem a bit better. You have a machine which is
> connected to the net via ppp. That machine is listed as an ntp server on
> another machine. That other machine is having trouble syncing to this
> machine.

	
the box in question has 2 interfaces:  1.permanent eth0  2. demand ppp0
the box is running the ntpd and it works.

now a 2. box is connecting via modem (ppp0) and tries to get time vi ntp.
This fails often.
 	

> What evidence do you have that the the problem is "accepting connections"?
> Do you have a tcpdump which shows that the ntp  packets are being
> dropped by

no, i took a look with "netstat -l" and you can see the daemon listen to ip:ntp


> the server (ie not being processed ) (up the poll interval to 4 on the
> outside
> machine so you can see the packets over a reasonable period of time)
> 
> 
>> i "fixed" the problem with a kill -1 in ip-up.
> 
> I have no idea how a kill -1 ( of what?) would fix anything.

As James pointed out ntpd is reading the interface list at start
(i did not read the code so do not take it literal). so when
ip-up is called by pppd it does a "kill -HUP $(pidof ntpd)". This causes
ntpd to reread the interfaces (confirmed with netstat -l) and it
replys propperly.

It seems that ntpd is scanning the interfaces from time to time because
it notice sometimes that ppp0 is there and stays for a while. That means
if someone is testing and it works, it may work again if the redail is
soon enought (interface not droped yet) but if it takes a bit longer
(e.g. you have a phonecall) it does not work anymore.


hope that helps,
 wh

