From: James Carlson <carlsonj@workingcode.com>
Date: Sun, 06 Jun 2010 21:17:51 +0000
Subject: Re: PPPoA server setup how to?
Message-Id: <4C0C107F.3040901@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <AANLkTikV_j1ajMThiB8B6DoaZpZ4fhlIRVVk2jK30-h8@mail.gmail.com>
In-Reply-To: <AANLkTikV_j1ajMThiB8B6DoaZpZ4fhlIRVVk2jK30-h8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 06/05/10 03:34, arun b wrote:
> Yes let me see the possiblities, However Currnelty i am parking PPPoA test.
> Now I  wnated to try PPPoSerial..if any one awere  of setup please responsd.

For a plain PPP connection over serial (both async and sync), all you
should really need is a proper null-modem connection.

(With async, you can get by with as few as three wires -- TXD, RXD, and
GND.  With sync, you'll likely need slightly more and will have to set
up one side to do clock generation.  But if you have the right resources
for your serial interfaces, it shouldn't be hard.)

It should work quite simply.  Did you even try it ... ?  If so, what
problems are you now facing?

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
