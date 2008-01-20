From: "Nestor Urquiza" <nestor.urquiza@gmail.com>
Date: Sun, 20 Jan 2008 16:48:39 +0000
Subject: RSA SecureId (RFC 4793) support
Message-Id: <dff43e6d0801200848j5afdc8d7w9df3d1da0f701bf8@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi guys,
I just wanted to understand if you have any plan to give support for
RSA SecureId (EAP-POTP) which corresponds to EAP type 15.

The specifications are publicly available as you see from IETF RFC
4793 ... The EAP Protected One-Time Password Protocol (EAP-POTP).

I posted some months ago a question asking for support at pptp mailing
list since by that time I had no idea about PPP and EAP and I was
guessing RSA SecureId authentication was something related to PPTP.

After some further reading I realized that the specs are publicly
available and someone has patched pppd to support EAP-TLS.  I guess
supporting EAP-POTP shouldn't be that hard since EAP-TLS and EAP-POTP
are just different types from the same rfc 3748.

Thanks in advance,

-Nestor
