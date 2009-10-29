From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 29 Oct 2009 18:52:50 +0000
Subject: Re: strange pppd error
Message-Id: <4AE9E482.5070707@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <4AE9B268.1090607@bfs.de>
In-Reply-To: <4AE9B268.1090607@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

walter harms wrote:
> James Carlson schrieb:
>>> Oct 20 11:25:14  pppd[5792]: sent [LCP ConfReq id=0x2 <asyncmap 0x0> <magic 0x908697da> <pcomp> <accomp>]
>> The peer hasn't responded.  We try again by resending Configure-Request.
>>  It's odd that we're retrying in just 2 seconds.  The default is 3.
>> Have you tweaked your configuration?
> 
> good idea (it was some time ago since the files where touched :)
> i found the following:
> 
> lcp-echo-interval 30
> lcp-echo-failure 4
> lcp-max-configure 60
> lcp-restart 2

That would do it.  Do you know for a fact that at least the last two of
those are necessary?  In general, it's not a good idea to change options
away from the defaults unless there's a very specific need.

In the case of "lcp-max-configure," that's an oft-misunderstood option.
 If you get the "too many configure requests" failure message, it almost
always means that something _else_ is wrong, and users mistakenly reach
for this tunable to "fix" things.  Instead, this is very rarely needed,
and it's used to work around bugs that cause active negotiation (with
different options tried at each stage) to take a long time to converge.

The "lcp-restart" setting is worrying.  You want this to be longer if
the maximum delay on the link is longer.  I certainly wouldn't set it
shorter than the default of 3 seconds for any modem link, and I'd
consider making it longer.  Having it too short means that we'll send
new Configure-Request messages when we don't absolutely need to, and
this can easily provoke latent bugs in some peers.

I suggest either:

  - removing both options,

or

  - removing the lcp-max-configure option and changing lcp-restart to
    be 4 or larger.

>>> Oct 20 11:25:17  pppd[5792]: rcvd [LCP ConfReq id=0x2 <asyncmap 0x0> <magic 0x8e9f9ca2> <pcomp> <accomp>]
>>> Oct 20 11:25:17  pppd[5792]: sent [LCP ConfReq id=0x3 <asyncmap 0x0> <magic 0x7614dc03> <pcomp> <accomp>]
>>> Oct 20 11:25:17  pppd[5792]: sent [LCP ConfAck id=0x2 <asyncmap 0x0> <magic 0x8e9f9ca2> <pcomp> <accomp>]
>>> Oct 20 11:25:17  pppd[5792]: rcvd [LCP ConfAck id=0x2 <asyncmap 0x0> <magic 0x908697da> <pcomp> <accomp>]
>> What?  We sent only two Configure-Request messages with ID 0x2.  He sent
>> *THREE* Configure-Ack messages with ID 0x2!  That's not right.
>>
>> I'm much more convinced now that the peer is junk.  It'll likely need
>> repair or replacement.
>>
> 
> yep, i have already scheduled that ppp 2.4.4 is need.
> NTL it should be noted there is bug hidden that can cause some
> funny phone bills (believe me). But it seems the distro have all
> there own version can you recommend a source ?

I recommend dealing with the upstream vendor first.  I don't know what
that embedded system peer is running, but if it's actually running pppd,
then that's suspicious, because it shouldn't be that far away from the
standard even if it is out of date.

If it is running pppd, and if you really do want to try rolling your own
copy, then start with:

  ftp://ftp.samba.org/pub/ppp/ppp-2.4.4.tar.gz

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
