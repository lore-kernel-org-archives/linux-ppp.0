From: Matt Domsch <Matt_Domsch@dell.com>
Date: Fri, 21 Sep 2007 14:40:53 +0000
Subject: Re: [PATCH] ppp_mppe: Don't put InterimKey on the stack
Message-Id: <20070921144053.GA28101@auslistsprd01.us.dell.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <46F3D049.4080006@redhat.com>
In-Reply-To: <46F3D049.4080006@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michal Schmidt <mschmidt@redhat.com>
Cc: Linux Kernel list <linux-kernel@vger.kernel.org>, Frank Cusack <fcusack@fcusack.com>, linux-ppp@vger.kernel.org

On Fri, Sep 21, 2007 at 04:08:09PM +0200, Michal Schmidt wrote:
> Hello,
> 
> The interrupt stack can be in the __START_KERNEL_map region in which
> virt_to_page will not work. This caused ppp_mppe to crash on CentOS 5 on x86_64
> (http://bugs.centos.org/view.php?id 76).
> 
> The fix is to avoid copying the interim key. We can simply use it in its
> original place, which is kmalloc'd.

Needs a Signed-off-by: line, but otherwise, looks good, and even saves
some stack space.  Thanks for tracking this down.

-Matt

-- 
Matt Domsch
Linux Technology Strategist, Dell Office of the CTO
linux.dell.com & www.dell.com/linux
