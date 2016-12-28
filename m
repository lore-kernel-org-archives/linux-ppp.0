From: James Carlson <carlsonj@workingcode.com>
Date: Wed, 28 Dec 2016 17:20:01 +0000
Subject: Re: Starting dhcpcd terminates the established PPPoE connection
Message-Id: <a9a696d3-a3b3-0693-98fa-72c2e31be436@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAMBnWDj4zppEWV4i0ekcNmgbEDP_eVENBkKDEjFHUP8ZJYZi=w@mail.gmail.com>
In-Reply-To: <CAMBnWDj4zppEWV4i0ekcNmgbEDP_eVENBkKDEjFHUP8ZJYZi=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 12/27/2016 6:26 PM, Sven Kirmess wrote:
>>From /var/log/ppp.log:
> 
> Dec 25 02:26:56 kaldra pppd[8185]: rcvd [LCP TermReq id=0x2]
> Dec 25 02:26:56 kaldra pppd[8185]: LCP terminated by peer
> Dec 25 02:26:56 kaldra pppd[8185]: Connect time 1.0 minutes.

It wouldn't be a bad thing to see what led up to this point, but I
suspect there isn't much more information available on this side.  A
good implementation of PPP uses the optional disconnection message in
LCP Terminate-Request to report the reason why the connection is being
dropped.  Unfortunately, the PPP implementation used by your peer isn't
good, and it doesn't do that.

It's remotely possible that the disconnection is unrelated to DHCP and
that it's just coincidence.  That's why I suggested posting more of the
logs.  But I think it's just a very remote possibility.

I'm afraid that most likely means that you need to talk with your ISP
and find out if they have logs or error messages to share with you.  My
experience with most of these ISPs, though, is that there's nobody home
at the other end, and the only thing you can really do is quit and find
a better one.

Your mileage may vary.

> Dec 25 02:26:57 kaldra pppd[8185]: Failed to disconnect PPPoE socket:
> 114 Operation already in progress

Besides this apparently spurious error message, did the PPPoE client log
any sort of message about the disconnection?

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
