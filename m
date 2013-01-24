From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 24 Jan 2013 20:15:25 +0000
Subject: Re: PPP on TP-Link router?
Message-Id: <5101965D.4090008@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <50FF425E.4000208@mbm.vn>
In-Reply-To: <50FF425E.4000208@mbm.vn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-ppp@vger.kernel.org

On 01/23/13 23:57, Nguyễn Hồng Quân wrote:
> Hello,
> 
> Now the problem is gone. Seems that the ISP refused my router, based on
> unknown criteria.
> The criteria is unknown because:
> - Not really MAC address restriction: I have another D-Link router with
> OpenWrt and different MAC: Connect OK.
> - We clone MAC from old router (which is TP-Link 741 with stock
> firmware, has been set up since I used ISP's service) to new TP-Link 940
> with OpenWrt installed: Timeout is gone, but failed to authenticate.
> - I revert 940 to stock firmware without cloning MAC: Cannot connect.
> - Revert 940 to stock firmware and clone MAC: Connect OK.
> - Reflash that 940 to OpenWrt and clone MAC: Connect OK.
> 
> Don't know why flashed TP-Link need MAC clone, but D-Link needn't.

Tracking MAC addresses as a means to do "authentication" (or "policy
enforcement") is pretty common among ISPs using PPPoE.  My guess would
be that you tripped over something odd in the enforcement mechanism.

I think it's still possible that the ISP is looking for some PPPoE
option or behavior to determine whether you're "compliant" with their
rules.  One possibility would be that they expect to see a PADT at the
end of a session, and if they don't see it, you can't start another
session with a different MAC address until some other event (such as a
timeout) occurs.

In any event, good to hear that it's working now.  If it happens again,
though, you'll probably want to talk to your ISP, or go shopping for a
different one.  (With luck, one that doesn't use PPPoE ...)

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
