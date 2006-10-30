From: Christian <crich-ml@beronet.com>
Date: Mon, 30 Oct 2006 14:11:36 +0000
Subject: Re: Way how frames are read in pppd
Message-Id: <45460818.9020706@beronet.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <4540C35F.9010104@beronet.com>
In-Reply-To: <4540C35F.9010104@beronet.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


>OK.  Is that in the kernel or outside of the kernel?
>
>  
>
it's in userspace.

>If it's in user space, then I believe you'll need to re-encode the
>data using AHDLC so that you can pass it over a pty.
>
>  
>
do you know of any library implementing AHDLC ? I'm right now trying to
use spandsps implemetation, but it seems not receive a frame..

