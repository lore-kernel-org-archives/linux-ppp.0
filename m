From: md@Linux.IT (Marco d'Itri)
Date: Tue, 25 Jul 2006 15:20:54 +0000
Subject: Re: ppp 2.4.4 eap-tls patch
Message-Id: <20060725152054.GA24655@wonderland.linux.it>
List-Id: <linux-ppp.vger.kernel.org>
References: <44C5F014.40202@gmail.com>
In-Reply-To: <44C5F014.40202@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Jul 25, Jan Just Keijser <jan.just.keijser@gmail.com> wrote:

> - gnutls does not provide the HMAC functions, which are needed for MPPE, 
> hence I will rule that out for now
Crypto primitives are provided by its companion library libgcrypt.

-- 
ciao,
Marco
