From: James Carlson <carlsonj@workingcode.com>
Date: Sat, 31 Dec 2016 19:24:13 +0000
Subject: Re: Starting dhcpcd terminates the established PPPoE connection
Message-Id: <e6a858bd-b6a4-0630-f8b1-0257f51092ff@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAMBnWDj4zppEWV4i0ekcNmgbEDP_eVENBkKDEjFHUP8ZJYZi=w@mail.gmail.com>
In-Reply-To: <CAMBnWDj4zppEWV4i0ekcNmgbEDP_eVENBkKDEjFHUP8ZJYZi=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 12/31/2016 8:45 AM, Sven Kirmess wrote:
> On Thu, Dec 29, 2016 at 9:37 PM, James Carlson <carlsonj@workingcode.com> wrote:
> 
>> I don't see much that's special going on there.  I still think the
>> problem is on the peer's side, not yours.
> 
> That's going to be much more difficult to get fixed.
> 
>> Does /libexec/dhcpcd-run-hooks do anything crazy, such as pkill?
> 
> I can't find anything.
> 
> Besides that, I've restarted dhcpcd and for now know it's working
> again. Without a change on my side.
> 
> Thanks for your confirmation that it's probably not on my side.
> 

One possibly interesting note is that I see LCP being renegotiated after
starting authentication.  That's a dead give-away that the other side
has a front-end device that tunnels the PPP traffic back to back-end
servers.

The reason it works sometimes and not at other times could be that you
sometimes hit a broken (or misconfigured) back-end server, and other
times you hit one that's ok.

It could also be that someone on their side noticed the errors and fixed
something.  You could be just that lucky.  :-/

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
