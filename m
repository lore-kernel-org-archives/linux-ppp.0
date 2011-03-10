From: tony.chamberlain@lemko.com
Date: Thu, 10 Mar 2011 14:22:38 +0000
Subject: pptponfig centos 5.4
Message-Id: <W6630510430284451299766958@webmail23>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi

I remember one of the James's wrote pptpconfig ;-)

You remember before I was having problems with installation because http
or yum or rpm would lock up over the web.  I had to do this in sysctl:

   net.ipv4.tcp_rmem = 4096 87380 174760
   net.ipv4.tcp_wmem = 4096 16384 131072

and then a sysctl -p.  Now everything works web wise.  But when I try to
install pptpconfig with yum it tells me libxml and libglade.so.0 are
dependencies.  libxml is no problem.  I installed a libglade and did a
symvolic link from the libglade.so (.7 I believe) to libglade.so.0 but
it still tells me libglade.so.0 is required.  I downloaded
libglade-0.17-19.i386.rpm and tried to install but it had a whole lot
more dependencies.

I guess my main questions about centos 5.4 vs. 4.5

  1. Is there a different install method?
  2. Should I be using
rpm -Uvh http://pptpclient.sourceforge.net/yum/stable/fc6/pptp-release-current.noarch.rpm

or a different location to get the repository?


Tony

p.s. yes I can do it manually, have done it before, but it is a pain
having to edit all those files like /etc/ppp/peers/XXXXX and pap-secrets
and chap-secrets, etc.





