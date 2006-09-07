From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 07 Sep 2006 11:59:28 +0000
Subject: Re: serial device access from welcome script
Message-Id: <17664.2464.746721.412796@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <200609061445.20406.thilo@riessner.de>
In-Reply-To: <200609061445.20406.thilo@riessner.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Pieter Loubser writes:
> 
> Have you removed the "lock" option from your ppp options file
> (/etc/ppp/options)?

The "lock" option only creates UUCP advisory lock files; it doesn't
actually prevent access to the serial port.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
