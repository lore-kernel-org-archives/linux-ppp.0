From: "Dennis Aberilla" <daberill@gmail.com>
Date: Wed, 22 Aug 2007 05:30:12 +0000
Subject: Re: PPP loses compression sync when TCP transaction starts.
Message-Id: <57e69ca80708212230s4a2a4eb6n64ccedd2ff21397@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <57e69ca80708212104t1fbd99f7jc3beaa4b34997ffc@mail.gmail.com>
In-Reply-To: <57e69ca80708212104t1fbd99f7jc3beaa4b34997ffc@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 8/22/07, James Cameron <james.cameron@hp.com> wrote:
> What is the underlying data link, /dev/pts/0 ?
>
> --
> James Cameron                         http://quozl.netrek.org/
> HP Open Source, Volunteer             http://opensource.hp.com/
> PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/
>

Yep, I missed out some details here, sorry for that.

Since I have to route packets to/from ppp to/from my serial
connection, I have a shunt program that talks to a file descriptor
from /dev/ptmx and tell pppd to use the corresponding /dev/pts/0.

I've got some updates just now, I've tried pppd-2.4.0 and wallah!!!
The problem is gone.

Thanks.
