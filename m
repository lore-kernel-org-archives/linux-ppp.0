From: "Rajkumar S" <rajkumars@gmail.com>
Date: Fri, 26 Oct 2007 04:45:38 +0000
Subject: Re: ppp reconnects after receiving ConfReq id=0x3 <mru 1400>
Message-Id: <64de5c8b0710252133u58860dfch6b26905fdba1ba2a@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <64de5c8b0710241117t66196e80u8cc5109f5466133@mail.gmail.com>
In-Reply-To: <64de5c8b0710241117t66196e80u8cc5109f5466133@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 10/25/07, James Cameron <james.cameron@hp.com> wrote:
> I found that I could reliably crash the remote PPP by emitting a packet
> that originated from one of the other IP addresses my system had before
> the connection was established or the route was switched.  Within a
> second or two of the packet being sent, the LCP ConfReq arrived to
> restart PPP.

Thanks James, this is exactly my problem. I have verified this and as
soon as a packet from another ip goes via ppp connection a ConfReq
packet arrives and connection is reset.

raj
