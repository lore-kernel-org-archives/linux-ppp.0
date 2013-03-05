From: Stephen Hemminger <stephen@networkplumber.org>
Date: Tue, 05 Mar 2013 16:24:20 +0000
Subject: Fw: [Bug 54601] PPP regression on 3.2.39 stop work need restart server on version 3.0.X not found th
Message-Id: <20130305082420.3e683cca@nehalam.linuxnetplumber.net>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org



Begin forwarded message:

Date: Tue, 5 Mar 2013 04:36:23 -0800
From: "bugzilla-daemon@bugzilla.kernel.org" <bugzilla-daemon@bugzilla.kernel.org>
To: "stephen@networkplumber.org" <stephen@networkplumber.org>
Subject: [Bug 54601] PPP regression on 3.2.39 stop work need restart server on version 3.0.X not found this problem.


https://bugzilla.kernel.org/show_bug.cgi?idT601





--- Comment #2 from Martin Zaharinov <micron10@gmail.com>  2013-03-05 12:35:16 ---
One test from my:
After connect 1000 pppoe users to server, 10 user with home soho routers and
wrong password try to reconnect 10 times for 1 minute. After random time server
crash with the above errors!
Next test reboot system and fix password and user from this 10 users the
problem is going.
Maybe the problem is a end of open socket and kernel is going ot Hung task with
this crash.

Best regards,
m.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
