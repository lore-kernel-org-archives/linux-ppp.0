From: Clifford Kite <kite_linux-ppp@ev1.net>
Date: Thu, 11 Nov 2004 15:05:50 +0000
Subject: Re: ppp problem red hat linux 6.0
Message-Id: <Pine.LNX.4.21.0411110844370.10690-100000@corncob.localhost.tld>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.LNX.4.33.0411111534020.30509-100000@parijat.info.com.np>
In-Reply-To: <Pine.LNX.4.33.0411111534020.30509-100000@parijat.info.com.np>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, 11 Nov 2004, Ajay Dangol wrote:

|I have an old machine of red hat linux 6.0. It was working fine till this
|morning but now i got ppp error.
|
|The error message is 
|
|ioctl(TIOCSETD(PPP)): Invalid argument(22)
|
| This system lacks kernel support for PPP.  This could be because the PPP 
|kernel module could not be loaded, or because PPP was not included in the 
|kernel configuration.  If PPP was included as a module, try 
|`/sbin/modprobe -v ppp'.  If that fails, check t
|
|I tried the options /sbin/modprobe -v ppp but it doesnt work.

Doesn't work?  Just what does that mean - exactly?

Try " ls /lib/modules/`uname -r`/net " to see if there is a ppp.o module.

The system and pppd are very old.  The suggestion above comes from
reading the entire failure message (which is chopped off in the message
above because of a bug) in a stock pppd 2.3.11 source, not a RH source.

If ppp.o is missing then perhaps the hard drive is failing.

---
Clifford Kite                                 http://ckite.no-ip.net


