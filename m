From: "Milan P. Stanic" <mps@rns-nis.co.yu>
Date: Tue, 15 Feb 2005 08:36:24 +0000
Subject: Re: 2 questions about dialup pppd use
Message-Id: <20050215083624.GA3248@rns-nis.co.yu>
List-Id: <linux-ppp.vger.kernel.org>
References: <20050212173525.GA27282@iceland.spb.ru>
In-Reply-To: <20050212173525.GA27282@iceland.spb.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Mon, Feb 14, 2005 at 03:32:36PM -0800, Bill Unruh wrote:
> On Sat, 12 Feb 2005, Serge Koksharov wrote:
> 
> > Dear all,
> >
> >I'm using pppd v2.4.2 on my Gentoo Linux box with modem connection to my
> >provider. I have following questions:
> >
> >Question1:
> >In /etc/ppp/ip-up.local I have following command to log my dialup sessions:
> >echo `date` ppp-on: Speed: $3\; Local IP: $4\; Remote IP: $5 >> 
> >/etc/ppp/history
> >The problem with this setup: No matter on which speed I'm connected (33600,
> >42666, etc) I'm always getting logged speed 115200. That's not I want! I 
> >think
> >script logs serial port speed, but I want connection speed logged instead.
> 
> That is because the speed in question, which is the only speed that pppd
> knows about, is the speed of the connection from the computer to the modem.
> The speed you are interested in is the speed with which your modem talks to
> the other modem, but that ppp does not and cannot have any information
> about. It is often reported in the CONNECT string from the modem once it
> makes its connection to the remote machine, which may be logged in the
> local2.* syslogd information if you run chat with the -v option. But chat
> is not pppd. It is a different program which is simply reporting what it
> gets from the modem. It has no idea what the content of that report is
> (unless you rewrite chat to parse the return message)
 
man chat

       -r <report file>
              Set  the  file for output of the report strings. If
              you use the keyword REPORT, the  resulting  strings
              are  written  to  this  file. If this option is not
              used and you still use REPORT keywords, the  stderr
              file is used for the report strings.


Example:

chat -r /var/log/connect.report REPORT CONNECT \
        TIMEOUT 85 \
        ABORT "NO CARRIER" \
        ABORT BUSY \
        ABORT "NO DIALTONE" \
        ABORT ERROR \
        "" ATDT$PHONE_NUMBER \
        CONNECT ""

