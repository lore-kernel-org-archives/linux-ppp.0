From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 29 Dec 2016 20:37:02 +0000
Subject: Re: Starting dhcpcd terminates the established PPPoE connection
Message-Id: <c43b73fd-77d0-1a41-2113-38a834dcb97e@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAMBnWDj4zppEWV4i0ekcNmgbEDP_eVENBkKDEjFHUP8ZJYZi=w@mail.gmail.com>
In-Reply-To: <CAMBnWDj4zppEWV4i0ekcNmgbEDP_eVENBkKDEjFHUP8ZJYZi=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 12/29/16 06:35, Sven Kirmess wrote:
> Hi James,
> 
> Thanks for looking into this.
> 
> On Wed, Dec 28, 2016 at 6:20 PM, James Carlson <carlsonj@workingcode.com> wrote:
> 
>> It's remotely possible that the disconnection is unrelated to DHCP and
>> that it's just coincidence.  That's why I suggested posting more of the
>> logs.  But I think it's just a very remote possibility.
> 
> I've added the log files to dropbox. I've rebooted the system at 01:39
> and at 01:59.
> 
> <https://www.dropbox.com/s/k6s70fzl7ee4o42/daemon.txt?dl=0>
> <https://www.dropbox.com/s/1h6mqvcxvstvf4y/debug.txt?dl=0>
> <https://www.dropbox.com/s/msg66lt19f95772/kern.txt?dl=0>
> <https://www.dropbox.com/s/lnm6aw5fzskq0d4/ppp.txt?dl=0>
> <https://www.dropbox.com/s/qxcx7wm4yj7qhr5/syslog.txt?dl=0>

I don't see much that's special going on there.  I still think the
problem is on the peer's side, not yours.

Does /libexec/dhcpcd-run-hooks do anything crazy, such as pkill?

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
