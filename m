From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 10 May 2007 17:29:45 +0000
Subject: Re: Auth-up and Auth-down
Message-Id: <17987.22153.166092.368197@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <10417238.post@talk.nabble.com>
In-Reply-To: <10417238.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Allen Green writes:
> 
> do Auth-up and Auth-down run by default?
> i created a simple Auth-down file in /etc/ppp/ :
> #!/bin/sh
> echo 1 > /root/1.txt

Are you sure you got the name of the file right?  It is:

	/etc/ppp/auth-down

not:

	/etc/ppp/Auth-down

Case ('a' versus 'A') is crucial.  Did you make the file executable
and owned by root?

Do you have debug logs from your pppd session?  How was pppd
configured?

Note that these scripts run only when pppd is configured as an
authenticator ("server"), and not when it's only the authenticatee
("client").

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
