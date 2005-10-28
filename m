From: Clifford Kite <kite_linux-ppp@ev1.net>
Date: Fri, 28 Oct 2005 14:19:58 +0000
Subject: Re: Error message with persist option
Message-Id: <Pine.LNX.4.21.0510280840130.18853-100000@corncob.inetport.tld>
List-Id: <linux-ppp.vger.kernel.org>
References: <20051026194149.GA17341@test-scsi>
In-Reply-To: <20051026194149.GA17341@test-scsi>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, 27 Oct 2005, Gilles Espinasse wrote:

|----- Original Message ----- 
|From: "Clifford Kite" <kite_linux-ppp@ev1.net>
|To: "Gregory Colpart" <gcolpart@evolix.net>

|> My two cents:  I think Bill Unruh is correct, i.e., persist only
|> works when a PPP link has gone down but the physical layer remains
|> functional.  A workaround such as you and Unruh described is likely
|> required to automatically reestablish the physical layer after the
|> ISP hangup and then the PPP link.
|>
|modem is still synchronized, atm link remain, is it not the physical layer?

Yes, but after the reset is it functional in the sense of the ISP
recognizing as such?  Do identifiers, e.g., endpoint MACs, session
ID as in PPPoE, need to be reestablished?  In the log pppd reported
a "Modem hangup," which for a regular modem means the data mode is
lost and needs to be renegotiated.

|Such PPPoA case was working well  for me with ppp-2.4.1 and a pppoatm.so
|plugin.

Okay, that appears to be a counter-example, and irrefutable by me since
I've never used PPPoA.  Perhaps buried in the pppd, or pppoatm.so, code
_is_ a mechanism for bringing physical layer functionality back when
persist is used.

---
Clifford Kite

