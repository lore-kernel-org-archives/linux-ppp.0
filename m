From: James Carlson <carlson@workingcode.com>
Date: Tue, 16 Mar 2004 12:54:04 +0000
Subject: Re: Moving logwtmp
Message-Id: <16470.63724.573009.628960@c-24-147-210-59.ne.client2.attbi.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <91A5926EFF44D3118B1200104B7276EB02C56E0B@hart-exchange.hartwellcorp.com>
In-Reply-To: <91A5926EFF44D3118B1200104B7276EB02C56E0B@hart-exchange.hartwellcorp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

James Cameron writes:
> plogin() in auth.c calls logwtmp().  plogin() is only called if PAP
> authentication is being done, and the secret is "@login", meaning that
> the system's authentication is being used.  Or PAM.

Right.  The implication is that the remote peer name is authenticated
as being a system user.

> But even so, I can see that a logwtmp() in the other authentication
> paths would help with accounting, and "who".

I'm not so sure that's right.  The problem is that if the peer name
isn't authenticated as a system user name, then it's essentially an
arbitrary (and PPP-local) identifier, and it really ought not appear
in wtmp.  It'd be essentially equivalent to recording wtmp entries for
users authenticated via Apache .htaccess.

I'd support that as a configuration option, though, with appropriate
warnings.  ("If you do this, then your wtmp file will contain
PPP-authenticated names that might not match real UIDs on your system,
and may confuse the heck out of management software.")

-- 
James Carlson                                  <carlson@workingcode.com>
