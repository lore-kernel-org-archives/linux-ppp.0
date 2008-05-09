From: James Carlson <carlsonj@workingcode.com>
Date: Fri, 09 May 2008 16:26:26 +0000
Subject: Re: about the sock_fd
Message-Id: <18468.31538.265676.188753@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <200805100016027033698@gmail.com>
In-Reply-To: <200805100016027033698@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

C.J writes:
> In the pppd code, I read that it used sock_fd to set ip addr on a interface(ppp0). I want to know whether this sock_fd is a common udp socket or not. Do we  need some extra operations on this socket. Like unit_fd or dev_fd which both of them need ioctl on them.

Does this help?

% grep 'sock_fd = ' *.c
sys-linux.c:static int sock_fd = -1;    /* socket for doing interface ioctls */
sys-linux.c:    sock_fd = socket(AF_INET, SOCK_DGRAM, 0);
sys-linux.c:    sock_fd = socket(AF_INET, SOCK_DGRAM, 0);
% 

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
