From: Patrick Fischer <patrick.fischer@4g-systems.com>
Date: Wed, 17 Oct 2007 15:46:05 +0000
Subject: sometimes ppp will not get the dns
Message-Id: <13255677.post@talk.nabble.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


attached you see two connections log(in one file). In the first you see that
we successful get 
addr 80.187.82.81> <ms-dns1 193.254.160.130> <ms-dns3 193.254.160.1>

in the second log we only get an IP but no dns.
<addr 80.187.54.60>

DNS 10.11.12.13 and 10.11.12.14 are default values and not valid.

Both logs are from pppd2.3 but the 2.4 has the same problem.

Has anybody an proposal for solution or just an idear?
With this bug we can't go online (use the dns).

http://www.nabble.com/file/p13255677/ppp-log ppp-log 
-- 
View this message in context: http://www.nabble.com/sometimes-ppp-will-not-get-the-dns-tf4641175.html#a13255677
Sent from the linux-ppp mailing list archive at Nabble.com.

