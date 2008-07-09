From: "Nicholas Hickman" <nhickman@dtechlabs.com>
Date: Wed, 09 Jul 2008 15:09:59 +0000
Subject: net_mask 255.255.255.255
Message-Id: <8140AAF341CC904BA92C3D6A5A190978440A4D@ditech-1.ditechllc.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

What is the reason for the lines 2362 & 2363 in sys-linux.c?  Why not
just accept the netmask option from the peer config?


/*
 *  Set the netmask.
 *  For recent kernels, force the netmask to 255.255.255.255.
 */
    if (kernel_version >= KVERSION(2,1,16))
	net_mask = ~0L;


-Nick
