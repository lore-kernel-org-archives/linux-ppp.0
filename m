From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Wed, 06 Oct 2004 22:27:04 +0000
Subject: Re: PPP getting timeout on IPCP config requests on new FC3t2 box
Message-Id: <Pine.LNX.4.60.0410061824250.3345@localhost.localdomain>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.LNX.4.60.0410061642580.14152@dell.enoriver.com>
In-Reply-To: <Pine.LNX.4.60.0410061642580.14152@dell.enoriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Wed, 6 Oct 2004, Bill Unruh wrote:

> On Wed, 6 Oct 2004, Robert P. J. Day wrote:
>
>>
>>    for quite some time, we've been able to connect to a fedora code 2
>> box running an mgetty on /dev/ttyS0.  just today, i set up a fedora
>> core 3 test 2 (FC3t2) box, and reproduced, as closely as possible, the
>> dial-in PPP environment.
>>
>>    that is, i edited
>
> Of course how you edited them is unknown to us.

sorry, i wasn't *trying* to be unhelpful or uninformative, i was 
merely succeeding.  i thought about including the contents of all of 
the salient files, then thought i'd post an abbreviated version, just 
in case there was some well known problem/incompatibility between 
2.4.1 and 2.4.2 where someone would say, "oh, yeah, that's well known, 
here's the fix."  that sort of thing.  if that didn't work, then i 
would get detailed.

> You should also have edited /etc/ppp/options ...

crap.  i forgot about /etc/ppp/options.ttyS0.  argh.  i need more 
sleep.

rday
