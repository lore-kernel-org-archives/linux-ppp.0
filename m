From: Jelle de Jong <jelledejong@powercraft.nl>
Date: Tue, 20 Oct 2009 12:59:33 +0000
Subject: ppp sometimes receives bogus dns with 3G hsdpa modems
Message-Id: <4ADDB435.20705@powercraft.nl>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello everybody,

I am having some question on why my hdspa ppp connection sometimes but 
not always receives a bogus dns server (10.11.12.13). That causes DNS 
resolving to break.

So I know there are several things I can use as workaround like using 
resolvconf or disable the domain-name-servers request in the dhclient.conf.

I am using Debian stable with ppp version 2.4.4rel-10.1

But I would like to see what the experts think what causes these issues 
and what would be the best solution?

This system connection should try to stay persistent connected no matter 
what.

Thanks in advance,

Jelle

I included my setup below:

------------------------------------------------------------------------

echo "vodafone  *   vodafone" | sudo tee /etc/ppp/pap-secrets
echo "vodafone  *   vodafone" | sudo tee /etc/ppp/chap-secrets

------------------------------------------------------------------------

echo 'TIMEOUT 3
ABORT "BUSY"
ABORT "NO CARRIER"
ABORT "VOICE"
ABORT "NO DIALTONE"
ABORT "NO DIAL TONE"
ABORT "NO ANSWER"
ABORT DELAYED
"" ATZ
OK ATQ0&FEV1X1S0=0&C1&D2
OK AT+CGDCONT,"IP","office.vodafone.nl"
OK ATDT*99***16#
CONNECT ""' | sudo tee /etc/chatscripts/mobile-vodafone.chat

echo '/dev/ttyUSB0
7200000
user vodafone
connect "/usr/sbin/chat -v -f /etc/chatscripts/mobile-vodafone.chat"
#crtscts
#modem
#noccp
#nobsdcomp
#novj
#lock
#hide-password
noauth
usepeerdns
noipdefault
#mtu 1492
mtu 1412
persist
maxfail 0
holdoff 20
defaultroute replacedefaultroute' | sudo tee /etc/ppp/peers/mobile-vodafone

------------------------------------------------------------------------

cat /etc/network/interfaces
auto lo
   iface lo inet loopback

auto ppp0
   iface ppp0 inet ppp
   provider mobile-vodafone

------------------------------------------------------------------------
