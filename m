From: "cyx_mail@foxmail.com" <cyx_mail@foxmail.com>
Date: Tue, 06 May 2008 03:49:29 +0000
Subject: about generic_establish_ppp()
Message-Id: <200805061149289843689@foxmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

in generic_establish_ppp():

ioctl(fd, PPPIOCATTCHAN, &chindex)

1.fd, is the parameter fd a channel's file descriptor or the file descriptor for "/dev/ppp0"?

2.chindex, is this a output parameter or input parameter? what is meaning?

I'm coufused about this function

2008-05-06 


