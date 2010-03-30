From: Charlie Brady <charlieb-linux-ppp@budge.apana.org.au>
Date: Tue, 30 Mar 2010 18:34:03 +0000
Subject: Re: Cent OS 5.4
Message-Id: <Pine.LNX.4.64.1003301431180.12695@e-smith.charlieb.ott.istop.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <W732333063034611269973628@webmail11>
In-Reply-To: <W732333063034611269973628@webmail11>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


On Tue, 30 Mar 2010, tony.chamberlain@lemko.com wrote:

> Here is an overview of what I do in 4.5:
>
>   rpm -Uvh  dkms-2.0.5-1.noarch.rpm \
>          kernel_ppp_mppe-0.0.5-2dkms.noarch.rpm \
>          libglade-0.17-14.i386.rpm \
>          libxml-1.8.17-6.i386.rpm

RHEL5 now includes MPPE support in the kernel, so you do not need dkms or 
kernel_ppp_mppe.

I'd be surprised if this is not documented somewhere under 
http://pptpclient.sourceforge.net/.

I don't know why you are installing libglade and libxml, but maybe you 
don't need those either.
