From: Ray Van Dolson <rayvd@corp.digitalpath.net>
Date: Mon, 19 Jul 2004 17:53:30 +0000
Subject: Failover and Radius authentication?
Message-Id: <20040719175330.GA3928@digitalpath.net>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

We currently authenticate our users using the radius plugins which use
radiusclient (works great).  I am trying to set up a failover option
however for the rare case when and if a the radius server becomes
unavailable.

In that case, we'd like to just authenticate ALL logins by default instead
of requiring authentication from the radius server.  I'm trying to figure
out the best way to do this...

Does the options file support multiple authentication methods?  IE, if
one method (radius) files, it will try the next (chap-secrets file, etc)?
I'd even love to be able to throw "noauth" right below the radius.so plugin
line and have it not require authentication at all if the radius servers
do not respond, but I fear this wouldn't do exactly what I want.

I am currently thinking of two other solutions... setting up a poller on
each of our NAS devices to check that the radius server is up.  If it's not
it copies a new options file over that will allow all accounts to 
authenticate, then returns to the original options file when the Radius
server returns.

The other option would be to write a small Radius server (in python or
perl) that simply responds to all requests with the Access-Accept message
and whatever params we need.  This server would run on all our NAS's and
be listed as the last radius server in the radiusclient.conf file so that
if the previous radius servers did not reply, the final one would let
any account in.

I don't like the first solution so well because it seems too kludgy.

For the second, I am wondering how the the list of radius servers is
chosen from?  If one is picked at random, then this solution would obviously
not work.  But if the first server is always tried first, then the second,
then the third, etc... it would.

Anyways, open to suggestions.

Thanks,
Ray
