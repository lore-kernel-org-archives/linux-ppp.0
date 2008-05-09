From: "C.J" <c.james.cj@gmail.com>
Date: Fri, 09 May 2008 16:16:10 +0000
Subject: about the sock_fd
Message-Id: <200805100016027033698@gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi list,

In the pppd code, I read that it used sock_fd to set ip addr on a interface(ppp0). I want to know whether this sock_fd is a common udp socket or not. Do we  need some extra operations on this socket. Like unit_fd or dev_fd which both of them need ioctl on them.

Thx & Reg

--
cj

