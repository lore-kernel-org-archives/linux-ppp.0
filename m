From: Robert Voigt <robert.voigt@thalesatm.com>
Date: Fri, 30 Nov 2007 11:18:58 +0000
Subject: No packets get through after a while
Message-Id: <1196421538.2082.89.camel@sls6bk>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi everybody,

here is a strange problem that I can't solve:

I have a ppp connection from an embedded board with Fedora 7 (ppp 2.4.4,
stock kernel-2.6.21) over null modem cable to a FC6 PC (ppp 2.4.4,
kernel 2.6.18). I'm pinging from the board to the PC. After a while, it
can be a few minutes or several hours, no packets from ping or anything
else get through. It works again when I restart pppd on the board.

I'm starting pppd on the board in /etc/inittab:
pp:2345:respawn:/usr/sbin/pppd lock persist nodetach crtscts debug
kdebug 7 192.168.1.2:192.168.1.1 /dev/ttyS2 38400

And on the PC:
pp:2345:respawn:/usr/sbin/pppd lock persist nodetach crtscts
192.168.1.1:192.168.1.2 /dev/ttyS1 38400


I don't get any log messages when this happens. (I have
daemon.* /var/log/ppp-log in /etc/syslog.conf)

The only thing I notice is when I start pppd on the commandline, when it
hangs and I Ctrl-C it, it does not return. On the second Ctrl-C it says:
tcsetattr: Interrupted system call (line 1001)
It returns on the third Ctrl-C.

When I Ctrl-C it when it does not hang, it returns correctly after
terminating.

I have tried a debug version of ppp 2.4.4. When it hangs the backtrace
shows the last line in ppp code is sys-linux.c:1051
void wait_input(struct timeval *timo)
{
...
    n = select(max_in_fd + 1, &ready, NULL, &exc, timo);
...
}

But that seems to be always the place where it waits after
initialization. Is it in the kernel part of ppp then?

I will be grateful for any advice.

Robert
