From: James Carlson <carlsonj@workingcode.com>
Date: Sun, 20 Mar 2011 15:23:28 +0000
Subject: Re: Huawei E398 4G/LTE USB-modem - IPCP fails under pppd 2.4.5
Message-Id: <4D861BF0.6000401@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.LNX.4.61.1103181230280.12352@envy.nxs.se>
In-Reply-To: <Pine.LNX.4.61.1103181230280.12352@envy.nxs.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 3/20/2011 7:23 AM, Tomas Lund wrote:
> However, after moving it back to the linux box again, I found someting
> curious! The defined PDP-contexts in the modem (as shown by AT+CGDCONT?)
> was all empty! (possibly removed by doing AT&F, not verified yet)
> 
> In my chat-script I always overwrite the APN-name based on what IMSI the
> SIM-card has (i use alot of different dongles and SIM-cards and move
> them around alot), so .. just on a whim, I quickly edited the script not
> to do this, and just go ahead and sedn ATDT*99# anyways, without an APN
> set.
> 
> Success!
> 
> I do not yet understand why or how, but this magically worked. :)

That doesn't surprise me much.  Yes, the special AT commands that do
connection set-up are crucial for the device.  And it sounds like the
problem you had was some sort of network registration issue.

You might want to search around for a programmer's reference for the
modem.  If there is one available, it may provide debug commands that
you could use to get status information and find out why setting the APN
causes trouble.  Maybe.  ;-}

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
