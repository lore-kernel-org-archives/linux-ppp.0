From: Jim Barber <jim.barber@ddihealth.com>
Date: Thu, 08 Sep 2005 00:24:32 +0000
Subject: Re: Windows IPSec/L2TP VPN client and Linux server with RADIUS, and
Message-Id: <431F84C0.2090806@ddihealth.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <431C13DD.9080600@ddihealth.com>
In-Reply-To: <431C13DD.9080600@ddihealth.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I decided to comment out the following entries in the
/etc/ppp/options.l2tpd file:

	#refuse-chap
	#refuse-mschap
	#require-mschap-v2

Then I changed the security settings in the VPN client software to
untick everything except for plain CHAP.

Now when I connect I see the following in the freeradius logs, and the
VPN successful establishes a connection.

rad_recv: Accounting-Request packet from host 10.10.0.218:1026, id7, length3
         Acct-Session-Id = "431F80CF7EB000"
         User-Name = "user1"
         Acct-Status-Type = Stop
         Service-Type = Framed-User
         Framed-Protocol = PPP
         Acct-Authentic = RADIUS
         Acct-Session-Time = 18
         Acct-Output-Octets = 33
         Acct-Input-Octets = 785
         Acct-Output-Packets = 2
         Acct-Input-Packets = 8
         NAS-Port-Type = Async
         Acct-Terminate-Cause = User-Request
         Framed-IP-Address = 10.10.0.248
         NAS-IP-Address = 10.10.0.216
         NAS-Port = 0
         Acct-Delay-Time = 0

But then I did something that was strange.
I turned on the refuse-chap, refuse-mschap, and require-mschap-v2
options in the options.l2tpd file again, and then tried to connect with
VPN client again, expecting it to fail...
But it didn't. With the VPN client still configured to only use CHAP,
it was allowed to log in despite the 'require-mschap-v2' directive.
I had bounced all daemons to make sure that the changes were picked up.

Does that give anyone some clues?

----------
Jim Barber
DDI Health



