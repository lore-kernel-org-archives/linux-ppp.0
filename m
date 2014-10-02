From: Christoph Schulz <develop@kristov.de>
Date: Thu, 02 Oct 2014 08:16:36 +0000
Subject: Re: ml-ppp bundle dies if initial link fails (even in 2.4.7)
Message-Id: <20141002101636.84637gipons55k2s@berry.schulz.ip-v6.eu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=_1x6wqdt62dh"
List-Id: <linux-ppp.vger.kernel.org>
References: <542CFEDB.6090301@evonet.be>
In-Reply-To: <542CFEDB.6090301@evonet.be>
To: linux-ppp@vger.kernel.org

This message is in MIME format and has been PGP signed.

--=_1x6wqdt62dh
Content-Type: text/plain;
 charset=UTF-8;
 DelSp="Yes";
 format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

Hello!

Arne Van Theemsche schrieb am Thu, 02 Oct 2014 09:29:31 +0200:

> Hi all
>
> We can't seem to get ml-ppp to work in a stable way (nor PPPoE, nor  
> PPPoL2TP). Even when I found out the master_detach option, we  
> compiled 2.4.7 but that didn't to the trick.
>
> All links may fail, except for the one who created the bundle, if  
> that happens, the link goes down, if-down scripts are called, and  
> all other links are nicely closed.

This works here without any problems (using SIGHUP). We use the latest  
Linux kernels from the 3.14 and 3.16 branches (3.14.19 and 3.16.3 at  
the moment) and pppd 2.4.6. However, pppd is heavily patched as we  
implemented Dial-on-Demand over ML bundles, which is not possible with  
the stock pppd. I'm afraid I haven't found the time yet to send the  
patches upstream :-/ But you can look into them by yourself:

https://ssl.nettworks.org/svn/fli4l/branches/feature/FFL-506/src/packages/src/src/fbr/buildroot/package/pppd/

>
> Does anybody have a solution for that?
>
> P.S. tried killing pppd with the HUP signal (as mentioned in the  
> man), tried interrupting the link somewhere in the middle, so the  
> LCP fails, nothing has helped me so far

What happens if you send a SIGHUP to the master pppd? Is there nothing  
in the logs?


Regards,

Christoph Schulz


--=_1x6wqdt62dh
Content-Type: application/pgp-signature
Content-Description: Digitale PGP-Signatur
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEABECAAYFAlQtCeQACgkQL11jCnyQ5Oz6hACdE/JTiE32sEVa/+MvorZqg6oN
paQAnjD5SyKaqVKr40z/jZmzeLtTWq1r
=S6Go
-----END PGP SIGNATURE-----

--=_1x6wqdt62dh--
