From: Philipp Kolmann <philipp@kolmann.at>
Date: Tue, 22 Jun 2004 15:46:45 +0000
Subject: pppd with radius-plugin seems to have troubles with traffic counter
Message-Id: <20040622154645.GA12959@kolmann.at>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

Hi!

I seems to have found a bug in pppd 2.4.2. I am running a pptp-pppd VPN
server to authenticate Users coming in with laptops (at my university).

We authenticate the Users using the radius plugin and do also traffic
accounting with radius. Everything seems to be fine, but when a user
reaches over 4GB the traffic goes down to 0 again. I believe that this
could be a problem with an integer value running over.

Here is the relevant part of my mysql log file (I use a radiusd that
logs the acct-requests into a mysql db, interim accounting is done every
10 minutes):

040622 14:30:14   17953 Query       UPDATE calls SET
		acct_session_time=16203,acct_input_octets=92129211,
		acct_output_octetsB58766205,
		framed_ip_address=3D'193.170.XX.XX',timestamp=3DNOW()=20
		WHERE user_name=3D'eXXXXXXX@student.tuwien.ac.at' AND=20
		status=3D 1 AND acct_session_id=3D'40D7E70949C7'
040622 14:40:14   17953 Query       UPDATE calls SET
		acct_session_time=16803,acct_input_octets=95118037,
		acct_output_octets=110195513,
		framed_ip_address=3D'193.170.XX.XX',timestamp=3DNOW()=20
		WHERE user_name=3D'eXXXXXXX@student.tuwien.ac.at' AND
		status=3D 1 AND acct_session_id=3D'40D7E70949C7'

As you can see in theis session the acct_output_octets drops from over
4GB to around 100MB within 10 minutes (possible in our local lan).

I hope you can fix this,
thanks in advance
Philipp Kolmann
IT Dept.
Technical University of Vienna



--=20
Life is not fair,
but the root password helps!
