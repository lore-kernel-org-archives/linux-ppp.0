From: Sven Kirmess <sven.kirmess@kzone.ch>
Date: Thu, 29 Dec 2016 11:35:22 +0000
Subject: Re: Starting dhcpcd terminates the established PPPoE connection
Message-Id: <CAMBnWDh0p60inpNyt2viaSCC5RahGxoTk05y2snzE0wg-LOjdw@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAMBnWDj4zppEWV4i0ekcNmgbEDP_eVENBkKDEjFHUP8ZJYZi=w@mail.gmail.com>
In-Reply-To: <CAMBnWDj4zppEWV4i0ekcNmgbEDP_eVENBkKDEjFHUP8ZJYZi=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi James,

Thanks for looking into this.

On Wed, Dec 28, 2016 at 6:20 PM, James Carlson <carlsonj@workingcode.com> wrote:

> It's remotely possible that the disconnection is unrelated to DHCP and
> that it's just coincidence.  That's why I suggested posting more of the
> logs.  But I think it's just a very remote possibility.

I've added the log files to dropbox. I've rebooted the system at 01:39
and at 01:59.

<https://www.dropbox.com/s/k6s70fzl7ee4o42/daemon.txt?dl=0>
<https://www.dropbox.com/s/1h6mqvcxvstvf4y/debug.txt?dl=0>
<https://www.dropbox.com/s/msg66lt19f95772/kern.txt?dl=0>
<https://www.dropbox.com/s/lnm6aw5fzskq0d4/ppp.txt?dl=0>
<https://www.dropbox.com/s/qxcx7wm4yj7qhr5/syslog.txt?dl=0>

I was able to bring the line back up after I've removed the ip-up
script that starts/stops dhcpcd.

> I'm afraid that most likely means that you need to talk with your ISP
> and find out if they have logs or error messages to share with you.  My
> experience with most of these ISPs, though, is that there's nobody home
> at the other end, and the only thing you can really do is quit and find
> a better one.
>
> Your mileage may vary.
>
>> Dec 25 02:26:57 kaldra pppd[8185]: Failed to disconnect PPPoE socket:
>> 114 Operation already in progress
>
> Besides this apparently spurious error message, did the PPPoE client log
> any sort of message about the disconnection?

I can't see anything.

Sven
