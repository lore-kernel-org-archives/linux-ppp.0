From: James Cameron <james.cameron@hp.com>
Date: Wed, 01 Feb 2006 23:03:14 +0000
Subject: Re: Hot to perform a null login?
Message-Id: <20060201230314.GA4191@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <1138770376.8869.17.camel@localhost.localdomain>
In-Reply-To: <1138770376.8869.17.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

G'day Matthew,

I've checked the code, and a null username given to the user option is
overridden by the value given to the name option.  And the name option
defaults in the same way to the hostname or is forced to it if the
usehostname option is used.  

This is in auth_check_options(), line 1214 of auth.c CVS revision 1.108.

    /* Default our_name to hostname, and user to our_name */
    if (our_name[0] = 0 || usehostname)
	strlcpy(our_name, hostname, sizeof(our_name));
    if (user[0] = 0)
	strlcpy(user, our_name, sizeof(user));

Therefore it is not possible with the current code to offer a null
string for PAP authentication, since this matches the tests above.  To
achieve it, you will have to change the code and recompile.  I suggest
commenting out the last two lines I've quoted above, and then use

	user ''

as Bill initially suggested.

-- 
James Cameron
http://ftp.hp.com.au/sigs/jc/
