From: Sekar D <sekar.linux@gmail.com>
Date: Tue, 18 Jul 2017 11:54:46 +0000
Subject: Re: Session 152 terminated -- received PADT from peer
Message-Id: <CAGc3wVD85YJhKgMq-4R3T=oQLy8WM9ti-tbP6z+ApyZBw8mTdQ@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAGc3wVBAcgaGFtzDVTksaLgs0CX=mirK7osVJRNM2_JjtNYM6w@mail.gmail.com>
In-Reply-To: <CAGc3wVBAcgaGFtzDVTksaLgs0CX=mirK7osVJRNM2_JjtNYM6w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Please let me know if someone can help here.

On Mon, Jul 17, 2017 at 12:07 PM, Sekar D <sekar.linux@gmail.com> wrote:
> Hello All,
>
> I am getting the following error messages through PPP connection
> without any manual intervention.
>
> Session 152 terminated -- received PADT from peer
> PADT: Generic-Error: RP-PPPoE: Child pppd process terminated
> Sent PADT
> Modem hangup
> Exit
> Connection terminated.
> ADSL connection lost; attempting re-connection
>
>
> Please let me know if any configuration needs to be added.
>
> /etc/ppp/pppoe-server-options
> # PPP options for the PPPoE server
> # LIC: GPL
> require-chap
> login
> lcp-echo-interval 10
> lcp-echo-failure 2
