From: tony.chamberlain@lemko.com
Date: Tue, 06 Apr 2010 20:12:08 +0000
Subject: Re:  CentOS 5.4 repositories
Message-Id: <W847036155170141270584728@webmail28>
List-Id: <linux-ppp.vger.kernel.org>
References: <W7592413235268421270476700@webmail34>
In-Reply-To: <W7592413235268421270476700@webmail34>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I even made sure that /proc/sys/net/ipv4/ip_no_pmtu_disc was 0
(which it was).  Tried it as 1 anyway and still same problem.


-----Original Message-----
From: Charlie Brady [mailto:charlieb-linux-ppp@budge.apana.org.au]
Sent: Tuesday, April 6, 2010 08:07 AM
To: tony.chamberlain@lemko.com
Cc: 'James Cameron', 'ppp Linux'
Subject: Re: CentOS 5.4 repositories


On Tue, 6 Apr 2010, tony.chamberlain@lemko.com wrote:

> But did you do from a 5.4 machine?

Did you read the information I pointed you to about ICMP filtering?

>
> -----Original Message-----
> From: James Cameron [mailto:quozl@laptop.org]
> Sent: Monday, April 5, 2010 05:44 PM
> To: tony.chamberlain@lemko.com
> Cc: 'ppp Linux'
> Subject: Re: CentOS 5.4 repositories
>
> On Mon, Apr 05, 2010 at 02:11:40PM +0000, tony.chamberlain@lemko.com wrote:
>> http://poptop.sourceforge.net/yum/stable/rhel5/i386/repodata/primary.sqlite.bz2: [Errno 4] Socket Error: (104, 'Connection reset by peer')
>
> Works for me using wget.
>
>> http://pptpclient.sourceforge.net/yum/stable/rhel5/pptp-release-current.noarch.rpm
>
> Works for me using wget.
>
>
--
To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html



