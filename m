From: David Miller <davem@davemloft.net>
Date: Sat, 08 Jan 2011 01:15:34 +0000
Subject: Re: [PATCH v2] net: ppp: use {get,put}_unaligned_be{16,32}
Message-Id: <20110107.171534.193718114.davem@davemloft.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <1294357056-25889-1-git-send-email-xiaosuo@gmail.com>
	<20110107030145.GA8021@brick.ozlabs.ibm.com>
	<AANLkTim=1GCah0qp8HJK31LWXPb5vAZYp+d2BTQM+Q+B@mail.gmail.com>
In-Reply-To: <AANLkTim=1GCah0qp8HJK31LWXPb5vAZYp+d2BTQM+Q+B@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: xiaosuo@gmail.com
Cc: paulus@samba.org, harvey.harrison@gmail.com, linux-ppp@vger.kernel.org, netdev@vger.kernel.org

From: Changli Gao <xiaosuo@gmail.com>
Date: Sat, 8 Jan 2011 08:43:01 +0800

> On Fri, Jan 7, 2011 at 11:01 AM, Paul Mackerras <paulus@samba.org> wrote:
>> On Fri, Jan 07, 2011 at 07:37:36AM +0800, Changli Gao wrote:
>>
>>> Signed-off-by: Changli Gao <xiaosuo@gmail.com>
>>
>> This patch description is inadequate. =A0It should tell us why you are
>> making this change. =A0Does it result in smaller and/or faster code, and
>> if so by how much on what sort of machine? =A0Do you think it makes the
>> code clearer? =A0(I don't.) =A0Or is there some other motivation for thi=
s?
>>
>=20
> Good designed APIs always make code clearer, smaller and faster. It is
> obvious enough I think.

I have to say that every time I go read the header parsing code in the
PPP driver, I absolutely regret it.

And Changli's patch fixes some of the readability problems.
