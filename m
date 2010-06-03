From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 03 Jun 2010 13:13:52 +0000
Subject: Re: PPPoA server setup how to?
Message-Id: <4C07AA90.1030704@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <AANLkTikV_j1ajMThiB8B6DoaZpZ4fhlIRVVk2jK30-h8@mail.gmail.com>
In-Reply-To: <AANLkTikV_j1ajMThiB8B6DoaZpZ4fhlIRVVk2jK30-h8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

arun b wrote:
> Hi James,
> 
> Yes I am convinced with your schismatic-presentation, now I know what
> exactly it need to run server.
> 
> And I would say,  it is not possible  for me to test PPPoA because.
> 1) As we neither have DSLAM with uplink is ATM path nor the built in
> support for PPP, rather it has only Ethernet-uplink .

I assume that's what you meant by "RJ-11" in your previous postings.

For what it's worth, RJ-11 is typically used for Ethernet, but can also
be used for DS-1 and other signals.  It's just an electromechanical
connector, and saying you have "RJ-11" doesn't tell us much about what
sort of equipment you're using.  (Other than what it looks like ...)

> 2) Also do not available of any  Linux-server which terminates the ATM-path.
> So I will have  to explore the possibility, how can I arrange this...!
> 
> So one doubt again, Could you please name the know-standard-devices
> (manufactures/makes) for Linux-server in the below diagram, which has
> support of similar server-command mentioned by you in the previous
> e-mail.

As the other James mentioned, this really isn't the right list for that
sort of question, because it's not so related to PPP, and the people you
need aren't necessarily subscribed to this list.  You may need to do
some investigation on your own.

It's unclear what hardware you need to support.  You probably need to
work that out.  Perhaps the simplest answer (to test PPPoA and ignoring
all else) would be to get two ATM NICs and connect them back-to-back; see:

http://www.linux.org/docs/ldp/howto/ATM-Linux-HOWTO/signaling.html#SIGNALING.RUNNING-TWO-ATM-NICS-BACK-TO-BACK

Or even simpler with the ATM/TCP "test" driver.  Or maybe you need to
invest in some ADSL test gear or have your system evaluated by a
commercial testing service.

An even better answer would be to scout around for an ATM or ADSL expert
to advise you.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
