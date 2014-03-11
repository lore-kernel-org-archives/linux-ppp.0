From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
Date: Tue, 11 Mar 2014 09:41:56 +0000
Subject: RE: Suspecting kernel timing bug in ppp or tty drivers
Message-Id: <ED3E0BCACD909541BA94A34C4A164D4C5B180A77@post.tritech.se>
List-Id: <linux-ppp.vger.kernel.org>
References: <ED3E0BCACD909541BA94A34C4A164D4C5B180258@post.tritech.se>,<20140310194007.GC3392@kroah.com>
In-Reply-To: <20140310194007.GC3392@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "linux-ppp@vger.kernel.org" <linux-ppp@vger.kernel.org>, "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>

On Monday, March 10, 2014 8:40 PM, Greg KH wrote:
> On Mon, Mar 10, 2014 at 01:36:36PM +0000, Mats K=E4rrman wrote:
>> Some data about the system:
>> - PPP daemon v2.4.5
>> - Linux kernel v3.2.51 (same error with v2.6.35 though)
>=20
> That's a really old kernel version, can you try 3.13 or newer?  Lots of
> work has been done in the tty layer since 3.2 was released.
>=20

Thanks for your reply Greg!

For various reasons I'd prefer to go to the long-term release 3.12.y, would
that be sufficient or do you think the changes made to 3.13 are critical?

(Btw. You recently set a tag for 3.12.14 but the tip of 3.12.y is 3.12.13
 according to git pull and kernel.org cgit, how come?)

As the MPC5125 is not main-line and I have some drivers for proprietary
hardware the porting and re-testing will take me at least a week I guess.

Best regards,
Mats
