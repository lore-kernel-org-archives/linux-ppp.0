From: Jouko Nikula <nikujo@luukku.com>
Date: Wed, 11 Aug 2010 13:12:45 +0000
Subject: Intervening IPCP Configure Requests
Message-Id: <29408130.post@talk.nabble.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


Hello,

I'm using pppd as a server and I would want to do the following: 
 1.) Client sends IPCP configure request including an IP-address for the
client
 2.) Before pppd responds I want to decide on accepting or rejecting the IP
address outside pppd
 3.) Based on the decision in 2.) I want either to ACK the IPCP configure
request or terminate the ppp connection.

Second use case is when client does not specify an IP-address. Then I would
want to acquire a dynamic address, again outside pppd. If I found out that
dynamic addresses are not allowed I would terminate the ppp connection,
otherwise I would want to NAK the IPCP configure request with the acquired
IP-address.

I have looked into pppd plugin interface, but if I understand correctly the
current interface only provides the address given on the command line or
options file, not the ip-address requested by the other end. The ip-up or
ip-pre-up scripts don't seem to work for me because they are called when the
IPCP negotiation has already ended.

Could you please give me some ideas how I could implement this? Should I
extend the plugin interface so that I add hooks for IPCP negotiation and
create a plugin for this?

Thanks in advance!

Regards,
Jouko Nikula
-- 
View this message in context: http://old.nabble.com/Intervening-IPCP-Configure-Requests-tp29408130p29408130.html
Sent from the linux-ppp mailing list archive at Nabble.com.

