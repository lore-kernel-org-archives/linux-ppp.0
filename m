From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 02 Feb 2006 21:42:28 +0000
Subject: Re: EDGE modem gives error.. LCP: timeout sending config requests
Message-Id: <17378.31940.294484.842905@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <BAD05164DBF6BF44AD171A36DBC6E77505DACA6A@pusehe0w.eh.pweh.com>
In-Reply-To: <BAD05164DBF6BF44AD171A36DBC6E77505DACA6A@pusehe0w.eh.pweh.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Desai, Ankit (Export) writes:
> rcvd [LCP ConfReq id=0x5 <auth pap> <magic 0x5cd90830> <pcomp> <accomp>]

The peer asks you to authenticate using PAP.

> sent [LCP ConfRej id=0x5 <auth pap>]

You refuse to authenticate at all.

The problem is that your authentication data are missing.  Add this to
your configuration:

  user username

replacing "username" with your actual user name in use with this ISP.
Then add this to the /etc/ppp/pap-secrets file (create the file if it
doesn't already exist):

  username * "your password"

replacing "username" with your user name (again) and "your password"
with the password or passphrase used to connect to this peer.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
