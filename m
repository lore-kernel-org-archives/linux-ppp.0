From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 15 Jul 2014 15:38:58 +0000
Subject: Re: [PATCH net 1/1] net: ppp: fix creating PPP pass and active filters
Message-Id: <CAADnVQJ3GEdxTBg9BvvLfW1JFsMQ2-J6HgRvEim7vWaSDeWd_Q@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <53C28297.4080507@kristov.de>
	<53C29DAA.8020405@gmail.com>
	<20140713180735.209671xd9qjsgmo7@berry.schulz.ip-v6.eu>
	<53C2D541.8080900@redhat.com>
	<20140715065458.15013qglk08wv3mq@kristov.noip.me>
	<53C4D14C.607@redhat.com>
In-Reply-To: <53C4D14C.607@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Borkmann <dborkman@redhat.com>
Cc: Christoph Schulz <develop@kristov.de>, Varka Bhadram <varkabhadram@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, linux-ppp@vger.kernel.org, paulus@samba.org, isdn@linux-pingi.de

On Mon, Jul 14, 2014 at 11:59 PM, Daniel Borkmann <dborkman@redhat.com> wrote:
> On 07/15/2014 06:54 AM, Christoph Schulz wrote:
>>
>> Hello!
>>
>> Daniel Borkmann schrieb am Sun, 13 Jul 2014 20:51:45 +0200:
>>
>>> I think going with the first variant is just fine.
>>
>>
>> Well, then I need not change anything, do I? This first variant causes
>> checkpatch to warn twice about a line exceeding 80 characters:
>>
>> WARNING: line over 80 characters
>> #83: FILE: drivers/net/ppp/ppp_generic.c:771:
>> +                               err >> sk_unattached_filter_create(&ppp->pass_filter,
>>
>> WARNING: line over 80 characters
>> #102: FILE: drivers/net/ppp/ppp_generic.c:797:
>> +                               err >> sk_unattached_filter_create(&ppp->active_filter,
>>
>> But I don't see how to shorten them. This is because
>> "sk_unattached_filter_create" is such a long identifier...
>
>
> Well, this is a soft-limit, and in this particular circumstance
> it should be fine to use your original proposal. I don't see how
> Varka's suggestions make this better in _any way_, rather the
> very opposite.

+1
