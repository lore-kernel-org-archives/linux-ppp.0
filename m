From: "Nicholas Hickman" <nhickman@dtechlabs.com>
Date: Tue, 01 Jul 2008 18:27:43 +0000
Subject: Force PPP dev number
Message-Id: <8140AAF341CC904BA92C3D6A5A190978440847@ditech-1.ditechllc.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Using pppd is there a way to force which ppp interface pppd brings up
when a new connection is started?  In my set up I want a particular peer
configuration to be on a certain ppp interface.

For example:
Config peer0 brings up ppp0
Config peer1 brings up ppp1 whether or not ppp0 is already up
 

Thanks.


-Nick

