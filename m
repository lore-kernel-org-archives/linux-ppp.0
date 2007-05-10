From: Allen Green <allen_green1981@yahoo.com>
Date: Thu, 10 May 2007 16:48:52 +0000
Subject: Auth-up and Auth-down
Message-Id: <10417238.post@talk.nabble.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


do Auth-up and Auth-down run by default?
i created a simple Auth-down file in /etc/ppp/ :
#!/bin/sh
echo 1 > /root/1.txt

and im using poptop server, but nothing happened  when a user logined and
logouted.
i think these files do not run by default 
-- 
View this message in context: http://www.nabble.com/Auth-up-and-Auth-down-tf3722844.html#a10417238
Sent from the linux-ppp mailing list archive at Nabble.com.

