From: James Cameron <quozl@laptop.org>
Date: Thu, 30 Dec 2010 22:55:07 +0000
Subject: Re: Error configuring 2 Huawei (EC1261 model )CDMA modem at same
Message-Id: <20101230225507.GD4279@us.netrek.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <AANLkTimJxOafgL6qg9ENCRHWqptb14tpzQY7Gi2G10YG@mail.gmail.com>
In-Reply-To: <AANLkTimJxOafgL6qg9ENCRHWqptb14tpzQY7Gi2G10YG@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, Dec 30, 2010 at 02:47:59PM +0530, vandana salve wrote:
> At a time only one modem is configured successfully. This works with
> either of the modem but not with both modems at same time

Perhaps the modems are interfering with each other.

Test as follows: With one modem connected to internet, use AT commands
on the second modem to reset it (ATZ), query signal strength (AT+CSQ),
registration with network (AT+CGATT?), and scan for networks (AT+COPS).
Repeat the tests with both modems disconnected from the internet.
Compare the results.

Ensure good electrical and physical separation of:

- the modem power supplies,
- the modem RF stages,
- the modem antenna systems.

Repeat the tests after change of separation.

To automate testing, here is one method, using chat included with pppd
package:

# cat << EOF > test.chatscript
REPORT +CGATT:
REPORT +CSQ:
'' AT
OK-AT-OK AT+CGATT?
OK-AT-OK AT+CSQ
OK-AT-OK ''
EOF
# chat -f test.chatscript -t3 -r test.results < /dev/ttyUSB0 > /dev/ttyUSB0

-- 
James Cameron
http://quozl.linux.org.au/
