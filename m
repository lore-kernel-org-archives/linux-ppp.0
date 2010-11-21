From: Marcelo Pacheco <marcelo@m2j.com.br>
Date: Sun, 21 Nov 2010 18:51:51 +0000
Subject: Using pppd with a generic hdlc sync device
Message-Id: <4CE96A47.60303@m2j.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------080209070304010607040703"
List-Id: <linux-ppp.vger.kernel.org>
To: linux-ppp@vger.kernel.org

This is a multi-part message in MIME format.
--------------080209070304010607040703
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Howdy !

Generic HDLC works great for the HDLC and Frame Relay protocols. But not
so great for PPP. 95% of the ppp protocol options are not implemented
with ppp for Generic HDLC (syncppp.ko). It's not compliant with the RFCs.

Since I really wanted to use deflate compression on a customer site
(128kbps p2p v.35 metro link), I wrote ppphdlc.

I'm submitting this for inclusion on pppd. It's linux specific.
Its in production with pppd 2.4.5 + linux-2.6.27 (OpenSuSE 11.1),
pc300too driver and Cyclades PC300 single V35 PCI on both ends.

All the necessary details is explained at the beginning of the source.
If you know pppd and know generic hdlc, setting up is simple. Just read
the comments on the source.

@ 128kbps with deflate compression, ping -l100 -f -s512 => 510 packets
per second each way, and I see 95% idle CPU on a:
vendor_id       : AuthenticAMD
cpu family      : 15
model           : 75
model name      : AMD Athlon(tm) 64 X2 Dual Core Processor 4200+
stepping        : 2
cpu MHz         : 1000.000
cache size      : 512 KB

So it should be able to run a couple full E1 or full T1 with deflate
compression on a new low end AMD or Intel CPU.

To ensure that the code sends proper sync ppp frames, I tested with
generic HDLC syncppp on one end and pppd+ppphdlc on the other end. It
works with the proper pppd parameters (by default pppd wants an IPCP
address exchange, while syncppp nor sends not accepts IPCP messages). I
wish I could test it with a commercial v.35 internet link (with
traditional Cisco & company router on the other end). Test results to
that end would be interesting.

There's two features/bugs:
1 - No handling of hdlcX:Y devices, only hdlcX devices. Should be
trivial to add.
2 - It completely ignores DCD, DTR, ... signals. I've had a few carrier
drops on my customer's link since initial production deployment, as soon
as the carrier came back, pppd restarted the connection as configured
anyway.

Since userland APIs seldom change, this code could be still valid with
no source changes until V.35/X.21 interfaces are completely gone for
data usage. Searching this list shows that prior attempts of providing a
similar solution with a native pppd driver have been abandoned due to
API changes and little interest...

Regards,

Marcelo Pacheco

--------------080209070304010607040703
Content-Type: text/x-c++src;
 name="ppphdlc.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ppphdlc.c"

/*
 * ppphdlc.c
 *
 * Allows linux pppd to run on top of generic hdlc sync interfaces
 * Requirements: hdlcX needs to be down before calling ppphdlc (ifconfig hdlcX down)
 * Design principle is maximum simplicity, don't duplicate any functionality
 *  already available with pppd and use as little as possible from sync card as well,
 * just plain framing
 *
 * Bare bones example, assume interface is hdlc0:
 *   modprobe pc300too # That's for a Cyclades PC300
 *   modprobe hdlc_raw # That's for plain HDLC protocol
 *   pppd receive-all pty "ifconfig hdlc0 down; exec ppphdlc hdlc0"
 *
 * receive-all is a must, otherwise pppd will discard all incoming frames and won't connect
 * Sync interfaces are always binary transparent !
 *
 * All compression, encryption, authentication, routing, scripting, multilink and multiprotocol
 *   features of pppd should work just fine. I'm using ipv4 with deflate compression in production, and it works perfectly
 *
 * ppphdlc will automatically set the sync interface to hdlc protocol, default line coding (typically nrz), no-crc
 *    CRC generation/checking is done in pppd
 * It doesn't use any ppp features of generic HDLC, *all* ppp processing happens on pppd
 *
 * This code is linux specific, uses epoll (requires linux 2.6.x), it looks like generic hdlc is linux specific anyhow
 *
 * Forget about the sync option of pppd, it will cause framing errors under load
 * Anyways, this code won't work at all with pppd sync option !
 *
 * Sugest compiling with -Os, since modern processors are cache bound anyways
 *  gcc -o ppphdlc -Os ppphdlc.c
 *
 * This tool is in production. It works. But use at your own risk.
 *
 * Copyright (C) 2010 Marcelo Pacheco <marcelo@m2j.com.br>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 */

