From: Sekar D <sekar.linux@gmail.com>
Date: Tue, 13 Sep 2016 12:45:35 +0000
Subject: CHAP Auth issue at CentOS-6.8
Message-Id: <CAGc3wVD6QP4T4wzYsV0hiFU4aXqX0O0fka=f966jNfWCTb4OXA@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi Friends,

I am using CentOS-6.8 and ppp-2.4.5 , rp-pppoe-3.10-16.

I am getting CHAP Authentication failed when do the following

ifup ppp0

ifdown ppp0

sleep 20;

ifup ppp0


The same line working fine if I wait 2 minutes to bring it up after
shutdown the line.

I did not see kind of issue on CentOS-5.11 . Please let me know if I
need to change any config parameters.

Thanks.
