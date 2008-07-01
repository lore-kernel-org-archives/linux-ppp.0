From: Paulius Zaleckas <paulius.zaleckas@teltonika.lt>
Date: Tue, 01 Jul 2008 11:50:42 +0000
Subject: Re: PPP difficulties regarding connection establishment and bogus
Message-Id: <486A1A12.5020907@teltonika.lt>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------050506010605010108090109"
List-Id: <linux-ppp.vger.kernel.org>
References: <66abdca00806060145ua700d3cydeb3e37df39b94f8@mail.gmail.com>
In-Reply-To: <66abdca00806060145ua700d3cydeb3e37df39b94f8@mail.gmail.com>
To: linux-ppp@vger.kernel.org

This is a multi-part message in MIME format.
--------------050506010605010108090109
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Pierre-Yves Paulus wrote:
> Hello,
> 
> I've a Debian etch system connected to the web through a GPRS/UMTS
> PCMCIA card. I'm using pppd to connect it to the ISP. However, I see
> quite a lot of connection failures (connection establishment has to be
> tried quite a few times before it succeeds), and even worse, the
> connection often succeeds, but with bogus DNS servers IP's supplied
> (10.11.12.13 and 10.11.12.14), rendering it useless.
> 
> I've looked through the archives
> (http://www.opensubscriber.com/message/linux-ppp@vger.kernel.org/7889888.html),
> and found that the bogus DNS problem has already been seen when the
> peer insists on wins servers, but this is not the case here.
> 
> So I suppose that there are some differences between the various peers
> available by the ISP, and that only some of them accept the way "my"
> pppd deals with them, but I've no idea about how and what to change to
> increase the success rate and most importantly avoid this bogus DNS
> problem.

Attached is patch I made for my GPRS modem with the same problem.

--------------050506010605010108090109
Content-Type: text/x-patch;
 name="ppp_dns_fix.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ppp_dns_fix.patch"

diff -uprN ppp-2.4.4.orig/pppd/ipcp.c ppp-2.4.4/pppd/ipcp.c
--- ppp-2.4.4.orig/pppd/ipcp.c	2005-08-26 02:59:34.000000000 +0300
+++ ppp-2.4.4/pppd/ipcp.c	2008-03-15 19:00:53.000000000 +0200
@@ -1097,19 +1097,11 @@ ipcp_nakci(f, p, len, treat_as_reject)
 	      );
 
     NAKCIDNS(CI_MS_DNS1, req_dns1,
-	     if (treat_as_reject) {
-		 try.req_dns1 = 0;
-	     } else {
 		 try.dnsaddr[0] = cidnsaddr;
-	     }
 	     );
 
     NAKCIDNS(CI_MS_DNS2, req_dns2,
-	     if (treat_as_reject) {
-		 try.req_dns2 = 0;
-	     } else {
 		 try.dnsaddr[1] = cidnsaddr;
-	     }
 	     );
 
     /*

--------------050506010605010108090109--

