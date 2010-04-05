From: tony.chamberlain@lemko.com
Date: Mon, 05 Apr 2010 14:11:40 +0000
Subject: CentOS 5.4 repositories
Message-Id: <W7592413235268421270476700@webmail34>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

The pptp repository doesn't seem to work with 5.4.  yum list times out:

 
 http://poptop.sourceforge.net/yum/stable/rhel5/i386/repodata /primary.sqlite.bz2: [Errno 4] Socket Error: (104, 'Connection reset by peer')
 Trying other mirror.
Same problem for other mirrors.

 rpming from it times out:
 rpm -ivh http://pptpclient.sourceforge.net/yum/stable/rhel5/pptp-release- current.noarch.rpm
 Retrieving http://pptpclient.sourceforge.net/yum/stable/rhel5/pptp-release- current.noarch.rpm
 error: /var/tmp/rpm-xfer.MLsFA7: headerRead failed: hdr blob(7575): BAD, read  returned 3568
 error: /var/tmp/rpm-xfer.MLsFA7 cannot be installed

wget gets a percentage, times out, gets some more, times out, etc.
Visiting with browser loads some and then times out

from non-5.4 machines things seem to go smoothly, of course I don't install
from there because it is the wrong version.

I talked to the people at Sourceforge for a while.  They did some tests and
then said everything there was OK, so it might be something with the pptp
part  (e.g., pptpclient). I did try various IP connections and MTU sizes
set., none of which worked.

Any known problems with the pptp site and CentOS 5.4?  Could it be a 5.4
error? Stuff from other repositories seems to yum install OK.  Here is my repo:


[pptp-stable]
name=PPTP Client stable repository for Red Hat Enterprise Linux $releasever ($basearch)
#baseurl=http://pptpclient.sourceforge.net/yum/stable/rhel$releasever/$basearch
mirrorlist=http://pptpclient.sourceforge.net/yum/stable/mirrorlist-pptp-stable-rhel$releasever
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-PPTP

[pptp-beta]
name=PPTP Client beta repository for Red Hat Enterprise Linux $releasever ($basearch)
#baseurl=http://pptpclient.sourceforge.net/yum/beta/rhel$releasever/$basearch
mirrorlist=http://pptpclient.sourceforge.net/yum/beta/mirrorlist-pptp-beta-rhel$releasever
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-PPTP

[poptop-stable]
name=PoPToP stable repository for Red Hat Enterprise Linux $releasever ($basearch)
#baseurl=http://poptop.sourceforge.net/yum/stable/rhel$releasever/$basearch
mirrorlist=http://poptop.sourceforge.net/yum/stable/mirrorlist-poptop-stable-rhel$releasever
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-PPTP

[poptop-beta]
name=PoPToP beta repository for Red Hat Enterprise Linux $releasever ($basearch)
#baseurl=http://poptop.sourceforge.net/yum/beta/rhel$releasever/$basearch
mirrorlist=http://poptop.sourceforge.net/yum/beta/mirrorlist-poptop-beta-rhel$releasever
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-PPTP





