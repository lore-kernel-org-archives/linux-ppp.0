From: Paul Mackerras <paulus@samba.org>
Date: Thu, 07 May 2009 09:49:17 +0000
Subject: Re: [PATCH] Accept ms-wins settings provided by server
Message-Id: <18946.44701.720237.991000@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <1241641599-32361-1-git-send-email-marcus@better.se>
In-Reply-To: <1241641599-32361-1-git-send-email-marcus@better.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Marcus Better writes:

> The PPP servers of some UMTS/HSPA modems, including the Huawei E220
> and E620, will send WINS server settings and insist that the client
> accepts these. If the client does not do so, the modem will sometimes
> provide bogus DNS server addresses like 10.11.12.13 and 10.11.12.14.

Are you sure that not accepting WINS settings is the only reason for
getting those DNS server addresses?  As I understood it, the reason we
got those bogus addresses was that the phone/modem hadn't actually got
in touch with the gateway yet.  The symptom I've seen is that we get
those bogus addresses in IPCP configure-naks over and over again, even
if we request exactly the IP address that the modem asked us to
request, until the modem manages to get a connection, and then it naks
us with the correct values (for IP-addr as well as DNS addrs).

Also, have you tried the latest git version of pppd?  Since 2.4.4 I
have added code to add the MS-DNS option to our IPCP conf-reqs if the
modem insists.  At least at one stage that seemed to be the critical
thing, not the MS-WINS options.  So if you can replicate the problem
with the current git version of pppd, and this patch makes it go away,
let me know (or better still put it in the patch description) and I'll
put the patch in.

Paul.
