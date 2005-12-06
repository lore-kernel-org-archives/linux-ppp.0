From: Clifford Kite <kite_linux-ppp@ev1.net>
Date: Tue, 06 Dec 2005 21:11:07 +0000
Subject: Re: Basic Question.
Message-Id: <Pine.LNX.4.21.0512061508390.15532-100000@corncob.inetport.tld>
List-Id: <linux-ppp.vger.kernel.org>
References: <a2617ef40512061213v7823a29fr@mail.gmail.com>
In-Reply-To: <a2617ef40512061213v7823a29fr@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Tue, 6 Dec 2005, Cleiton Reis wrote:

|Hello !
|
| A basic question :
|
| There's a way to start a PPP connection like an ADSL connection
|always in the same
| interface (eg. ppp0 ) ?
|
| I have two adsl Links and I would like to start adsl1 always in ppp0 
|and the adsl2 always in the ppp1, otherwise  when I reboot and the
|adsl1 fail to connect,  the adsl2 start in ppp0 and my
|firewall rules screw up !

Man pppd, see whether the option "unit <num>" is what you want.

---
Clifford Kite

