From: Clifford Kite <kite_linux-ppp@ev1.net>
Date: Tue, 08 Mar 2005 16:22:27 +0000
Subject: Re: IPCP ConfRej's forever
Message-Id: <Pine.LNX.4.21.0503080958530.10217-100000@corncob.inetport.tld>
List-Id: <linux-ppp.vger.kernel.org>
References: <1110253772.18073.91.camel@linux.linxdev.com>
In-Reply-To: <1110253772.18073.91.camel@linux.linxdev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Mon, 7 Mar 2005, Bill Unruh wrote:

|On Mon, 7 Mar 2005, Christopher Fowler wrote:
|
|> I have two hosts that are configured to dial each other on demand.
|>
|> One host is setup as 10.0.6.1:10.0.6.2 and the other as
|> 192.168.5.6:192.168.5.7.  When the 10.0.6.1 sends the IPCP ConfReq
|
|Why would you have both set both local and remote IP AND have them be
|incompatible? This makes no sense. Why not put both on the same address
|range?
|
|Either have just one or have each set their own local but not remote IP.

He might want the dialed-to peer to be able to access a LAN through the
dial-out peer?

---
Clifford Kite                                 http://ckite.no-ip.net

