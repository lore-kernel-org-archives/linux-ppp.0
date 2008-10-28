From: James Carlson <carlsonj@workingcode.com>
Date: Tue, 28 Oct 2008 14:02:42 +0000
Subject: Re: Banyan Vines
Message-Id: <18695.7042.846310.285964@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <W9913123352266171225199214@webmail4>
In-Reply-To: <W9913123352266171225199214@webmail4>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

tony.chamberlain@lemko.com writes:
> Does anyone know what it means if you are running pptp and in
> /var/log/messages you get a message "unsupported protocol Banyan Vines"
> (along with a lot of unsupported protocol messages which are just
> hex values), or what to do about it?

It means you're getting garbled packets from the peer.

If it's persistent and doesn't correct itself over time, the most
plausible reason (I think) would be that you're using MPPE (MS
proprietary packet encryption) and there's a bug in that code.

If it just happens intermittently and then fixes itself, I'd ignore
it.  The cause would be dropped or corrupted packets and recovery by
the encryption code.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
