From: Clifford Kite <kite_linux-ppp@ev1.net>
Date: Thu, 22 Apr 2004 21:43:17 +0000
Subject: pppd 2.4.2 bug?
Message-Id: <Pine.LNX.4.21.0404221627080.17764-100000@corncob.localhost.tld>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

This is an extract from a response by the OP to a reply by me on
comp.protocols.ppp:

  Clifford Kite wrote:
  >>rcvd [IPCP ConfRej id=0x3 <addrs 192.168.1.99 0.0.0.0>]
  >>sent [IPCP ConfReq id=0x4 <addrs 192.168.1.99 0.0.0.0>]
  >>rcvd [IPCP ConfRej id=0x4 <addrs 192.168.1.99 0.0.0.0>]
  >>sent [IPCP ConfReq id=0x5 <addrs 192.168.1.99 0.0.0.0>]
  >>rcvd [IPCP ConfRej id=0x5 <addrs 192.168.1.99 0.0.0.0>]
  >>sent [IPCP ConfReq id=0x6 <addrs 192.168.1.99 0.0.0.0>]
  >>rcvd [IPCP ConfRej id=0x6 <addrs 192.168.1.99 0.0.0.0>]
  >>.....
  >>repeats forever until I kill it
  >
  >
  > Forever is relative.  It should stop all negotiation after 10 such
  > requests.  Or there may be a bug in the code that negotiates the
  > (old) IP addresses option.

  Well, I started pppd and it dropped into the 'loop', so I went to make
  coffee, ran some errands, and when I came back it was still doing it. So
  that classifies as 'forever' for me ;)

I wrote back, saying that in my eyes it also qualified as forever. :)
So it does seem to be a bug.

---
Clifford Kite                                 http://ckite.no-ip.net

