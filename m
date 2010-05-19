From: Erik L <erik_list@caneris.com>
Date: Wed, 19 May 2010 19:17:20 +0000
Subject: Multilink packet loss 2.6.32
Message-Id: <20084927.34.1274296640775.JavaMail.root@zimbra.caneris.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi,

We're using ppp both on our ADSL LNSs and on customer CPEs. Both ends are running 2.6.32 kernels. We've been trying to resolve a packet loss issue which occurs with multilink for over a week with no success. We suspect the issue has to do with fragmentation, possibly something wrong with ppp_mp_explode in ppp_generic.c, but we're not sure what.

I don't want to overwhelm the list with all the data we've gathered so far just yet, but if anyone has any ideas, they'd be most appreciated.

Thanks
Erik
