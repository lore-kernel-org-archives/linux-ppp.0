From: Paul Mackerras <paulus@samba.org>
Date: Sun, 07 Sep 2008 06:40:06 +0000
Subject: ppp-2.4.5 release imminent
Message-Id: <18627.30534.621185.729775@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I'm planning to release ppp-2.4.5 shortly.  What is in the release
will be what is in the master branch of the ppp git repository at

git://ozlabs.org/~paulus/ppp.git

(except I'll leave out the .gitignore files).

The changes are mostly bugfixes.  The new features are the ability to
operate without an IP address for the peer under Linux, and the
pppol2tp plugin.

Now would be a good time to try it out and let me know about any bugs.

Paul.