#include <errno.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>
#include <netinet/in.h>
#include <netpacket/packet.h>
#include <sys/ioctl.h>
#include <sys/time.h>
#include <linux/if_ether.h>
#include <linux/hdlc.h>
#include <linux/if.h>
#include <linux/sockios.h>
#include <pty.h>
#include <sys/epoll.h>

/*
typedef unsigned short u16;
typedef unsigned char u8;
u16 const crc_ccitt_table[256] = {
        0x0000, 0x1189, 0x2312, 0x329b, 0x4624, 0x57ad, 0x6536, 0x74bf,
        0x8c48, 0x9dc1, 0xaf5a, 0xbed3, 0xca6c, 0xdbe5, 0xe97e, 0xf8f7,
        0x1081, 0x0108, 0x3393, 0x221a, 0x56a5, 0x472c, 0x75b7, 0x643e,
        0x9cc9, 0x8d40, 0xbfdb, 0xae52, 0xdaed, 0xcb64, 0xf9ff, 0xe876,
        0x2102, 0x308b, 0x0210, 0x1399, 0x6726, 0x76af, 0x4434, 0x55bd,
        0xad4a, 0xbcc3, 0x8e58, 0x9fd1, 0xeb6e, 0xfae7, 0xc87c, 0xd9f5,
        0x3183, 0x200a, 0x1291, 0x0318, 0x77a7, 0x662e, 0x54b5, 0x453c,
        0xbdcb, 0xac42, 0x9ed9, 0x8f50, 0xfbef, 0xea66, 0xd8fd, 0xc974,
        0x4204, 0x538d, 0x6116, 0x709f, 0x0420, 0x15a9, 0x2732, 0x36bb,
        0xce4c, 0xdfc5, 0xed5e, 0xfcd7, 0x8868, 0x99e1, 0xab7a, 0xbaf3,
        0x5285, 0x430c, 0x7197, 0x601e, 0x14a1, 0x0528, 0x37b3, 0x263a,
        0xdecd, 0xcf44, 0xfddf, 0xec56, 0x98e9, 0x8960, 0xbbfb, 0xaa72,
        0x6306, 0x728f, 0x4014, 0x519d, 0x2522, 0x34ab, 0x0630, 0x17b9,
        0xef4e, 0xfec7, 0xcc5c, 0xddd5, 0xa96a, 0xb8e3, 0x8a78, 0x9bf1,
        0x7387, 0x620e, 0x5095, 0x411c, 0x35a3, 0x242a, 0x16b1, 0x0738,
        0xffcf, 0xee46, 0xdcdd, 0xcd54, 0xb9eb, 0xa862, 0x9af9, 0x8b70,
        0x8408, 0x9581, 0xa71a, 0xb693, 0xc22c, 0xd3a5, 0xe13e, 0xf0b7,
        0x0840, 0x19c9, 0x2b52, 0x3adb, 0x4e64, 0x5fed, 0x6d76, 0x7cff,
        0x9489, 0x8500, 0xb79b, 0xa612, 0xd2ad, 0xc324, 0xf1bf, 0xe036,
        0x18c1, 0x0948, 0x3bd3, 0x2a5a, 0x5ee5, 0x4f6c, 0x7df7, 0x6c7e,
        0xa50a, 0xb483, 0x8618, 0x9791, 0xe32e, 0xf2a7, 0xc03c, 0xd1b5,
        0x2942, 0x38cb, 0x0a50, 0x1bd9, 0x6f66, 0x7eef, 0x4c74, 0x5dfd,
        0xb58b, 0xa402, 0x9699, 0x8710, 0xf3af, 0xe226, 0xd0bd, 0xc134,
        0x39c3, 0x284a, 0x1ad1, 0x0b58, 0x7fe7, 0x6e6e, 0x5cf5, 0x4d7c,
        0xc60c, 0xd785, 0xe51e, 0xf497, 0x8028, 0x91a1, 0xa33a, 0xb2b3,
        0x4a44, 0x5bcd, 0x6956, 0x78df, 0x0c60, 0x1de9, 0x2f72, 0x3efb,
        0xd68d, 0xc704, 0xf59f, 0xe416, 0x90a9, 0x8120, 0xb3bb, 0xa232,
        0x5ac5, 0x4b4c, 0x79d7, 0x685e, 0x1ce1, 0x0d68, 0x3ff3, 0x2e7a,
        0xe70e, 0xf687, 0xc41c, 0xd595, 0xa12a, 0xb0a3, 0x8238, 0x93b1,
        0x6b46, 0x7acf, 0x4854, 0x59dd, 0x2d62, 0x3ceb, 0x0e70, 0x1ff9,
        0xf78f, 0xe606, 0xd49d, 0xc514, 0xb1ab, 0xa022, 0x92b9, 0x8330,
        0x7bc7, 0x6a4e, 0x58d5, 0x495c, 0x3de3, 0x2c6a, 0x1ef1, 0x0f78
};
#define PPP_INITFCS     0xffff  // Initial FCS value
#define PPP_GOODFCS     0xf0b8  // Good final FCS value

static inline u16 PPP_FCS(u16 crc, const u8 c)
{	return (crc >> 8) ^ crc_ccitt_table[(crc ^ c) & 0xff];
}
*/

