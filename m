From: Paulius Zaleckas <paulius.zaleckas@teltonika.lt>
Date: Mon, 21 Jul 2008 09:34:48 +0000
Subject: Re: PPP difficulties regarding connection establishment and bogus
Message-Id: <48845838.6060207@teltonika.lt>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------020909020409030207020206"
List-Id: <linux-ppp.vger.kernel.org>
References: <66abdca00806060145ua700d3cydeb3e37df39b94f8@mail.gmail.com>
In-Reply-To: <66abdca00806060145ua700d3cydeb3e37df39b94f8@mail.gmail.com>
To: linux-ppp@vger.kernel.org

This is a multi-part message in MIME format.
--------------020909020409030207020206
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Paul Mackerras wrote:
> Paulius Zaleckas writes:
> 
>> Attached is patch I made for my GPRS modem with the same problem.
> 
>>      NAKCIDNS(CI_MS_DNS1, req_dns1,
>> -	     if (treat_as_reject) {
>> -		 try.req_dns1 = 0;
>> -	     } else {
>>  		 try.dnsaddr[0] = cidnsaddr;
>> -	     }
>>  	     );
>>  
>>      NAKCIDNS(CI_MS_DNS2, req_dns2,
>> -	     if (treat_as_reject) {
>> -		 try.req_dns2 = 0;
>> -	     } else {
>>  		 try.dnsaddr[1] = cidnsaddr;
>> -	     }
>>  	     );
> 
> I don't understand why this would help.  Can you show me the log for a
> successfull connection with this patch applied (using the debug
> option)?

Sure. See attachment.

--------------020909020409030207020206
Content-Type: text/x-log;
 name="ppp3.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ppp3.log"

