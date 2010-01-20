From: Bill Unruh <unruh@physics.ubc.ca>
Date: Wed, 20 Jan 2010 05:34:05 +0000
Subject: Re: pppd hangs on SIGHUP
Message-Id: <Pine.LNX.4.64.1001192124040.14876@info.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <8D.DA.01403.892965B4@cdptpa-omtalb.mail.rr.com>
In-Reply-To: <8D.DA.01403.892965B4@cdptpa-omtalb.mail.rr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Tue, 19 Jan 2010, Leslie Rhorer wrote:

>
> Hello,
>
> 	I am experiencing a strange, intermittent problem with pppd.  I am
> running pppd version 2.4.4 under Debian "Lenny" on an old Dell Optiplex
> GX260 using kernel 2.6.26-2-686.  I have a Calcomp A600 3G Wireless modem
> dialing a broadband wireless carrier.  The system is configured as a linux
> router running an openvpn client over the ppp0 connection, with dnsmasq
> providing DHCP clients on eth0 with IP configuration and ntp providing a
> clock source.  If I leave the router up and running, after 12 hours the ISP
> disconnects the line.  I can avoid this by sending a SIGHUP every few hours.
> I of course have pppd running with the persist option, and usually pppd will
> dutifully hang up the modem and start the chat session over again to obtain
> connectivity.  Frequently, however, pppd will simply hang rather than
> restarting the connection.  Subsequent SIGTERM or SIGHUP signals will do
> nothing whatsoever.  The only way (of which I know) to release the terminal
> (/cev/ttyACM0) is to send a SIGKILL.  After doing so, /dev/ttyACM0 is
> released, and I can use a utility such as minicom to access the modem.  I
> can dial out and get a carrier.  I can see the ppp authentication request
> from the ISP.  What I cannot do, however, is get pppd to come back up.  If I
> start pppd again, it opens the /dev/ttyACM0 device and creates the lockfile,
> but it does not attempt to run chat or evidently do anything else other than
> refresh the lockfile if it is stale.  My only option at that point is to
> reboot the host.  A warm reboot allows the router to call out again.
> Rebooting the router is a rather Draconian approach, not to mention the fact
> it takes a little bit of time.  The problem by no means happens every time,
> but it does happen very frequently, perhaps one restart out of three. Is
> there some way other than sending a SIGHUP to get pppd to hang up gracefully
> and redial the line?  Is there something I can do to get pppd to start
> working properly when it hangs, short of rebooting the router?
>
> 	Here is a snapshot from /var/log/syslog during one of the events:
>
> Jan 19 19:35:29 Cricket pppd[2783]: Hangup (SIGHUP)
> Jan 19 19:35:29 Cricket pppd[2783]: Connect time 152.1 minutes.
> Jan 19 19:35:29 Cricket pppd[2783]: Sent 1551485 bytes, received 1648658
> bytes.
> Jan 19 19:35:29 Cricket pppd[2783]: Script /etc/ppp/ip-down started (pid
> 10026)
> Jan 19 19:35:29 Cricket pppd[2783]: sent [LCP TermReq id=0xe "User request"]
> Jan 19 19:35:29 Cricket pppd[2783]: Script /etc/ppp/ip-down finished (pid
> 10026), status = 0x0
> Jan 19 19:35:32 Cricket pppd[2783]: sent [LCP TermReq id=0xf "User request"]
> Jan 19 19:35:35 Cricket pppd[2783]: Connection terminated.
> Jan 19 19:39:00 Cricket pppd[2783]: ioctl(TIOCSETD, N_TTY): Interrupted
> system call (line 571)
> Jan 19 19:39:01 Cricket pppd[2783]: tcsetattr: Interrupted system call (line
> 1010)
> Jan 19 19:39:01 Cricket pppd[2783]: Hangup (SIGHUP)
> Jan 19 19:39:01 Cricket pppd[2783]: Modem hangup
> Jan 19 19:39:02 Cricket pppd[2783]: Hangup (SIGHUP)
>
> 	Then nothing else.  After I kill the process and restart pppd, I get
> only a single line:
>
> Jan 19 20:11:45 Cricket pppd[18566]: pppd 2.4.4 started by root, uid 0
>
> 	Another time the log had the same results except it quit logging
> after the ioctl(TIOCSETD, N_TTY) line.
>
>
> 	I call pppd with `pppd call cricket`
>
> 	Active options in the /etc/ppp/options file:
>
> asyncmap 0
Not needed.

> usehostname
not needed

> noipdefault
> usepeerdns
> defaultroute
> auth
definitely do not want.
You do not want them to authenticate to you.


> local
> lock
> hide-password
> debug
> lcp-echo-interval 30
> lcp-echo-failure 4
> noipx
>
> 	Contents of /etc/ppp/peers/cricket:
>
> user "(830)388-4911@mycricket.com"
> connect "/usr/sbin/chat -v -f /etc/ppp/chatfile"
> /dev/ttyACM0
> noipdefault
> usepeerdns
> defaultroute
> persist
> noauth
>
> 	Contents of /etc/ppp/chatfile
>
> ABORT "NO CARRIER"
> ABORT "NO DIALTONE"
> ABORT "ERROR"
> ABORT "NO ANSWER"
> ABORT "BUSY"
> "" "AT"
Try AT&F
instead

> OK "ATDT#777"
> CONNECT
>
