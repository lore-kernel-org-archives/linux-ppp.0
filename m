From: Thomas Glanzmann <thomas@glanzmann.de>
Date: Wed, 02 Aug 2017 08:20:14 +0000
Subject: Re: pppoe encapsulated udp packets which appear on ethernet disappear between pppoe and ppp0 after p
Message-Id: <20170802082014.GA16784@glanzmann.de>
List-Id: <linux-ppp.vger.kernel.org>
References: <20170410183851.GA4442@glanzmann.de>
In-Reply-To: <20170410183851.GA4442@glanzmann.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello Michael,

> I'll be curious to know what product is at the other end.

After a few months we found the problem. The culprit for the wrong
session ID is not the Providers DSLAM or PPP, but the Zyxel ZyXEL
VMG1312-B30A or more specific:

> * https://support.aa.net.uk/VMG1312-B10A:_Bugs

> PPPoE Session-ID caching bug (In Bridge mode)
> ======================
> Issue Description
> -----------------

> Last year we had an problem with Huawei FTTC modems, the standard ones that
> Openreach supply The bug appears to be that the modem manages to "blacklist"
> some UDP packets after a PPP restart. Typically this affects VPN tunnels. The
> short term fix is to unplugged and plugged back in!  We now have what looks to
> be the same fault on the ZyXELs - both on ADSL and VDSL.  When a PPPoE session
> finishes and a new one starts, ethernet frames containing IP packets with the
> same source and destination IP and port combination that were used in the
> previous session are received with the PPPoE Session-ID from the earlier
> session.  This affects long running sessions using protocols which use the same
> source port for all communications. This includes IPsec and (in some
> circumstances) SIP.  Our understanding of this, having talked to Huawei last
> year to get a very similar bug fixed is that the problem is with the packet
> accelerator feature in the Broadcom chipset. It is caching frame headers
> including the PPPoE Session-ID, but not checking if the Session-ID is the same
> when searching for the entry in the cache for subsequent packets. Unplugging
> the ethernet cable from the VMG1312 momentarily resolves the problem - that
> action must trigger a cache flush in the Broadcom chipset.  Possible fixes
> would be to either not store the Session-ID in the packet accelerator cache at
> all, or to check the Session-ID in addition to the IP and ports when searching
> the cache. A workaround would be to disable the packet accelerator.  (Side note
> for other ISPs looking at this: This does not affect lines that have dynamic
> WAN addresses, which none of our service do.)

> Date Reported
> -------------
> 2015-05-06

> Updates
> -------
> 2015-05-06 - Escalated with ZyXEL/Broadcom
> 2015-05-15 - ZyXEL staff came to AAISP offices and we demonstrated and discussed the problem
> 2015-06-02 - Still in hand with ZyXEL HQ reproducing this in their lab
> 2016-10-01 - ZyXEL still unable to reproduce this, even though we have had customers recently seeing the issue with their VPN sessions

> Resolution

> None yet.

We identified the ZyXEL VMG1312-B30A as culprit by doing:

Telekom DSLAM <-DSL-> Older Zyxel without Vectoring support <-Ethernet Bridge Sniffer-> Allnet DSLAN <-DSL-> Zyxel VMG1312-B30A <-> Ethernet

We sniffed on the Ethernet Bridge and found out that the PPPOE Session ID from
German Telekom are correct, but the PPPOE Session ID from the Zyxel was corrupt.

Thank you again for helping me identifying the issue.

Cheers,
        Thomas
