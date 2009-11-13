From: Mark Ryden <markryde@gmail.com>
Date: Fri, 13 Nov 2009 13:54:37 +0000
Subject: getting the device of the ppp connection
Message-Id: <dac45060911130554u31df1580x13d2c901372567af@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello,
  Is there a way from user space to know which device is the one which
the ppp connection uses ?

What I mean is this: I have eth0 - eth3 on a machine, and a ppp
connection. I want to know by a
short program which device is the one which the ppp connection is
using (I know that usually this can
be deduced by running "ps" for the corresponding ppp daemon, and
inspecting the parameters; for example, with pppoe, I have "-I eth1"
parameter (-I stands for interface). But I want a more general
way which can be used in cases when we cannot get this info).

I tried to get info by an ioctl on ("dev/ppp") thus:

  ...
  ...
  int fd = open("/dev/ppp", O_RDWR);
  int ifunit;
  int res;
  if (fd>0) {
      res = ioctl(fd,PPPIOCATTACH,&ifunit);
		
      if (res=0)
	printf("ifunit=%d\n",ifunit);
  }

and got ifunit=0 when using eth0 ; but I ****also**** got  ifunit=1
when using eth1.
So - is there a way to get the interface from the unit number ? or any other
way to get this info ?

Rgs,
Mark
