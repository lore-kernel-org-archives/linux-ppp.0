From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 24 Feb 2005 17:48:57 +0000
Subject: Re: Client requesting its authentication
Message-Id: <16926.5001.19271.820045@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <20050224162619.GB5787@ytsejam>
In-Reply-To: <20050224162619.GB5787@ytsejam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Bill Unruh writes:
> He understood you perfectly. That is precicely what the refuse-... do,
> except that you cannot force the other side to authenticate you . If you
> want them to authenticate themselves to you then you must say do.
> Ie, authentication is under the control of whoever wants the other side to
> be authenticated. Nothing else makes any sense. Of course since eap in some
> sense is a bilateral authentication one might argue that y our request is
> sensible, but the way to do it is for you to demand eap authentication from
> the other side, and to refuse all other types of authentication from the
> other side, as Carlson suggested.
> Why by the way do you want to force the other side to authenticate you?

That's a fair question and I'd be interested in the response.

If the problem is that the peer doesn't bother demanding
authentication, and you want the local system to insist that it does,
there's currently no way to tell pppd that such a behavior is desired.
We would have to add an option ("need-peer-auth"?) to say that if the
LCP Authentication option is missing, we need to send an unsolicited
LCP Configure-Nak to request that it use authentication.

However, I have a hard time imagining any case in which doing
something like that is at all valid.  If the peer doesn't ask for
authentication, doesn't that mean it doesn't need you to do it?  If
so, why would you want it?

-- 
James Carlson                                 <carlsonj@workingcode.com>
