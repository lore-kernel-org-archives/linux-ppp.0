From: "Javier Govea" <jgovea@magma.ca>
Date: Wed, 03 Mar 2004 17:14:55 +0000
Subject: Writing a dialer
Message-Id: <200403031714.i23HEtJN021770@webmail2.magma.ca>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello to all,

I'm writing my own dialer in C++, similar to KPPP but with support for several
simultaneous ppp links. My dialer will use pppd to setup the ppp links. And I would like
to use the chat program, the one that comes with the ppp-2.4.1 distribution, to send to
the modem all the AT commands needed. I don't want to write my own 'chat' program if it is
not necessary. 

A requirement for my program is that I must have control over the pppd's so that i can
kill them or restart them. One form of getting that control, within my C++ program, is by
getting the pid's, but i'm open to other suggestions.

How can I call pppd and chat from C++ to setup my ppp links?? and at the same time to have
control over the pppd processes?? Is this possible??? or I defenitely have to write my own
'chat' program??? 

I already tried two things from my C++ code, the first one:

system ("/usr/sbin/pppd /dev/input/ttyACM0 call my-script user user1")

With this system call, pppd is using my-script, which in turn is calling the chat program
with the command 'connect' (my-script is pasted below). This system call does work
properly. But I do not have control in my C++ program over the pppd, ie. I can't kill it
or know its status.

The second thing I tried is this: 

char *args[] = {"/dev/input/ttyACM0\0", "call\0", "my-script\0", "user\0", "user1", NULL};
pid = execv("/usr/sbin/pppd", args);

execv returns the pid and gives me more control over the pppd. execv starts the pppd but
the chat program does not run properly. It seems that the chat program is started as an
independent process and not as child of the pppd (which is the way i think it should run). 

Is it possible to call pppd and chat and to get the pppd's pid from a C or C++ program? if
so, how can i do that???? 

Any help is very much appreaciated,
Thank you in advance
X

my-script 
====230400
mtu 576
mru 576
modem
lock
crtscts
defaultroute
lcp-echo-failure 0
lcp-echo-interval 0
novj
persist
connect '/usr/sbin/chat -v -f /etc/ppp/chat-script'
========end of my-script