Serial connection established.
using channel 7
Using interface ppp0
Connect: ppp0 <--> /dev/ttyUSB2
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb344cc10> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x12 <asyncmap 0x0> <auth chap MD5> <magic 0x125a1f09> <pcomp> <accomp>]
No auth is possible
lcp_reqci: returning CONFREJ.
sent [LCP ConfRej id=0x12 <auth chap MD5>]
rcvd [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xb344cc10> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x13 <asyncmap 0x0> <magic 0x125a1f09> <pcomp> <accomp>]
lcp_reqci: returning CONFACK.
sent [LCP ConfAck id=0x13 <asyncmap 0x0> <magic 0x125a1f09> <pcomp> <accomp>]
sent [LCP EchoReq id=0x0 magic=0xb344cc10]
sent [IPCP ConfReq id=0x1 <compress VJ 0f 01> <addr 0.0.0.0> <ms-dns1 0.0.0.0> <ms-dns3 0.0.0.0>]
rcvd [LCP DiscReq id=0x14 magic=0x125a1f09]
rcvd [LCP EchoRep id=0x0 magic=0x125a1f09 b3 44 cc 10]
rcvd [IPCP ConfNak id=0x1 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
sent [IPCP ConfReq id=0x2 <compress VJ 0f 01> <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
rcvd [IPCP ConfNak id=0x2 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
sent [IPCP ConfReq id=0x3 <compress VJ 0f 01> <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
rcvd [IPCP ConfNak id=0x3 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
sent [IPCP ConfReq id=0x4 <compress VJ 0f 01> <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
rcvd [IPCP ConfNak id=0x4 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
sent [IPCP ConfReq id=0x5 <compress VJ 0f 01> <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
rcvd [IPCP ConfNak id=0x5 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
sent [IPCP ConfReq id=0x6 <compress VJ 0f 01> <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
rcvd [IPCP ConfNak id=0x6 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
sent [IPCP ConfReq id=0x7 <compress VJ 0f 01> <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
rcvd [IPCP ConfNak id=0x7 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
sent [IPCP ConfReq id=0x8 <compress VJ 0f 01> <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
rcvd [IPCP ConfNak id=0x8 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
sent [IPCP ConfReq id=0x9 <compress VJ 0f 01> <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
rcvd [IPCP ConfNak id=0x9 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
sent [IPCP ConfReq id=0xa <compress VJ 0f 01> <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
sent [LCP EchoReq id=0x1 magic=0xb344cc10]
rcvd [LCP EchoRep id=0x1 magic=0x125a1f09 b3 44 cc 10]
rcvd [IPCP ConfNak id=0xa <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
sent [IPCP ConfReq id=0xb <compress VJ 0f 01> <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
rcvd [IPCP ConfNak id=0xb <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
sent [IPCP ConfReq id=0xc <compress VJ 0f 01> <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
rcvd [IPCP ConfNak id=0xc <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
sent [IPCP ConfReq id=0xd <compress VJ 0f 01> <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
rcvd [IPCP ConfNak id=0xd <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
sent [IPCP ConfReq id=0xe <compress VJ 0f 01> <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
rcvd [IPCP ConfNak id=0xe <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
sent [IPCP ConfReq id=0xf <compress VJ 0f 01> <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
rcvd [IPCP ConfNak id=0xf <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
sent [IPCP ConfReq id=0x10 <compress VJ 0f 01> <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
rcvd [IPCP ConfNak id=0x10 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
sent [IPCP ConfReq id=0x11 <compress VJ 0f 01> <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
rcvd [IPCP ConfNak id=0x11 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
sent [IPCP ConfReq id=0x12 <compress VJ 0f 01> <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
rcvd [IPCP ConfNak id=0x12 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
sent [IPCP ConfReq id=0x13 <compress VJ 0f 01> <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
rcvd [IPCP ConfNak id=0x13 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
sent [IPCP ConfReq id=0x14 <compress VJ 0f 01> <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
sent [LCP EchoReq id=0x2 magic=0xb344cc10]
rcvd [LCP EchoRep id=0x2 magic=0x125a1f09 b3 44 cc 10]
rcvd [IPCP ConfNak id=0x14 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
sent [IPCP ConfReq id=0x15 <compress VJ 0f 01> <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
rcvd [IPCP ConfNak id=0x15 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
sent [IPCP ConfReq id=0x16 <compress VJ 0f 01> <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
rcvd [IPCP ConfNak id=0x16 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
sent [IPCP ConfReq id=0x17 <compress VJ 0f 01> <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
rcvd [IPCP ConfNak id=0x17 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
sent [IPCP ConfReq id=0x18 <compress VJ 0f 01> <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
rcvd [IPCP ConfNak id=0x18 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
sent [IPCP ConfReq id=0x19 <compress VJ 0f 01> <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
rcvd [IPCP ConfNak id=0x19 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
sent [IPCP ConfReq id=0x1a <compress VJ 0f 01> <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
rcvd [IPCP ConfNak id=0x1a <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
sent [IPCP ConfReq id=0x1b <compress VJ 0f 01> <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
rcvd [IPCP ConfNak id=0x1b <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
sent [IPCP ConfReq id=0x1c <compress VJ 0f 01> <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
rcvd [IPCP ConfNak id=0x1c <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
sent [IPCP ConfReq id=0x1d <compress VJ 0f 01> <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
rcvd [IPCP ConfNak id=0x1d <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
sent [IPCP ConfReq id=0x1e <compress VJ 0f 01> <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
sent [LCP EchoReq id=0x3 magic=0xb344cc10]
rcvd [LCP EchoRep id=0x3 magic=0x125a1f09 b3 44 cc 10]
rcvd [IPCP ConfNak id=0x1e <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
sent [IPCP ConfReq id=0x1f <compress VJ 0f 01> <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
rcvd [IPCP ConfReq id=0xa]
sent [IPCP ConfNak id=0xa <addr 0.0.0.0>]
rcvd [IPCP ConfRej id=0x1f <compress VJ 0f 01>]
sent [IPCP ConfReq id=0x20 <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
rcvd [IPCP ConfReq id=0xb]
sent [IPCP ConfAck id=0xb]
rcvd [IPCP ConfNak id=0x20 <addr 10.1.80.205> <ms-dns1 213.226.131.131> <ms-dns3 193.219.88.36>]
sent [IPCP ConfReq id=0x21 <addr 10.1.80.205> <ms-dns1 213.226.131.131> <ms-dns3 193.219.88.36>]
rcvd [IPCP ConfAck id=0x21 <addr 10.1.80.205> <ms-dns1 213.226.131.131> <ms-dns3 193.219.88.36>]
Could not determine remote IP address: defaulting to 10.64.64.64
local  IP address 10.1.80.205
remote IP address 10.64.64.64
primary   DNS address 213.226.131.131
secondary DNS address 193.219.88.36
Script /etc/ppp/ip-up started (pid 9400)
Script /etc/ppp/ip-up finished (pid 9400), status = 0x0
sent [LCP EchoReq id=0x4 magic=0xb344cc10]
rcvd [LCP EchoRep id=0x4 magic=0x125a1f09 b3 44 cc 10]
sent [LCP EchoReq id=0x5 magic=0xb344cc10]
rcvd [LCP EchoRep id=0x5 magic=0x125a1f09 b3 44 cc 10]
Terminating on signal 15
Connect time 0.5 minutes.
Sent 0 bytes, received 0 bytes.
Script /etc/ppp/ip-down started (pid 9411)
sent [LCP TermReq id=0x2 "User request"]
rcvd [LCP TermAck id=0x2]
Connection terminated.
Script /etc/ppp/ip-down finished (pid 9411), status = 0x0

--------------020909020409030207020206--

