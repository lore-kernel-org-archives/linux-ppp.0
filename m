From: Guillaume Nault <gnault@redhat.com>
Date: Mon, 27 Apr 2020 20:30:34 +0000
Subject: Re: PPPoE Modem hangup after random time - how to debug?
Message-Id: <20200427203034.GA4949@pc-3.home>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
In-Reply-To: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-ppp@vger.kernel.org

On Mon, Apr 27, 2020 at 11:59:25AM +0200, David Balažic wrote:
> On Mon, 27 Apr 2020 at 04:14, Michael Richardson <mcr@sandelman.ca> wrote:
> >
> >
> > David Balažic <xerces9@gmail.com> wrote:
> >     > Sun Apr 26 17:34:57 2020 daemon.debug pppd[20289]: sent [IPV6CP
> >     > ConfReq id=0x1 <addr fe80::d035:60ed:928e:f741>]
> >     > Sun Apr 26 17:35:00 2020 daemon.debug pppd[20289]: sent [IPV6CP
> >     > ConfReq id=0x1 <addr fe80::d035:60ed:928e:f741>]
> >     > Sun Apr 26 17:35:03 2020 daemon.debug pppd[20289]: sent [IPV6CP
> >     > ConfReq id=0x1 <addr fe80::d035:60ed:928e:f741>]
> >     > Sun Apr 26 17:35:06 2020 daemon.debug pppd[20289]: sent [IPV6CP
> >     > ConfReq id=0x1 <addr fe80::d035:60ed:928e:f741>]
> >     > Sun Apr 26 17:35:09 2020 daemon.warn pppd[20289]: IPV6CP: timeout
> >     > sending Config-Requests
> >
> > Could this be the reason for the hangup?
> > pppd gets tired of no IPv6, decides it should hangup?
> 
> These lines are logged in the 30 seconds after the connection is
> established. Later they never show up. It was like that for all
> connections thus far.
> 
Your provider doesn't support IPv6. As James pointed out, it isn't even
capable of reporting that fact. So your device keeps trying for a few
seconds. Nothing to worry about (appart that you won't have IPv6
connectivity of course).

> >     > The strange part is in the tcpdump there is a PADT sent to an
> >     > "unknown" MAC and my pppd responds. At least that is how I see it.
> >
> >     > You think NOT putting the interface into promiscuous mode (done by
> >     > tcpdump) would prevent this?
> >     > Anyway, now I startted tcpdump with the -p option:  tcpdump -e -v -p
> >     > -i eth1 vlan 3902 and pppoed
> >
> > It could be that promisc mode (no -p) means that the PADT makes something
> > break, different than what you are investigating.  -p avoid promisc mode, so
> > would avoid seeing that packet.
> >
> > You mention in another thread that you were trying to do DHCPv6 on a
> > different (non-PPPoE) interface.  I don't see how that would matter unless
> > the failure caused netifd to decide to retry it all.
> >
> > It seems that you ought to try the noipv6 option to pppd.
> 
> I removed it (from the system config, the file /etc/config/network ).
> I also removed that "other interface", so there is no IPv6 stuff left.
> The new command line is:
> /usr/sbin/pppd nodetach ipparam wan ifname pppoe-wan lcp-echo-interval
> 1 lcp-echo-failure 5 lcp-echo-adaptive nodefaultroute usepeerdns
> maxfail 1 user YYYYYY password XXXXX ip-up-script /lib/netifd/ppp-up
> ip-down-script /lib/netifd/ppp-down mtu 1492 mru 1492 plugin
> rp-pppoe.so nic-eth1.3902
> 
> For the record: The new connection with new settings was started on
> Mon Apr 27 09:47:48 (UTC)
> 
