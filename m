From: bfc <chappaquasuite@yahoo.com>
Date: Wed, 13 Feb 2008 21:46:28 +0000
Subject: if-up et al script relocation
Message-Id: <15468731.post@talk.nabble.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


Is it possible to relocat the if-up, if-down, auth-up... scripts to somewhere
other than
/etc/ppp.  We'd like to use our custom scripts for our app w/o interfering
with any
customer use of PPP.

If that's not possible, is it possible to have some variant of if-up and
friends for only particular
ttyname -- the Doc shows an alternate options file for a particular ttyname,
but not the rest
of the stuff.  (OR... if there was a magic option to plant the default
scripts elsewhere.)

Thanks!
-- 
View this message in context: http://www.nabble.com/if-up-et-al-script-relocation-tp15468731p15468731.html
Sent from the linux-ppp mailing list archive at Nabble.com.

