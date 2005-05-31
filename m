From: Julian Somers <jsomers@wiredocean.com>
Date: Tue, 31 May 2005 14:30:12 +0000
Subject: Re: No incoming data: GPRS, kernel 2.6.9, ppp 2.4.2
Message-Id: <20050531143012.GC2668@dev.wiredocean.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20050529211944.GE2052@dev.wiredocean.com>
In-Reply-To: <20050529211944.GE2052@dev.wiredocean.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Sun, May 29, 2005 at 10:19:44PM +0100, Julian Somers wrote:
> Hi
> 
> I have a problem using Ericsson phones (T39M and F251M) for GPRS with
> pppd 2.4.2 and kernel 2.6.9.
> 
> The connection seems to go through fine. I can send any amount of
> outgoing data. But I never get more than 3 or 4 packets of incoming
> data. About 3 times out of 10 the connection works perfectly, and stays
> connected indefinitely. I can see no difference in the logs between
> successful connections and unsuccessful connections, except for this
> lack of incoming data.
> 
> I can use GPRS on several other phones with no problems. 
> 
> I can use these Ericsson phones for GPRS on a machine running kernel
> 2.4.26, with the identical pppd binary, config files and chat script
> copied across. 

I have more information that is relevant here.

The T39 works on the machine with the 2.4 kernel only with 
	options ppp_async flag_time=0

How can I set flag_time=0 using a 2.6 kernel? 

I tried modifying drivers/net/ppp_async.c directly, adding:
	module_param(flag_time, int,  0);

but it didn't work.

Any ideas?

thanks, Julian

