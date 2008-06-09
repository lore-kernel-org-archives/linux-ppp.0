From: Charlie Brady <charlieb@budge.apana.org.au>
Date: Mon, 09 Jun 2008 18:52:09 +0000
Subject: Re: possible bug on ppp_async
Message-Id: <Pine.LNX.4.64.0806091450450.24024@e-smith.charlieb.ott.istop.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <6b53b1990806091123l74a06bebu34160ad08366d1a8@mail.gmail.com>
In-Reply-To: <6b53b1990806091123l74a06bebu34160ad08366d1a8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


On Mon, 9 Jun 2008, Gustavo Fernando Padovan wrote:

> I found out a problem on drivers/net/ppp_async.c: I'm testing a modem
> (Motorola SM56 Data Fax Modem [1057:3052] that uses the slmodem
> driver) and I noted that it stopped to work correctly with kernel
> 2.6.24 or greater. The modem connects once and at the second try it
> becomes busy and I have to restart its driver to put it to work again.

Why do you not suspect the slmodem driver?
