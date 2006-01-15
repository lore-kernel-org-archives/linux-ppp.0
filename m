From: James Carlson <carlsonj@workingcode.com>
Date: Sun, 15 Jan 2006 18:35:20 +0000
Subject: Re: pppd over gprs modem
Message-Id: <17354.38376.983043.409418@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <43CA8E4E.2020603@asist-traffic.com>
In-Reply-To: <43CA8E4E.2020603@asist-traffic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Babarovic Ivica writes:
> I'm trying to configure pppd to run over GPRS modem.
> So far withouth any success. Peer just keeps on reseting the link.

You should first be aware that GPRS is very strange.  It is (in my
opinion) badly designed for networking, in particular because it
deliberately redefines the operation of PPP.  The actual
authentication does *NOT* take place during PPP's Authentication
phase.  Instead, it takes place during Network phase, when IPCP runs.

The implication of this is that authentication errors (bad user name,
bad passphrase) on GPRS are typically reported as IPCP addressing
errors.  During authentication phase, the peer sends "ack" even if
your credentials are completely wrong.  This makes no operational
sense, of course, but it's how it was designed.

Problems are just par for the course.

>  pppd /dev/ttyS1 19200 nocrtscts noauth defaultroute novj novjccomp user
> simobil ipcp-accept-local ipcp-accept-remote connect "exec

Instead of those ipcp-accept-* options, you probably want
"noipdefault."

> Nov 25 08:54:40 nova pppd[1175]: rcvd [LCP ConfReq id=0x3 <asyncmap
> 0xa0000> <pcomp> <accomp> <magic 0x4895f5d2> <auth chap MD5>]
> Nov 25 08:54:40 nova pppd[1175]: sent [LCP ConfNak id=0x3 <auth pap>]

One problem is that the peer is asking you to use CHAP, and you're
insisting that you want to use PAP instead.  If you're absolutely sure
that the peer has PAP credentials for you (and not CHAP), then this is
probably right.  Otherwise, it's not.

If it's not, then you should have appropriate credentials specified in
/etc/ppp/chap-secrets, like this:

	simobil * "your password"

> Nov 25 08:54:41 nova pppd[1175]: sent [CCP ConfReq id=0x1 <deflate 15>
> <deflate(old#) 15> <bsd v1 15>]

You might as well specify "noccp".  It won't make much of a
difference, though.

> Nov 25 08:54:41 nova pppd[1175]: sent [IPCP ConfReq id=0x1 <addr
> 192.168.254.57>]

This is due to the misuse of the ipcp-allow-* options above.  To avoid
confusing the peer, you shouldn't be sending it an RFC 1918 address.

> Nov 25 08:54:41 nova pppd[1175]: rcvd [LCP TermReq id=0x7]
[...]
> Why is LCP terminated by peer?

This is typically the case when the authentication data are wrong.

Your user name, passphrase, or chosen authentication protocol are not
correct for this link.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
