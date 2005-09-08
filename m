From: Jim Barber <jim.barber@ddihealth.com>
Date: Thu, 08 Sep 2005 03:03:02 +0000
Subject: Re: Windows IPSec/L2TP VPN client and Linux server with RADIUS, and
Message-Id: <431FA9E6.4030108@ddihealth.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <431C13DD.9080600@ddihealth.com>
In-Reply-To: <431C13DD.9080600@ddihealth.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Further to below, I compared the freeradius dictionary.microsoft file
with the one I've been supplied with.
Apart from the differences I described below, also the word "octects"
in the freeradius file is "string" in the dictionary file for
radiusclient.
Also, some of the entries in the freeradius dictionary have strings
like "encrypt=1" or "encrypt=2". These strings don't exist in the
radiusclient dictionary file.

Regards,
Jim Barber.


---------

Success!

Finally it's been solved.
There were a couple of things wrong.
Here is what I had to change:

My /etc/l2tpd/l2tpd.conf file now looks like:

	[global]
	listen-addr = 10.10.0.219
	port = 1701

	[lns default]
	ip range = 10.10.0.248 - 10.10.0.254
	local ip = 10.10.0.220
	hostname = vpn1
	ppp debug = yes
	pppoptfile = /etc/ppp/options.l2tpd
	length bit = yes

I had to get rid of the following lines from the [lns default] section:

	refuse pap = yes
	require chap = yes
	require authentication = yes

This is because they overrided all of the following options in the
/etc/ppp/options.l2tpd file:

	refuse-pap
	refuse-chap
	refuse-mschap
	require-mschap-v2

No matter how the above options were set, I was able to connect using
PAP, etc despite it being refused. (Refusing PAP in the l2tpd.conf file
didn't have any effect).


Next, my dictonary files in the /etc/radiusclient/ directory.
The debian radiusclient1 package doesn't come with a
dictionary.microsoft file.

The file I needed is not in the same format as the dictionary.microsoft
supplied with the freeradius package.

The format I need doesn't have the "BEGIN-VENDOR Microsoft",
"END-VENDOR" Microsoft directives, but instead has the word "Microsoft"
at the end of each line.

Also I was using the wrong syntax when including the
dictionary.microsoft file.
I put into the /etc/radiusclient/dictionary file the following directive

	$INCLUDE dictionary.microsoft

This seems to be the format that the freeradius dictionary files use
to include other dictionaries.
THIS DOES NOT WORK for the radiusclient dictionaries.
The directive must look like:

	INCLUDE /etc/radiusclient/dictionary.microsoft

The leading $ sign must be removed from the INCLUDE directive and a
full path to the dictionary file MUST be used. If either of these things
are wrong, then my VPN client will fail to connect.
What is annoying is that in the top of the dictionary.ascend file that
is supplied as part of radiusclient the comment says:

#
# Ascend dictionary.
#
#               Enable by putting the line "$INCLUDE dictionary.ascend" into
#               the main dictionary file.
#
# Version:      1.00  21-Jul-1997  Jens Glaser <jens@regio.net>
#

There is it there in the wrong syntax.

So I'm not sure if the problem is with the radiusclient package, or
perhaps the ppp radius.so plugin itself?
Does the radius.so plugin parse the dictionary files itself?

I'm thinking that I need to log a bug somewhere so that this doesn't
catch anyone else out in the future, because this problem is VERY obscure.

Thanks for the help, and hopefully this helps someone else in the future.

--
----------
Jim Barber
DDI Health
