From: carlsonj@workingcode.com
Date: Thu, 28 Oct 2004 15:41:45 +0000
Subject: Re: ppp 2.4.3 cvs authentication issue
Message-Id: <16769.4921.412984.865692@carlson.workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20041028124517.7204.qmail@web25210.mail.ukl.yahoo.com>
In-Reply-To: <20041028124517.7204.qmail@web25210.mail.ukl.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

a b writes:
> Next step will be to use pam because I saw that there
> is a ppp pam module coming with the ppp package.
> 
> According to the man page I simply need to use the
> "login" option and it will automatically look for the
> local system auth ?

As far as I know, PAM works only with PAP authentication.  This is
because all of the other authentication methods use cryptographic
hashes instead of simple passwords, and PAM expects to see the raw
password on the server (authenticator) side.

> Then, I will probably have a look at the radius
> plugin.

RADIUS ought to work with any of the authentication mechanisms, but I
haven't personally tried it.  Perhaps someone else here has ...

-- 
James Carlson                                 <carlsonj@workingcode.com>
