From: Christopher Fowler <cfowler@outpostsentinel.com>
Date: Wed, 09 Mar 2005 21:25:21 +0000
Subject: Outbound modem pooling
Message-Id: <1110403520.18073.323.camel@linux.linxdev.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello,

We recently added a feature to pppd-2.4.2 to allow outbound modem
pooling.  We are primarily running our pppd in demand mode and on our
server we use an internal 4 or 8 port Comtrol RocketModem.  Since we
could have anywhere from 1 to 100 pppd processes running on the server
in demand mode we needed a way for those processes to use the first
available modem instead of forcing them to only use one modem or
dividing them up among modems.  As you know pppd in demand mode requires
a port name and when the actual dialup occurs that modem could be in use
by another pppd process.  Since we modified the code we want to release
it in hopes that it is good enough to go into the mainstream code for
other people that need the same feature.  I can create a patch file
against the 2.4.2 source and send it to someone who can do with it
whatever they want.

Below is the README.pool file.

--- Cut Here ---
This pppd has been modified to accept a comma separated list
of devices instead of just a single device. This is mostly
used for dial-out connections, either on-demand or immediately
at program execution. It will skid through the list of devices
until it finds one that is not locked.
                                                                                                                                                                                   
There are some trade-offs:
                                                                                                                                                                                   
1. per tty scripts are no longer supported (/etc/ppp/options.<tty>)
   since they are executed when the command line is parsed, not
   when the tty is opened.
                                                                                                                                                                                   
2. all ports share the same baud rate.
                                                                                                                                                                                   
3. this source tree is patched to build under FC2 (and later.)
                                                                                                                                                                                   
None of these caveats matter much to me.
                                                                                                                                                                                   
Implementation
=======
tty.c has been copied to tty-pool.c, which has been modified;
as opposed to intrusive #ifdefs of tty.c.
--- Cut Here ---

The code works and our testing has shown positive.  More eyes on the
code is even better.

Thanks,
Chris Fowler


