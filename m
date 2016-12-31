From: Sven Kirmess <sven.kirmess@kzone.ch>
Date: Sat, 31 Dec 2016 13:45:20 +0000
Subject: Re: Starting dhcpcd terminates the established PPPoE connection
Message-Id: <CAMBnWDjMSjLMmN_0Fn7iNHre2jQ68GMvJBAebzjLQQ2PC02EJg@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAMBnWDj4zppEWV4i0ekcNmgbEDP_eVENBkKDEjFHUP8ZJYZi=w@mail.gmail.com>
In-Reply-To: <CAMBnWDj4zppEWV4i0ekcNmgbEDP_eVENBkKDEjFHUP8ZJYZi=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, Dec 29, 2016 at 9:37 PM, James Carlson <carlsonj@workingcode.com> wrote:

> I don't see much that's special going on there.  I still think the
> problem is on the peer's side, not yours.

That's going to be much more difficult to get fixed.

> Does /libexec/dhcpcd-run-hooks do anything crazy, such as pkill?

I can't find anything.

Besides that, I've restarted dhcpcd and for now know it's working
again. Without a change on my side.

Thanks for your confirmation that it's probably not on my side.
