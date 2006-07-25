From: Jan Just Keijser <jan.just.keijser@gmail.com>
Date: Tue, 25 Jul 2006 11:46:41 +0000
Subject: Re: ppp 2.4.4 eap-tls patch
Message-Id: <44C604A1.8080304@gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <44C5F014.40202@gmail.com>
In-Reply-To: <44C5F014.40202@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

The patch is based on OpenSSL basically because I have used openssl in 
the past and have come to know it a bit; I don't see any reason why 
MatrixSSL (which I do not know) or libgnutls (which I know a little but 
have had problems with in the past) could not be used. The EAP-TLS patch 
uses an SSL TLSv1 context and not much more than that, so I can't think 
of a reason why any other package which provides the same functionality 
could not be used.

I will give libgnutls a shot over the next few days/weeks, and perhaps 
MatrixSSL as well.

share and enjoy,

JJK


Marco d'Itri wrote:

>On Jul 25, James Cameron <james.cameron@hp.com> wrote:
>
>  
>
>>You've used OpenSSL, which has a license that is not altogether open,
>>specifically clause 6 which requires acknowledgement.  Is there any
>>reason why you couldn't use MatrixSSL?
>>    
>>
>I would hate to see EAP-TLS depend on a niche license.
>I do not think I would enable EAP-TLS in the Debian package in this case
>since it would require pulling the MatrixSSL package in the base system.
>
>If you do not like the advertisement clause in the OpenSSL license there
>is libgnutls which is LGPL'ed and widely used (and has a sane API...).
>
>  
>

