From: James Carlson <carlsonj@workingcode.com>
Date: Fri, 17 Jul 2009 17:33:49 +0000
Subject: Re: pppd against RADIUS
Message-Id: <4A60B5FD.6080900@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <51894d8a0907170915p604dfeaavcd3529afe7c93c@mail.gmail.com>
In-Reply-To: <51894d8a0907170915p604dfeaavcd3529afe7c93c@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

David Leon wrote:
> I need some help. I'm dialing out to a "closed network" to make a ppp
> link, but have to authenticate against a remote RADIUS server on that
> network.
> 
> I connected manually using minicom and I already have the ppp-on and
> ppp-on-dialer scripts working ok. I have to authenticate twice. Fist
> time to get access to the router, and execute ppp manually, wich the
> script already done, and the authentiocate ppp against the RADIUS
> server wich I don't have a clue how can I do that.

You'll probably need to provide more details, such as your configuration
files, the exact command sequence you're using, and the messages and/or
errors you see.

In general, if a remote PPP access device ("server") is using RADIUS,
then that's no concern of yours as you authenticate to it.  You just set
up your PAP or CHAP credentials as usual for PPP, and it's the peer's
responsibility to contact the RADIUS server on your behalf in order to
verify your identity.

Dial-out clients don't typically run RADIUS.  It doesn't make sense, as
RADIUS is a mechanism that (among other things) allows you to validate
someone else's identity.  That's why it's used on the dial-in "server"
side of the connection.

(If it helps, you can think of RADIUS as being a little like NIS, LDAP,
Active Directory, or even PAM.  As a user logging into the system, you
don't really have to know where the server is or much about it.  You
just have to provide your credentials using whatever the _local_
protocol is.)

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
