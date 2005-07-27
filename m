From: Boky Gmail <verynotbad@gmail.com>
Date: Wed, 27 Jul 2005 21:26:06 +0000
Subject: Authentificating with certificates ("unknown authentication type 13; Naking")
Message-Id: <e8666cf9050727142635284b29@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi all.

I was wondering if it is possible to use certificates instead of
passwords for authentification over PPTP?

Google turned up nothing usefull.

When logging the connection this is what PPP says("pppd call work
logfd 1 nodetach debug dump"):

---snip---
rcvd [LCP EchoRep id=0x0 magic=0x110e4d94]
rcvd [EAP Request id=0x12 TLS 20]
EAP: unknown authentication type 13; Naking
sent [EAP Response id=0x12 Nak <Suggested-type 13>]
rcvd [LCP TermReq id=0x4 11 0e 4d 94 00 3c cd 74 00 00 02 b3]
LCP terminated by peer (^Q^NMM-^T^@<M-Mt^@^@^BM-3)
sent [LCP TermAck id=0x4]
Terminating on signal 2.
---snip---

Now, I know for a fact that our administrator has certificate-only VPN
login policy in place.

I am suspecting that "EAP: unknown authentication type 13; Naking"
means that the server requested certificate-based authentification but
the client does not have any implementation to handle this and
therefor the conection terminated.

Is my hunch correct?

If it is, will certificate authentification be ever possible? If so,
is there an ETA? A feature-request, perhaps?

If no, can someone please explain to me how to enable authentification
by certificate?


PS: This question was first posted to the pptpclient-dev mailing list
and I was told it is a PPP issue.

Sniplets (reply by James Cameron):
--snip--
It has nothing to do with PPTP, because at the stage that
this happens only pppd has anything to do with the task.  Ask the PPP
mailing list.
--snip--

He also suggested looking here:
http://marc.theaimsgroup.com/?l=linux-ppp&m2177308427341&w=2

But that did not help, either.



Thank you all,
Bojan
