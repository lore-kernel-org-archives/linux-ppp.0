From: James Cameron <james.cameron@hp.com>
Date: Wed, 20 May 2009 22:42:50 +0000
Subject: Re: [PATCH] Accept ms-wins settings provided by server
Message-Id: <20090520224250.GA3956@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <1241641599-32361-1-git-send-email-marcus@better.se>
In-Reply-To: <1241641599-32361-1-git-send-email-marcus@better.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Wed, May 20, 2009 at 10:50:01AM +0200, Marcus Better wrote:
> James Cameron wrote:
> > Are you verifying in your chatscript that the modem is attached to the
> > network before attempting to dial?
> > 
> > #
> > # cease if modem is not attached to network yet
> > ABORT '+CGATT: 0'
> > '' AT+CGATT?
> 
> No. That would just fail if it is not attached, right? So it's not much 
> better than the current situation.

Yes, but it helps you isolate the cause of the negotiation failure ...
if the modem is not attached to the radio network, then it won't be
successful in negotiating an IP address.  The attachment occurs before
negotiation with the provisioning servers.  The provisioning servers
cannot be reached until the radio network attachment completes.

Per Marco d'Itri this method may not be portable across all modems.

The modems I have used default to attempting to attach on power up, but
they have a configuration variable which can let them delay the attach
until a connection is requested.

To encourage a modem to try to attach, you can send "AT+CGATT=1".

> > All three logs you provided in this post showed successful connection.
> > What makes you think it failed?
> 
> You will notice that only the second one has these lines:
> 
> May 19 20:36:04 better pppd[11280]: primary   DNS address 80.251.192.244
> May 19 20:36:04 better pppd[11280]: secondary DNS address 80.251.192.245

ns.hi3gaccess.se.
ns2.hi3gaccess.se.

Looks quite reasonable.  What makes you think it failed?  Oh, right,
you're saying that these lines are *missing* from the first and third
logs.

Let's see, in your "log with the current git (unpatched), failure case",
the modem proposes addr, ms-dns1 and ms-dns2:

May 19 20:32:12 better pppd[10996]: rcvd [IPCP ConfNak id=0xd <addr 95.209.165.82> <ms-dns1 80.251.192.244> <ms-dns2 80.251.192.245>]

But what happens next appears to be an IPCP restart:

May 19 20:32:12 better pppd[10996]: sent [IPCP ConfReq id=0xe]
May 19 20:32:12 better pppd[10996]: rcvd [IPCP ConfReq id=0x1]
May 19 20:32:12 better pppd[10996]: sent [IPCP ConfAck id=0x1]
May 19 20:32:12 better pppd[10996]: rcvd [IPCP ConfNak id=0xe <addr 95.209.165.82>]
May 19 20:32:12 better pppd[10996]: sent [IPCP ConfReq id=0xf <addr 95.209.165.82>]
May 19 20:32:12 better pppd[10996]: rcvd [IPCP ConfAck id=0xf <addr 95.209.165.82>]

Which has only resulted in the local IP address being determined.

What is ipcp-max-configure set to?

What is ipcp-restart set to?

These two options will determine the persistence of pppd during this
negotiation.

--

In your log "successful connection (current git, unpatched)", the peer
and pppd negotiate addr, ms-dns1, and ms-dns2.

--

In your log "After replugging the modem, current git with the patch
applied", the same situation as the first log occurs, with IPCP
restarting and only the IP address negotiated.

--

I think the behaviour you observe has more to do with timing and IPCP
restart than anything else.

-- 
James Cameron
http://ftp.hp.com.au/sigs/jc/
