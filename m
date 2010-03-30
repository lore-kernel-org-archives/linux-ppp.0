From: tony.chamberlain@lemko.com
Date: Tue, 30 Mar 2010 18:27:08 +0000
Subject: Cent OS 5.4
Message-Id: <W732333063034611269973628@webmail11>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I had a nice install package I wrote for CentOS 4.5 to
install pptpconfig (not just that but all the pptp stuff, the
kernel, dkms, etc).  We recently went to some 5.4 machines.
My current package gives all sorts of errors now so I am sure I need
to update it.  I found this web site:
http://pptpclient.sourceforge.net/ which has info for Red Hat 7, 8, and 9, 
and for Fedora 1-6.  (When I made my package there was some other page
which I can't find now for 4.5).

I am wondering where info might be similar to that on http://pptpclient.sourceforge.net/ but which would work for CentOS 5.4
Or will one of those work?  If so, which?



Here is an overview of what I do in 4.5:

   rpm -Uvh  dkms-2.0.5-1.noarch.rpm \
          kernel_ppp_mppe-0.0.5-2dkms.noarch.rpm \
          libglade-0.17-14.i386.rpm \
          libxml-1.8.17-6.i386.rpm

   rpm -Uvh    http://pptpclient.sourceforge.net/yum/stable/fc6/pptp-release-current.noarch.rpm

   yum --enablerepo=pptp-stable install pptpconfig


I suppose it does look like it uses fc6 for the pptp-release.
Libglade has a whole lot of dependencies now, and there are a lot
of errors about dkms, etc.

Can anyone help?