> 
> Is there any known problem with ppp 2.4.2 and kernel 2.6.9? Any clues
> as to what might cause intermittent one-way connecitons?
> 
> Thanks for your time,
> Julian
> 
> # pppd file /etc/ppp.conf
> 
> # cat /etc/ppp.conf
> /dev/ttyS0 
> ipparam dialup 
> 57600 
> crtscts 
> modem 
> lock 
> receive-all 
> nopcomp 
> noaccomp 
> nomagic 
> noccp 
> novj 
> novjccomp 
> nodetach 
> noipdefault 
> defaultroute 
> usepeerdns 
> user  web 
> connect '/usr/sbin/chat -e -S -f /etc/chat_connect -v' 
> disconnect '/usr/sbin/chat -e -S -f /etc/chat_disconnect -v' 
> 
> # cat /etc/chat_connect 
> ABORT           'BUSY' 
> ABORT           'NO ANSWER' 
> ABORT           'NO CARRIER' 
> ABORT           'NO DIALTONE' 
> ABORT           'NO DIAL TONE' 
> ABORT           'VOICE' 
> ABORT           'ERROR' 
> '' AT
> TIMEOUT 10
> OK ATE0
> OK ATV1
> OK 'AT+CGDCONT=4,"IP","internet"'
> OK AT+CGQREQ=4,0,0,0,0,0
> OK AT+CGQMIN=4,0,0,0,0,0
> OK ATDT*99***4#
> TIMEOUT 22
> CONNECT ""
> 
> # cat /etc/chat_disconnect 
> SAY "\nDisconnect...\n"
> "" "\K"
> "" "+++ATH"
> "" "+++ATH"
> "" "+++ATH"
> SAY "\nDisconnected.\n"
> 
> Here is a SUCCESSFUL connection
> ------------------------------
> May 29 11:19:51 [pppd] pppd 2.4.2 started by root, uid 0
> May 29 11:19:55 [pppd] Serial connection established.
> May 29 11:19:55 [pppd] using channel 3
> May 29 11:19:55 [pppd] Using interface ppp0
> May 29 11:19:55 [pppd] Connect: ppp0 <--> /dev/ttyS0
> May 29 11:19:56 [pppd] sent [LCP ConfReq id=0x1 <asyncmap 0x0>]
> May 29 11:19:56 [pppd] rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <pcomp> <accomp> <auth pap>]
> May 29 11:19:56 [pppd] sent [LCP ConfRej id=0x1 <pcomp> <accomp>]
> May 29 11:19:56 [pppd] rcvd [LCP ConfAck id=0x1 <asyncmap 0x0>]
> May 29 11:19:56 [pppd] rcvd [LCP ConfReq id=0x2 <asyncmap 0x0> <auth pap>]
> May 29 11:19:56 [pppd] sent [LCP ConfAck id=0x2 <asyncmap 0x0> <auth pap>]
> May 29 11:19:56 [pppd] sent [PAP AuthReq id=0x1 user="web" password=<hidden>]
> May 29 11:19:59 [pppd] sent [PAP AuthReq id=0x2 user="web" password=<hidden>]
> May 29 11:19:59 [pppd] rcvd [PAP AuthAck id=0x2 ""]
> May 29 11:19:59 [pppd] PAP authentication succeeded
> May 29 11:19:59 [pppd] sent [IPCP ConfReq id=0x1 <addr 0.0.0.0> <ms-dns1 0.0.0.0> <ms-dns3 0.0.0.0>]
> May 29 11:20:02 [pppd] sent [IPCP ConfReq id=0x1 <addr 0.0.0.0> <ms-dns1 0.0.0.0> <ms-dns3 0.0.0.0>]
> May 29 11:20:03 [pppd] rcvd [IPCP ConfReq id=0x1 <addr 10.164.255.254>]
> May 29 11:20:03 [pppd] sent [IPCP ConfAck id=0x1 <addr 10.164.255.254>]
> May 29 11:20:03 [pppd] rcvd [IPCP ConfNak id=0x1 <addr 10.164.11.70> <ms-dns1 172.29.129.11> <ms-dns3 172.29.129.11>]
> May 29 11:20:03 [pppd] sent [IPCP ConfReq id=0x2 <addr 10.164.11.70> <ms-dns1 172.29.129.11> <ms-dns3 172.29.129.11>]
>                 - Last output repeated twice -
> May 29 11:20:06 [pppd] rcvd [IPCP ConfAck id=0x2 <addr 10.164.11.70> <ms-dns1 172.29.129.11> <ms-dns3 172.29.129.11>]
> May 29 11:20:06 [pppd] not replacing existing default route to eth0 [192.168.1.2]
> May 29 11:20:06 [pppd] local  IP address 10.164.11.70
> May 29 11:20:06 [pppd] remote IP address 10.164.255.254
> May 29 11:20:06 [pppd] primary   DNS address 172.29.129.11
> May 29 11:20:06 [pppd] secondary DNS address 172.29.129.11
> May 29 11:20:06 [pppd] Script /etc/ppp/ip-up started (pid 2681)
> May 29 11:20:06 [pppd] Script /etc/ppp/ip-up finished (pid 2681), status = 0x1
> May 29 11:21:21 [pppd] Terminating on signal 15.
> May 29 11:21:21 [pppd] Script /etc/ppp/ip-down started (pid 4164)
> May 29 11:21:21 [pppd] sent [LCP TermReq id=0x2 "User request"]
> May 29 11:21:21 [pppd] rcvd [LCP TermAck id=0x2]
> May 29 11:21:21 [pppd] Connection terminated.
> May 29 11:21:21 [pppd] Connect time 1.5 minutes.
> May 29 11:21:21 [pppd] Sent 15132 bytes, received 3557 bytes.
> May 29 11:21:21 [pppd] Serial link disconnected.
> May 29 11:21:22 [pppd] Waiting for 1 child processes...
> May 29 11:21:22 [pppd] script /etc/ppp/ip-down, pid 4164
> May 29 11:21:22 [pppd] Script /etc/ppp/ip-down finished (pid 4164), status = 0x1
> May 29 11:21:22 [pppd] Exit.
> 
> and here is an UNSUCCESSFUL connection
> --------------------------------------
> May 29 11:22:20 [pppd] pppd 2.4.2 started by root, uid 0
> May 29 11:22:24 [pppd] Serial connection established.
> May 29 11:22:24 [pppd] using channel 4
> May 29 11:22:24 [pppd] Using interface ppp0
> May 29 11:22:24 [pppd] Connect: ppp0 <--> /dev/ttyS0
> May 29 11:22:25 [pppd] sent [LCP ConfReq id=0x1 <asyncmap 0x0>]
> May 29 11:22:25 [pppd] rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <pcomp> <accomp> <auth pap>]
> May 29 11:22:25 [pppd] sent [LCP ConfRej id=0x1 <pcomp> <accomp>]
> May 29 11:22:25 [pppd] rcvd [LCP ConfAck id=0x1 <asyncmap 0x0>]
> May 29 11:22:25 [pppd] rcvd [LCP ConfReq id=0x2 <asyncmap 0x0> <auth pap>]
> May 29 11:22:25 [pppd] sent [LCP ConfAck id=0x2 <asyncmap 0x0> <auth pap>]
> May 29 11:22:25 [pppd] sent [PAP AuthReq id=0x1 user="web" password=<hidden>]
> May 29 11:22:28 [pppd] sent [PAP AuthReq id=0x2 user="web" password=<hidden>]
> May 29 11:22:28 [pppd] rcvd [PAP AuthAck id=0x2 ""]
> May 29 11:22:28 [pppd] PAP authentication succeeded
> May 29 11:22:28 [pppd] sent [IPCP ConfReq id=0x1 <addr 0.0.0.0> <ms-dns1 0.0.0.0> <ms-dns3 0.0.0.0>]
>                 - Last output repeated twice -
> May 29 11:22:32 [pppd] rcvd [IPCP ConfReq id=0x1 <addr 10.164.255.254>]
> May 29 11:22:32 [pppd] sent [IPCP ConfAck id=0x1 <addr 10.164.255.254>]
> May 29 11:22:32 [pppd] rcvd [IPCP ConfNak id=0x1 <addr 10.164.6.237> <ms-dns1 172.29.129.11> <ms-dns3 172.29.129.11>]
> May 29 11:22:32 [pppd] sent [IPCP ConfReq id=0x2 <addr 10.164.6.237> <ms-dns1 172.29.129.11> <ms-dns3 172.29.129.11>]
> May 29 11:22:32 [pppd] rcvd [IPCP ConfAck id=0x2 <addr 10.164.6.237> <ms-dns1 172.29.129.11> <ms-dns3 172.29.129.11>]
> May 29 11:22:32 [pppd] local  IP address 10.164.6.237
> May 29 11:22:32 [pppd] remote IP address 10.164.255.254
> May 29 11:22:32 [pppd] primary   DNS address 172.29.129.11
> May 29 11:22:32 [pppd] secondary DNS address 172.29.129.11
> May 29 11:22:32 [pppd] Script /etc/ppp/ip-up started (pid 5527)
> May 29 11:22:32 [pppd] Script /etc/ppp/ip-up finished (pid 5527), status = 0x1
> May 29 11:24:07 [pppd] Terminating on signal 15.
> May 29 11:24:07 [pppd] Script /etc/ppp/ip-down started (pid 7463)
> May 29 11:24:07 [pppd] sent [LCP TermReq id=0x2 "User request"]
> May 29 11:24:07 [pppd] Script /etc/ppp/ip-down finished (pid 7463), status = 0x1
> May 29 11:24:07 [pppd] rcvd [LCP TermAck id=0x2]
> May 29 11:24:07 [pppd] Connection terminated.
> May 29 11:24:07 [pppd] Connect time 1.8 minutes.
> May 29 11:24:07 [pppd] Sent 12758 bytes, received 54 bytes.
> May 29 11:24:08 [pppd] Serial link disconnected.
> May 29 11:24:09 [pppd] Exit.
> 
> # uname -a 
> Linux wiredocean 2.6.9 #2 SMP Tue Nov 16 14:01:25 GMT 2004 i686 VIA Samuel 2 CentaurHauls GNU/Linux
> 
> Motherboards are EPIA-M rev B
> 
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
