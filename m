From: Clifford Kite <kite_linux-ppp@ev1.net>
Date: Tue, 28 Sep 2004 19:57:05 +0000
Subject: Re: Problem with interface ppp0
Message-Id: <Pine.LNX.4.21.0409281318140.10144-100000@corncob.localhost.tld>
List-Id: <linux-ppp.vger.kernel.org>
References: <BAY12-F36sjCGvseE4D000072ea@hotmail.com>
In-Reply-To: <BAY12-F36sjCGvseE4D000072ea@hotmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Tue, 28 Sep 2004, Tomas Vadfors wrote:

|The modem dials, and seems to connect, but I can't go to any webpages. I 
|don't think it's a DNS-related problem, I think it has something to do with 
|the "interface" ppp0. Please observe that the connection is not abrupted 
|immediately, I've specified "noauth" somewhere rootish. This is the output 
|from kppp in the xterm from which it was run:
|
|Opener: received SetSecret
|Opener: received SetSecret
|Opener: received OpenLock
|
|Opener: received OpenDevice
|Opener: received ExecPPPDaemon
|Kernel supports ppp alright.
|pppd: using the noauth option requires root privilege

This error message comes from pppd/options.c in the pppd source.
So I think you might be mistaken in implying that noauth is in a
(user readable) privileged options file, i.e., /etc/ppp/options or an
options file read using the call option.  Or perhaps the device file
for the serial device is not specified in a privileged options file?

---
Clifford Kite                                 http://ckite.no-ip.net



