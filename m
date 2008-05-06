From: James Cameron <james.cameron@hp.com>
Date: Tue, 06 May 2008 06:50:44 +0000
Subject: Re: about generic_establish_ppp()
Message-Id: <20080506065044.GT5141@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <200805061149289843689@foxmail.com>
In-Reply-To: <200805061149289843689@foxmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Tue, May 06, 2008 at 11:49:29AM +0800, cyx_mail@foxmail.com wrote:
> in generic_establish_ppp():
> ioctl(fd, PPPIOCATTCHAN, &chindex)
> 1.fd, is the parameter fd a channel's file descriptor or the file
> descriptor for "/dev/ppp0"?

In the PPPIOCATTCHAN, it is the fd opened from /dev/ppp, but in the
PPPIOCGCHAN just prior it is the fd of the tty.  The same variable is
re-used.

> 2.chindex, is this a output parameter or input parameter? what is meaning?

At that time, input.  In the previous ioctl, it is output.  This is
obvious because of the error messages in each return status check, and
because it is used uninitialised first.

You would need to read the kernel source to be certain.

Read the Documentation/networking/ppp_generic.txt file.  Focus on the
definition of channels.

Then read the ppp_generic.c source, concentrating on the PPPIOCGCHAN and
PPPIOCATTCHAN matches.

-- 
James Cameron
http://ftp.hp.com.au/sigs/jc/
