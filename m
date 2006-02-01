From: James Cameron <james.cameron@hp.com>
Date: Wed, 01 Feb 2006 06:12:11 +0000
Subject: Re: Hot to perform a null login?
Message-Id: <20060201061211.GM3755@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <1138770376.8869.17.camel@localhost.localdomain>
In-Reply-To: <1138770376.8869.17.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Given that it's Telstra, the dominant carrier in Australia, requiring a
null username on a GSM call is not at all unusual, and probably
something that Matthew won't ever be able to work around as far as the
provider is concerned.  Authentication and billing is done using the GSM
number, and not the authentication username.  On the CDMA modem that I
have with the same carrier, a non-null shared username is used.
Everybody uses the same username as far as I can tell.

Matthew, could you show us a debug log of the connection attempt?  Bill
asked for that before, and it would be really helpful.  Add the option
debug to the command line you use to start pppd.

I agree with Bill that the "sent [PAP AuthReq" suggests that your end is
attempting to authenticate the peer.  Use the dump option to find out
where the options are coming from.

-- 
James Cameron
http://ftp.hp.com.au/sigs/jc/
