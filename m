From: Mikado <mikado4vn@yahoo.com>
Date: Wed, 19 Jan 2005 14:57:22 +0000
Subject: Multiple gateways linux router + Load balance
Message-Id: <20050119145722.66698.qmail@web53708.mail.yahoo.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="0-1640087468-1106146642=:65344"
List-Id: <linux-ppp.vger.kernel.org>
To: linux-ppp@vger.kernel.org

--0-1640087468-1106146642=:65344
Content-Type: text/plain; charset=us-ascii
Content-Id: 
Content-Disposition: inline

I'm making a router with 2 adsl lines. How can I use
both lines with R-E-A-L load balancing on 2.4.x linux
box and share these lines for hosts on LAN?

I've got some guides show the way of using Multipath
routing + Equalizing between these routes but I cannot
get real advantage of load balancing because the
route-cache make connections to 1 address go the same
route as the first connection to that address.

Is there any patch for kernel 2.4.x outside the wild
to fix this situation?

Thank you, I need all your helps!

P.S: I attach a text file which shows my box structure
down here!

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
--0-1640087468-1106146642=:65344
Content-Type: text/plain; name="box.txt"
Content-Description: box.txt
Content-Disposition: inline; filename="box.txt"


 [adsl-modem-1   ][adsl-modem-2   ]
 [192.168.1.150  ][192.168.1.150  ]
         +                +                    Hosts
         +                +                     on
         +                +                     LAN
=======eth0=============eth1========         ===  ===
=[192.168.1.10   ][192.168.2.10   ]=          +    +
=                                  =          +    +
=                                  =          +    +
=                 [192.168.0.10   ]eth2+++++[ switch ]
=                                  =
=                                  =
=[210.245.x.x    ][203.113.x.x    ]=
=======ppp0=============ppp1========
         +                +
         +                +
         +                +
         +                +
 [210.245.24.5   ][203.113.168.254]
 [isp1-gateway   ][isp2-gateway   ]
         +                +
         +                +
         +                +
         +                +
======================================================
              INTERNET ENVIRONMENT

- adsl-modem-1 is used to make ppp0
  adsl-modem-2 is used to make ppp1
- 210.245.x.x has network: 210.245.0.0/16
  203.113.x.x has network: 203.113.0.0/16


--0-1640087468-1106146642=:65344--
