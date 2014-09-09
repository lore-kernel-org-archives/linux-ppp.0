From: Rod <Rod@Rods.id.au>
Date: Tue, 09 Sep 2014 13:51:05 +0000
Subject: Persistant ethernet names and ppp
Message-Id: <540F05C9.6070706@Rods.id.au>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi,

     I'm running Gentoo, and have now got persistant ethernet names..

     This has created a problem, I'm not sure where it starts, but I 
dont have those names in /dev, as in /dev/enp4s1 (which is the port that 
plugs in the ADSL)

     from the man page, if I leave out the slash "/" it appends the 
/dev/ itself, but enp4s1 doesn't exist in /dev, so, how can I get pppoe 
working :(

     if I do ifconfig -a    I get the interface showing, I can set a IP, 
but I cannot get pppoe :(
