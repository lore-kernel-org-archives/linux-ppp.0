From: Patrick Mahan <mahan@mahan.org>
Date: Mon, 08 Jun 2020 17:04:41 +0000
Subject: Re: PPP cycling between UP and DOWN
Message-Id: <8d6fcc7e-c727-7979-13ca-a3e80d9eb514@mahan.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <f44e7e14-1621-7141-66a3-3a2218e8db86@mahan.org>
In-Reply-To: <f44e7e14-1621-7141-66a3-3a2218e8db86@mahan.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-ppp@vger.kernel.org

On 5/28/20 6:59 AM, James Carlson wrote:
> On 2020-05-27 15:16, Patrick Mahan wrote:
>> I have a script that monitors by this by having a modified ip-up and
>> ip-down script write a value to a specific file under /var/run/pppd/ and
>> if it is ip-down, then I schedule a restart of pppd to occur once the
>> pppd image exits.  I have assumed that ip-down being triggered is and
>> indication that PPPoE connection is down and over.
> 
> That's the most likely case.  It would help to have _complete_ debug
> logs showing what's happening.
> 
> (For what it's worth, another person posting to this list recently was
> having PPPoE problems that ended up tracking back to a bad Ethernet
> driver.  The driver allowed receive of unicast packets with someone
> else's address, and the PPPoE kernel code accepted a stray PADT that
> caused the link to go down.)  (PPPoE, as a protocol, is pretty nasty stuff.)
> 
>> But I am now seeing that this assumption could be incorrect.  I don't
>> claim to understand the entire protocol layers involved.  But is it
>> supported that a PPPoE connection can shift back from the IPCP layer to
>> the LCP layer?  Then back?
> 
> IPCP can certainly be taken down without taking down LCP.  And LCP can
> be renegotiated (implicitly taking down IPCP as well) at any time.
> However, I've yet to find a commercial service provider that actually
> supports anything like this.  All of the systems they use are much more
> limited implementations.
> 
> It sounds like a stretch to me.  A debug log would show for sure, though.
> 
>> Or is this a ppp protocol issue.  I see in the pppd code that we can
>> moved to a down state if we get a request to restart negotiations, so I
>> can see that my assumption may be incorrect.
> 
> It can, as described above, but it's not something that's commonly (or
> "ever") implemented, at least in my experience.  Renegotiation almost
> always leads to complete teardown.  (Depending on the vendor, some will
> start doing LCP Protocol-Reject on the NCP protocols like IPCP if you
> attempt that.)
> 
> This doesn't sound likely to me.  But, again, debug logs are your friend
> here.
> 
> Use the pppd 'debug' option.  By itself, that'll write the log
> information to syslog daemon.debug (be sure to redirect that to a file).
>   Or use the "logfile /path/to/file" option to write the messages to a
> file.  Then post those logs.
> 
> It's important to understand that PPP is just one protocol layer.  PPPoE
> itself is distinct, with its own messages and states.  The actions of
> PPPoE are seen by PPP as just underlying link up/down states -- very
> much like the signals PPP would get from a modem.
> 

I finally obtained the PPPoE logs from my customer.  I have redacted the IP 
addresses.  This is where I think we get the UP-->DOWN-->UP that is causing my 
issue.  Oddly, the customer has not experienced another event of this nature 
since then.

Here is the log with my annotations:

Executing pppd w/plugin(/etc/ppp/plugins/rp-pppoe.so): '/usr/sbin/pppd plugin 
/etc/ppp/plugins/rp-pppoe.so nic-wan0  unit 0 noipdefault noauth default-asyncmap 
defaultroute hide-password nodetach  mtu 1492 mru 1492 noaccomp nodeflate nopcomp 
novj novjccomp user w29ddnjt@bizf.ocn.ne.jp lcp-echo-interval 20 lcp-echo-failure 3 '
PPPd pid is 15175
Plugin /etc/ppp/plugins/rp-pppoe.so loaded.
RP-PPPoE plugin version 3.12 compiled against pppd 2.4.7
Connected to 00:12:e2:c0:0e:94 via interface wan0
Using interface ppp0
Connect: ppp0 <--> wan0
CHAP authentication succeeded
CHAP authentication succeeded
peer from calling number 00:12:E2:C0:0E:94 authorized
kernel does not support PPP filtering
sifdefaultroute(unit=0, ouraddr=XX.XX.XX.XX, gateway=YY.YY.YY.YY)
local  IP address XX.XX.XX.XX
remote IP address YY.YY.YY.YY

NOTE: This is where the first ip-up callout was triggered.

Connect time 0.1 minutes.
Sent 0 bytes, received 10 bytes.

NOTE: This is where I think the ip-down callout was triggered.

sifdefaultroute(unit=0, ouraddr=XX.XX.XX.XX, gateway=YY.YY.YY.YY)
local  IP address XX.XX.XX.XX
remote IP address YY.YY.YY.YY

NOTE: This is where I think the second ip-up callout was triggered.

Modem hangup
Connect time 1629.1 minutes.
Sent 572 bytes, received 452067 bytes.
Connection terminated.
PPPoE shutdown on interface 'ppp0', exit status is '16'

Thanks,

Patrick
