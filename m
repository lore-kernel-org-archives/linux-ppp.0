From: Bill Unruh <unruh@physics.ubc.ca>
Date: Thu, 24 Feb 2005 17:43:11 +0000
Subject: Re: Client requesting its authentication
Message-Id: <Pine.LNX.4.61.0502240939320.5963@string.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <20050224162619.GB5787@ytsejam>
In-Reply-To: <20050224162619.GB5787@ytsejam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, 24 Feb 2005 ben_gal@libero.it wrote:

> On Thu, Feb 24, 2005 at 11:37:29AM -0500, James Carlson wrote:
>>> Is there in pppd an option to specify that we want the peer
>>> authenticate us using EAP, and to refuse to continue if it does not
>>> request us ?
>>
>> You'd do it with "refuse-pap refuse-chap refuse-mschap
>> refuse-mschap-v2".
>
> Sorry, I made the question in a wrong manner.
> I don't want to tell the peer what authentication to do if necessary, but
> I want to tell it that I want to authenticate myself (and with EAP), else I
> won't connect.
> Is there a way?

He understood you perfectly. That is precicely what the refuse-... do,
except that you cannot force the other side to authenticate you . If you
want them to authenticate themselves to you then you must say do.
Ie, authentication is under the control of whoever wants the other side to
be authenticated. Nothing else makes any sense. Of course since eap in some
sense is a bilateral authentication one might argue that y our request is
sensible, but the way to do it is for you to demand eap authentication from
the other side, and to refuse all other types of authentication from the
other side, as Carlson suggested.
Why by the way do you want to force the other side to authenticate you?

