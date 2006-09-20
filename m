From: Christian <crich-ml@beronet.com>
Date: Wed, 20 Sep 2006 08:10:28 +0000
Subject: syncppp
Message-Id: <4510F774.4080104@beronet.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi List,

i'm trying to understand how ppp transports frames in the "sync" mode. I
want to do the following scenario:

pppd sync notty

I've hacked pppd  to use a simple framing method for stdin/stdout, to
guarantee the transport of complete ppp frames. But unfortunately i
found out, that in the tty.c i get mixed up frames from the
master_pty_f, like i read a buffer and in the buffer i get :

[ppp frame 1][part of ppp frame 2]

the next buffer contains then:

[rest of ppp frame 2]


so that is what i transmit to my sync device, but the other side rejects
the second frame because it seems not valid.

I don't really understand yet where pppd reads the frames from the
kernel device, maybe somebody could give me a pointer.

I just want to check if the frames come like that from the kernel or if
it happens because the slave side pty-buffer gets full befor we can read
it on the master side, so the framing is messed up.


Thanks for any help!

Christian

