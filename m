From: James Carlson <carlson@workingcode.com>
Date: Tue, 30 Dec 2003 15:30:29 +0000
Subject: Re: help with PPP and RH 9 external modem
Message-Id: <16369.39445.600544.576631@h006008986325.ne.client2.attbi.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Mike Rosenlof writes:
> Dec 29 16:03:37 Mike pppd[4283]: sent [LCP ConfReq id=0x1 <asyncmap
> 0x0> <magic
> 0x8867dfe6> <pcomp> <accomp>]
> Dec 29 16:04:04 Mike last message repeated 9 times

It looks like the peer isn't responding.  This typically means that
the peer isn't running PPP at all, often due to a failure in something
other than PPP itself, such as the chat script or modem configuration.

Take a look at the chat script first.  Two things to check:

	- If it doesn't use "AT&F" to initialize the modem, then use
          that.  (If it's a USR modem, use "AT&F1" instead.)

	- If it ends with "CONNECT ''", replace that with "CONNECT \c".

	- If it tries to log in (using 'ogin:' ...), remove that.

-- 
James Carlson                                  <carlson@workingcode.com>
