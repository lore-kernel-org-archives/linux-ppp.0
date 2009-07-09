From: Libor Pechacek <lpechacek@suse.cz>
Date: Thu, 09 Jul 2009 12:38:36 +0000
Subject: Re: [PATCH] Accept ms-wins settings provided by server
Message-Id: <loom.20090709T065514-445@post.gmane.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <1241641599-32361-1-git-send-email-marcus@better.se>
In-Reply-To: <1241641599-32361-1-git-send-email-marcus@better.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi Marcus,

Marcus Better <marcus <at> better.se> writes:
> Paul Mackerras wrote:
> > Also, have you tried the latest git version of pppd?  Since 2.4.4 I
> > have added code to add the MS-DNS option to our IPCP conf-reqs if the
> > modem insists.
> 
> I cannot reproduce the problem anymore. I have changed UMTS provider in
> between (from Tele2 to 3 in Sweden), and modem (from Huawei E620 to E220).
> This may explain the differences.
> 
> However I still have a very similar connection problem, but the patch makes
> no difference. I tried both pppd 2.4.4 and current git, patched and
> unpatched. In all cases it tends to fail at the first connection attempt
> after plugging in the modem. What helps however is setting ipcp-max-failure
> high enough, like 30.

The DNS problem you observe is unrelated to the WINS one.  Increasing
ipcp-max-failure is IMO the right solution here.  The DNS negotiation trouble
is caused by the 'treat as reject' behavior introduced in GIT commit ec27e674.

> I'm quite sure that the patch was needed with the old provider and hardware,
> and a few other people have confirmed this. I'll see if I can try another
> modem.
> 
> Hopefully someone else can reproduce it?

I have information that people in Germany (hs2300 HSDPA modem, providers
T-Mobile and Vodafone) and Finland (no details provided) observed this failure
too.

> Here is the log with the current git (unpatched), failure case:
[...]
> May 19 20:32:00 better pppd[10996]: sent [IPCP ConfReq id=0x1 <addr 0.0.0.0>
<ms-dns1 0.0.0.0> <ms-dns2 0.0.0.0>]
> May 19 20:32:01 better pppd[10996]: rcvd [IPCP ConfNak id=0x1 <ms-dns1
10.11.12.13> <ms-dns2 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]

This is the first configuration request - IP address and DNS servers are
requested, the remote end responds with NAK and provides some DNS and WINS
server addresses.  So far so good.

[...]
> May 19 20:32:08 better pppd[10996]: sent [IPCP ConfReq id=0x9 <addr 0.0.0.0>
<ms-dns1 10.11.12.13> <ms-dns2 10.11.12.14>]
> May 19 20:32:09 better pppd[10996]: rcvd [IPCP ConfNak id=0x9 <ms-dns1
10.11.12.13> <ms-dns2 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]

The previous request was the last one where the local end requested the DNS
server addresses.  The next request does not contain the DNS options due to the
condition at line 556 in pppd/fsm.c (treat_as_reject = (f->rnakloops >f->maxnakloops)).

> May 19 20:32:09 better pppd[10996]: sent [IPCP ConfReq id=0xa <addr 0.0.0.0>]
> May 19 20:32:10 better pppd[10996]: rcvd [IPCP ConfNak id=0xa <ms-dns1
10.11.12.13> <ms-dns2 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]

And despite the remote end offered valid DNS server addresses, they were
disregarded, and configuration request with id 0xe has surprisingly no options:

> May 19 20:32:12 better pppd[10996]: sent [IPCP ConfReq id=0xd <addr 0.0.0.0>
<ms-dns1 10.11.12.13> <ms-dns2 10.11.12.14>]
> May 19 20:32:12 better pppd[10996]: rcvd [IPCP ConfReq id=0x0]
> May 19 20:32:12 better pppd[10996]: sent [IPCP ConfNak id=0x0 <addr 0.0.0.0>]
> May 19 20:32:12 better pppd[10996]: rcvd [IPCP ConfNak id=0xd <addr
95.209.165.82> <ms-dns1 80.251.192.244> <ms-dns2 80.251.192.245>]
> May 19 20:32:12 better pppd[10996]: sent [IPCP ConfReq id=0xe]
> May 19 20:32:12 better pppd[10996]: rcvd [IPCP ConfReq id=0x1]
> May 19 20:32:12 better pppd[10996]: sent [IPCP ConfAck id=0x1]
> May 19 20:32:12 better pppd[10996]: rcvd [IPCP ConfNak id=0xe <addr
95.209.165.82>]
> May 19 20:32:12 better pppd[10996]: sent [IPCP ConfReq id=0xf <addr
95.209.165.82>]
> May 19 20:32:12 better pppd[10996]: rcvd [IPCP ConfAck id=0xf <addr
95.209.165.82>]
> May 19 20:32:12 better pppd[10996]: Could not determine remote IP address:
defaulting to 10.64.64.64
> May 19 20:32:12 better pppd[10996]: not replacing existing default route via
192.168.1.1
> May 19 20:32:12 better pppd[10996]: Cannot determine ethernet address for
proxy ARP
> May 19 20:32:12 better pppd[10996]: local  IP address 95.209.165.82
> May 19 20:32:12 better pppd[10996]: remote IP address 10.64.64.64

The remote end did not provide its IP address, the local end got 95.209.165.82,
but no DNS servers as DNS option negotiation was abandoned (ipcp-max-failure AKA
maxnakloops was exceeded).  The obvious solution is to fiddle about with 
the configuration parameters.

Yet it's hard to believe for me that the *modem* replies PPP packets, and
establishes PPP connection *before* the physical link is up.  Does it really
work this way?

--
Libor Pechacek
SUSE L3 Team


