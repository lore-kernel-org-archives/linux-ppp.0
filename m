From: Bill Unruh <unruh@physics.ubc.ca>
Date: Thu, 24 Feb 2005 23:00:48 +0000
Subject: Re: Client requesting its authentication
Message-Id: <Pine.LNX.4.61.0502241456400.10333@string.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <20050224162619.GB5787@ytsejam>
In-Reply-To: <20050224162619.GB5787@ytsejam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

>
> if I trust him, but we have not authenticated each other,
> then it's a problem

If you trust him, then you trust him. If you require authentication then
you do not trust him.

>
>> What prevents you from putting
>> require-eap
>> into your options file which will result in your eap asking him to
>> authenticate himself to you and you to him with eap?
>
> I have explained that.
> The peer must act as a server.
> I can't.
Why not?

Yes, you can. just set up eap on your system and act like the server. 
Now the far side may reject it, and that is up to them. So talk to them.
Ask them to offer you eap, if that is what you want. Ask them to agree to
be an eap client if that is what you want. But at present you are trying to
force the far side to do something it does not want to do. There is nothing
