From: James Carlson <carlsonj@workingcode.com>
Date: Fri, 14 Feb 2020 16:40:06 +0000
Subject: Re: Porting source to OSX
Message-Id: <e49785c8-43cd-7186-2e51-4949ec9a57dc@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <808CF219-67B9-45A0-B1FA-A53E682B0B06@gmail.com>
In-Reply-To: <808CF219-67B9-45A0-B1FA-A53E682B0B06@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 2/14/20 9:51 AM, igal avraham wrote:
> Is there a port available for OS X ?

pppd version 2.4.2 is included as part of Mac OS X, but my understanding
is that this port was done inside Apple and that they haven't released
source code for it.  The existing publicly-available pppd code doesn't
have support for a "Darwin" (Mac OS X) kernel.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
