From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 17 Nov 2005 17:38:33 +0000
Subject: Re: PPPd
Message-Id: <17276.49177.622584.460065@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <347020167.20051117151933@mail.ru>
In-Reply-To: <347020167.20051117151933@mail.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

acr writes:
>   where i connect to GPRS, pppd recive Remote IP 255.255.255.255 and
>   exit (Unautorized IP ), but in win it work.
>   how to make in linux work too?

Sounds like a misconfigured peer.  You *might* be able to work around
this by specifying an arbitrary remote address for the link, like
this:

	:10.0.0.1

... but it's possible that may not work.

>   where get pppd source?

The releases are here:

  ftp://ftp.samba.org/pub/ppp/

Documentation on how to get the live CVS sources is here:

  http://ppp.samba.org/ppp/cvs.html

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
