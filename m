From: carlsonj@workingcode.com
Date: Wed, 17 Nov 2004 11:43:17 +0000
Subject: Re: Socket doesn't get EOF
Message-Id: <16795.14677.115819.798144@carlson.workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <41998875.2020305@blazemail.com>
In-Reply-To: <41998875.2020305@blazemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

K-sPecial writes:
> Thanks, that was very informative, it made sense and I much appreciate 
> the prompt response. I have added a timeout on the socket and will get a 
> glimpse of what happens next time pppd dies.

You can also have pppd clobber the application via the
/etc/ppp/ip-down script.  I'd suggest that doing so is a mistake.  If
the link comes back (it was just a short glitch), then the application
fails for no reason.  If the network is designed with multiple paths,
then there's really no good way to know when (or if) to kill the
application.

Moreover, you'd have no way to know if some intermediate router
failed, and you'd likely want to have the application "notified" in
some way if that were to happen for the same reason that you want pppd
to kill the application.  If you can't detect router failure in
practice, is there much additional value to detecting local interface
failure?

-- 
James Carlson                                 <carlsonj@workingcode.com>
