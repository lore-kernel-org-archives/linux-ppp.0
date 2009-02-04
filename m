From: tony.chamberlain@lemko.com
Date: Wed, 04 Feb 2009 17:05:49 +0000
Subject: VPN disconnect
Message-Id: <W66896262654641233767149@webmail29>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

This is another VPN question.

We have a regular IP address which we use to connect to a PPTP VPN
which assigns us 10.0.1.29.  If the PPTP connection goes down, we
will lose that address.

Our software relies on our IP address being 10.0.1.29.  Is there a way,
if the VPN temporarily goes down, to maintain the IP address of
10.0.1.29 ?


