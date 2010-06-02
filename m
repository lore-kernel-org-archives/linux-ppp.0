From: James Carlson <carlsonj@workingcode.com>
Date: Wed, 02 Jun 2010 14:26:06 +0000
Subject: Re: PPPoA server setup how to?
Message-Id: <4C0669FE.3070409@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <AANLkTikV_j1ajMThiB8B6DoaZpZ4fhlIRVVk2jK30-h8@mail.gmail.com>
In-Reply-To: <AANLkTikV_j1ajMThiB8B6DoaZpZ4fhlIRVVk2jK30-h8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

arun b wrote:
> On Wed, Jun 2, 2010 at 4:27 PM, James Carlson <carlsonj@workingcode.com> wrote:
>> But I think it's probably time to take a step back and ask the obvious
>> question: can you tell us what you've got (in terms of hardware,
>> software, and operational environment) and what you're trying to do (in
>> as much high-level detail as possible)?
> 
> NO I am not building it for Dslam-box. well I want to run PPPoA server
> at remote side device where ATM path terminates.
> I am executing this is   "pppd plugin pppoatm.so 0.80
> 192.168.1.1:192.168.1.2 passive"  on my client(linux-box).

"passive" is a slightly surprising option to see on the "client" side of
the connection.  Are you sure that's what you want?  And are you sure
that 0.80 are the right VPI/VCI pair for the connection?

There are two broad classes of problems that show up here: either the
ATM link isn't working, or the PPP link on top is misconfigured.  What
do you actually see when you run pppd?  Have you tried running with the
"debug" option enabled?  What log messages are produced?

If pppd is timing out in LCP with "too many" Configure-Request messages,
then the likely culprit is the ATM configuration.  Otherwise, PPP might
be involved; possibly missing authentication or L3 address information.

>      |-| RJ-11 connector   "pppd plugin pppoatm.so 0.80
> 192.168.1.1:192.168.1.2 passive"

It should be obvious, but the connection between these two machines
_must_ be ATM, and _not_ Ethernet.

> Here the server device and the configuration are unknown to me. Could
> you help in choose the server device (Dslam, iSam like..), and
> enabling it.

If you're not the administrator for the remote end, then I have no idea
how you might go about enabling it.  Won't you have to drive down to
your ISP's offices and break in first?

Or are you planning to set up your own PPPoA server ... ?

I'm confused by what you're saying here.

> James,
> To your question:
> I have MIPS based network device currently with me. And am exploring
> all PPPoX-Client(oe/oa/...) configuration. Where I am already able to
> test pppoe, pppoeonATm, and wanted start on PPPoS.  - so that we can
> port this solution to any of the h/w.
> Now got stoped at PPPoA !!!

Do you have an ATM link to a system that runs PPPoA?  If so, then do you
have configuration information (particularly VPI/VCI) for that link?  Is
it a nailed-up VPI/VCI pair or is it "dialed" using UNI signaling?

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
