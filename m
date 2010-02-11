From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 11 Feb 2010 14:45:00 +0000
Subject: Re: Control pppd behaviour
Message-Id: <4B7417EC.9000007@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <27543592.post@talk.nabble.com>
In-Reply-To: <27543592.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Ashmath Khan wrote:
> James or others,
> 
> Is there a documentation explaining what each ppp option stands for
> options file, I do understand some but others I want to know in detail
> eg:
> plugin pppoe.so eth1
> nodetach
> nodefaultroute
> persist
> maxfail 0
> noauth
> user ashmat
> nopcomp
> lcp-max-failure 5
> lcp-max-configure 10
> lcp-max-terminate 2
> lcp-restart 3
> lcp-echo-failure 3
> lcp-echo-interval 10
> mru 1492

Have you read the man page?  How about RFC 1661?

What more details would you like to have?  Which particular options are
confusing?  (Or are they all troublesome?)

Perhaps we could offer some help here or fix the man page where it's
deficient, but please give us some idea what you need.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
