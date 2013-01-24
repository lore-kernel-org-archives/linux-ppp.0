From: =?UTF-8?B?Tmd1eeG7hW4gSOG7k25nIFF1w6Ju?= <quannguyen@mbm.vn>
Date: Thu, 24 Jan 2013 04:57:24 +0000
Subject: Re: PPP on TP-Link router?
Message-Id: <5100BF34.5020503@mbm.vn>
List-Id: <linux-ppp.vger.kernel.org>
References: <50FF425E.4000208@mbm.vn>
In-Reply-To: <50FF425E.4000208@mbm.vn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-ppp@vger.kernel.org

Hello,

Now the problem is gone. Seems that the ISP refused my router, based on
unknown criteria.
The criteria is unknown because:
- Not really MAC address restriction: I have another D-Link router with
OpenWrt and different MAC: Connect OK.
- We clone MAC from old router (which is TP-Link 741 with stock
firmware, has been set up since I used ISP's service) to new TP-Link 940
with OpenWrt installed: Timeout is gone, but failed to authenticate.
- I revert 940 to stock firmware without cloning MAC: Cannot connect.
- Revert 940 to stock firmware and clone MAC: Connect OK.
- Reflash that 940 to OpenWrt and clone MAC: Connect OK.

Don't know why flashed TP-Link need MAC clone, but D-Link needn't.


On 01/23/2013 07:25 PM, James Carlson wrote:
> On 01/22/13 21:23, Nguyễn Hồng Quân wrote:
>> Here is my log:
>> http://paste.ubuntu.com/1561429/
> The logs show what appears to be a low-level communications problem.
> We're receiving fine, but the peer cannot receive the messages we're
> sending.
>
> If you're able to get diagnostic information out of the peer, you may be
> able to find out what is going wrong, but I think it's more likely that
> a problem like this will require a dedicated external Ethernet analyzer
> to figure out whether or not your system is sending correctly-formed
> messages.
>

-- 
Regards,
Quân

Y!IM: ng_hquan_vn
GTalk: ng.hong.quan

