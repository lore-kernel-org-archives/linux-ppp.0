From: tatel@euskalnet.net
Date: Sun, 07 Mar 2004 14:09:26 +0000
Subject: active-filter
Message-Id: <3d9ff3e0e9.3e0e93d9ff@euskalnet.net>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi, 

I'm trying to set an active-filter expression for on-demand, but I'm
really stuck with. I can't get effective help from neither from
documentation neither from user mailing lists.

Problem is people scanning (mostly) netBIOS ports. These packets (I
think) are holding the link up by resetting idle-timeout to zero.

I'm using woody with ppp 2.4.1 from debs and compiled kernel with
filtering option enabled

If I set something like "active-filter 'inbound port 135'" I get a parse
error message. This stucks me since man tcpdump says inbound is for ppp
connections.

If I set something like "active-filter 'dst port 135'" there is no parse
error message, but modem dials nothing

Does anybody know an appropiate active-filter expression?

Thanks a lot

Roman





