From: James Carlson <carlsonj@workingcode.com>
Date: Mon, 07 Jul 2008 11:18:28 +0000
Subject: Re: disconnect
Message-Id: <18545.64388.532336.790036@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <W6009161227901215107101@webmail35>
In-Reply-To: <W6009161227901215107101@webmail35>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

tony.chamberlain@lemko.com writes:
> then I killed the pptp process and watched it start up again.
> The one problem is, the owner of the VPN said it didn't disconnect
> correctly so I soon used up all the IP addresses in the IP pool.

Killing the pppd process with SIGTERM should cause it to send a normal
termination signal to the peer.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
