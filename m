From: =?koi8-r?B?4c7E0sXKIPDF0sXQxczJw9nO?= <tm.andrey@mail.ru>
Date: Wed, 26 May 2004 07:11:04 +0000
Subject: 'active-filter' option
Message-Id: <002d01c442f0$9bf0cb90$0c00000a@mars2>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi, people.
I have a problem using 'active-filter' option. Is it usable, I wonder?
here is my /etc/ppp/peers/isp file:

/dev/modem
115200
lock
connect 'chat -r /var/log/chat.log -v -f /etc/ppp/peers/8170.chat'
user user
demand
idle 100
holdoff 5
defaultroute
usepeerdns
debug
linkname isp
active-filter 'port http or port ftp or port ftp-data or port pop3 or port
smtp'

pppd with this configuration don't even initiate connection on activity on
these ports!
With last line commented out it works perfectly (but stays online when
unwanted traffic flows, of course).

What should I do to make it work as described in manual?

