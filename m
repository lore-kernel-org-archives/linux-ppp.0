From: Rod Smart <snaketails@optusnet.com.au>
Date: Sat, 03 Apr 2004 00:29:22 +0000
Subject: Re: dialin server not routing/forwarding????
Message-Id: <406E0562.6000509@optusnet.com.au>
List-Id: <linux-ppp.vger.kernel.org>
References: <406DD9F3.6060901@ansco.com>
In-Reply-To: <406DD9F3.6060901@ansco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

    I have added comments to your text.

    Qn. are you using mgetty for dialin?

Milen Dimitrov wrote:

> Hi,
> I just setup a dialin server on RedHat 9.
> Dial in server is a member of LAN with common gateway 192.168.1.1.
> I can browse internet from dial-in server and I can ping any other PC 
> in the LAN.
>
> From a windows PC i can dial in and connect to the server but I cannot 
> browse Internet.
> When connected to the dial-in server my windows PC has the following 
> ipsettings and I cannot ping
> any other PC in the LAN except dial in server (192.168.1.10) I'm 
> connected to:
> c:\>ipconfig /all
> PPP adapter test2PPP:
>       Connection-specific DNS Suffix  . :
>       Description . . . . . . . . . . . : WAN (PPP/SLIP) Interface
>       Physical Address. . . . . . . . . : 00-53-45-00-00-00
>       DHCP Enabled. . . . . . . . . . . : No
>       IP Address. . . . . . . . . . . . : 192.168.1.171
>       Subnet Mask . . . . . . . . . . . : 255.255.255.255
>       Default Gateway . . . . . . . . . : 192.168.1.171
>       DNS Servers . . . . . . . . . . . : 192.168.1.2
>                                                     192.168.1.3
>
> As you see the IP and the gateway for my windows PC are the same - 
> 192.168.1.171. Is this correct?
>
> My guess is that the linux Dial-in server doesn't route/forward 
> packets from PPP  to the rest of the LAN?
> How I can prove if it's true or not?
> Which config files/log files to be check out?
> Which tools I can use to debug it?
>
> Thank you for the help in advance!
> Milen
> =================
> Please see some of config files bellow:
> /etc/ppp/options
> contains:
> -----------------------
> -detach
> asyncmap 0
> netmask 255.255.255.0
> proxyarp
> lock
> crtscts
> modem
> noauth
> ms-dns 192.168.1.1
> ms-dns 192.168.1.1
> --------------------- 

    My options file contains the following.

  lock
  dump

>
> /etc/ppp/options.ttyS0
> contains:
> -----------------------
> 192.168.1.10:192.168.1.171
> ----------------------- 


    My options.dialin (same as your options.ttyS0)

  crtscts
  modem
  debug
  lock
  login
  require-pap
  refuse-chap
  proxyarp
  asyncmap 20a0000
  ms-dns 192.168.1.1
  ms-wins 192.168.1.1
  192.168.1.1:


    My ip-up contains the following

  /sbin/route add -net $5 netmask 255.255.255.0 ppp0
  /etc/rc.d/rc.pppfirewall

    The last one configures the firewall (IPCHAINS) to allow packet 
forwarding between ppp0 <-> eth1 (Internet), ppp0 <-> lo, ppp0 <-> eth0, 
ppp0 <-> eth2

/etc/mgetty+sendfax/dialin.config = empty

/etc/mgetty+sendfax/mgetty.config

  port ttyS0
  init-chat  ""  ATZ\r  OK
  rings 2
  answer-chat "" ATA CONNECT \c
  issue  /etc/issue

/etc/mgetty+sendfax/login.config

  /AutoPPP/   -   a_ppp   /usr/sbin/pppd   file   /etc/ppp/options.dialin


    ^^^^^   Yes, I could have put the standard options on the end in the 
file, but I have a limit of how many I can use in the login.config file, 
as "file xxxx" is a valid option, I used that to grab the options from 
an external file ;o)

/etc/ppp/pap-secrets

user1   *   ""   192.168.1.3
user2   *   ""   192.168.1.4

    ^^^^  Having "" as password allows the use of the password stored in 
PAM/Shadow

    I have a web proxy server running, so the windows dialin box will 
use that proxy instead of directly to the Internet