#define PPP_FLAG 0x7e
#define PPP_ESCAPE 0x7d
/* PPP_ESPACE is followed by the original character XOR 0x20 */
#define CTRL_XOR 0x20


int sock;

int startup(int argc, char *argv[])
{	struct ifreq ifr;
	int if_sock;
	struct sockaddr_ll addr;
	raw_hdlc_proto raw;

	if (argc != 2)
	{	dprintf(2, "Syntax: ppphdlc hdlcX\n"
                           " Copyright Marcelo Pacheco - marcelo@m2j.com.br - 2010\n");
		return (1);
	}

	strcpy(ifr.ifr_name, argv[1]);

	if ((if_sock = socket(PF_INET, SOCK_DGRAM, IPPROTO_IP)) < 0)
	{	dprintf(2, "socket: %d", errno);
		return (2);
	}

	memset(&raw, 0, sizeof(raw));
	raw.encoding = ENCODING_DEFAULT;
// Use no CRC at the driver level, we pass CRCs from pppd through
	raw.parity = PARITY_NONE;
	ifr.ifr_settings.type = IF_PROTO_HDLC;
	ifr.ifr_settings.ifs_ifsu.raw_hdlc = &raw;
	ifr.ifr_settings.size = sizeof(raw);

	if (ioctl(if_sock, SIOCWANDEV, &ifr))
	{	dprintf(2, "ioctl %d\n", errno);
		return (3);
	}

	if (ioctl(if_sock, SIOCGIFFLAGS, &ifr))
	{	dprintf(2, "ioctl SIOCGIFFLAGS %d\n", errno);
		return (4);
	}

	ifr.ifr_flags |= (IFF_UP | IFF_RUNNING);
	if (ioctl(if_sock, SIOCSIFFLAGS, &ifr))
	{	dprintf(2, "ioctl SIOCSIFFLAGS %d\n", errno);
		return (5);
	}

	if (ioctl(if_sock, SIOCGIFINDEX, &ifr))
	{	dprintf(2, "ioctl SIOCGIFINDEX %d\n", errno);
		return (6);
	}

	memset(&addr, 0, sizeof(addr));
	addr.sll_family = AF_PACKET;
	addr.sll_protocol = htons(ETH_P_ALL);
	addr.sll_ifindex = ifr.ifr_ifindex;
	if ((sock = socket(PF_PACKET, SOCK_RAW, htons(ETH_P_ALL))) < 0 ||
	    bind(sock, (struct sockaddr*)&addr, sizeof(addr)) < 0)
	{	dprintf(2, "socket/bind %d\n", errno);
		return(7);
	}

	return 0;
}


#define PUT_BYTE(p) if ((p) == PPP_FLAG || (p) == PPP_ESCAPE) *p1++ = PPP_ESCAPE, *p1++ = (p) ^ CTRL_XOR; else *p1++ = (p);

