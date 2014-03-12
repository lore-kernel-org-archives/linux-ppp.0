From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
Date: Wed, 12 Mar 2014 07:54:03 +0000
Subject: RE: Suspecting kernel timing bug in ppp or tty drivers
Message-Id: <ED3E0BCACD909541BA94A34C4A164D4C5B181221@post.tritech.se>
List-Id: <linux-ppp.vger.kernel.org>
References: <ED3E0BCACD909541BA94A34C4A164D4C5B180258@post.tritech.se>
 <20140310194007.GC3392@kroah.com>
 <ED3E0BCACD909541BA94A34C4A164D4C5B180A77@post.tritech.se>,<20140311185019.GA32618@kroah.com>
In-Reply-To: <20140311185019.GA32618@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "linux-ppp@vger.kernel.org" <linux-ppp@vger.kernel.org>, "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>

On Tuesday, March 11, 2014 7:50 PM, Greg KH wrote:
> On Tue, Mar 11, 2014 at 09:41:56AM +0000, Mats K=E4rrman wrote:
>> As the MPC5125 is not main-line and I have some drivers for proprietary
>> hardware the porting and re-testing will take me at least a week I guess.
>
> Why aren't these drivers and arch code upstream?

Well, the proprietary drivers are for hardware that only exist on our propr=
ietary
board so I guess community interest is limited. Of course the buyers of
the product will get access to the source if they want to.

The MPC5125 adaptions partly comes from the Freescale Linux demo for
the TWR5125 board so they are not mine to contribute. However I was
surprised to see that someone has started contributing 5125 stuff since
v3.2 so maybe there will be an opportunity for me to contribute as well,
once I get the new kernel running.

:) // Mats