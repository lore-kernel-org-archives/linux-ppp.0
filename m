From: James Carlson <carlsonj@workingcode.com>
Date: Mon, 30 Oct 2006 14:49:07 +0000
Subject: Re: Way how frames are read in pppd
Message-Id: <17734.4323.634524.121165@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <4540C35F.9010104@beronet.com>
In-Reply-To: <4540C35F.9010104@beronet.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Christian writes:
> >If it's in user space, then I believe you'll need to re-encode the
> >data using AHDLC so that you can pass it over a pty.
> >
> >  
> >
> do you know of any library implementing AHDLC ? I'm right now trying to
> use spandsps implemetation, but it seems not receive a frame..

You can feel free to use this one:

  ftp://ftp.workingcode.com/pub/carlson/ppp/ahdlc.c
  ftp://ftp.workingcode.com/pub/carlson/ppp/ahdlc.h

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