static inline int sync2async()
{	int ret /*, fcs */;
	char *p,  // Input pointer
	     *p1, // Output pointer
	     *p2, // p2 = The end of the input message and beginning of the output message
	     buf[4096]; // Once packet received, uses the rest of the buffer for output (escaped) message
/* We get exactly one PPP packet per hdlc message */
	if ((ret = read(sock, buf, sizeof(buf))) > 0)
	{	//fcs = PPP_INITFCS;
		p = buf;
		p2 = p1 = buf + ret;
	while (p < p2)
		{	PUT_BYTE(*p);
		//	fcs = PPP_FCS(fcs, *p);
			p++;
		}
/*		fcs = ~fcs;
		ret = fcs & 0xff;
		PUT_BYTE(ret);
		ret = (fcs >> 8) & 0xff;
		PUT_BYTE(ret); */
		*p1++ = PPP_FLAG;
		if ((ret = write(1, p2, p1 - p2)) != p1 - p2)
		{	dprintf(2, "write 1 sz: %d ret: %d errno: %d\n", p2 - p1, ret, errno); return 0;
		}
		return 1;
	} else
		return 0;
}


int main(int argc, char *argv[])
{
	int ret, epfd;
	struct epoll_event ev;
	char buf[4096], // Receive buffer
        buf1[1530], // Store the un-escaped de-flagged message to be sent here
        *p,  // Processing pointer into buf
        *p1, // Receive pointer
        *p2; // Processing pointer into buf1

	ret = startup(argc, argv);
	if (ret) return ret;

	if ( (epfd = epoll_create(3)) < 0 ) return 0x20;
	ev.events = EPOLLIN | EPOLLERR | EPOLLHUP;
	ev.data.fd = sock;
	epoll_ctl(epfd, EPOLL_CTL_ADD, sock, &ev);
	ev.events = EPOLLIN | EPOLLERR | EPOLLHUP;
	ev.data.fd = 0;
	epoll_ctl(epfd, EPOLL_CTL_ADD, 0, &ev);

	p1 = p = buf, p2 = buf1;

	while (1)
	{	if (epoll_wait(epfd, &ev, 1, -1) <= 0)
			continue;
		else if (ev.data.fd == sock)
		{	if (ev.events & EPOLLHUP) return 0x10;
			if (ev.events & EPOLLERR) dprintf(2, "hdlcX err\n");
			if (ev.events & EPOLLIN)
				if (!sync2async()) return 0x11;
		} else if (ev.data.fd == 0)
		{	if (ev.events & EPOLLHUP) return 0xf;
			if (ev.events & EPOLLERR) dprintf(2, "0 err\n");
			if (ev.events & EPOLLIN)
				if ( (ret = read(0, p1, buf + sizeof(buf) - p1)) > 0 )
				{	p1 += ret;
					while (p < p1)
						switch (*p)
						{	case PPP_FLAG:
								p++;
								if (p2 > buf1 && // Only forward non empty packets
									 (ret = write(sock, buf1, p2 - buf1)) != p2 - buf1)
								{	if (errno != ENOBUFS) // ENOBUFS=lost packet, can happen, ignore, otherwise bomb out
									{	dprintf(2, "write hdlcX sz: %d ret: %d errno: %d\n", p2 - buf1, ret, errno);
										return 0x10;
									}
//									usleep(100000); // Sleep 100msec, then try again, just enough to send 800 bytes @ 64kbps
								}
								p2 = buf1;
								break;
							case PPP_ESCAPE:
								if (p1 - p == 1) // The escaped character isn't in the receive buffer yet
								{	*buf = *p; // The receive buffer has only one char, move that to the beginning
									p = p1 = buf;
									p1++; // Advance the read pointer by that one character, the ESCAPE character
									goto read_more; // Need more stuff in the receive buffer before continuing
								}
								p++, *p2++ = *p++ ^ CTRL_XOR; // Skip the ESCAPE
								break;
							default: *p2++ = *p++; // Any other char, just copy it
						}
					p1 = p = buf; // Receive buffer empty, point to the beginning
					read_more: ;
				} else
				{	dprintf(2, "read 0 err: %d errno: %d\n", ret, errno);
					return 0xf;
				}
		}
	}
	return 0xe;
}

--------------080209070304010607040703--
