From: Paul Mackerras <paulus@samba.org>
Date: Thu, 24 Jul 2008 12:28:47 +0000
Subject: PPP source now in git
Message-Id: <18568.30079.527811.175235@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I finally got sick of using CVS for the PPP source code, so I
converted the repository to a git repository instead.  Thus, if you
want to look at the latest development source code for PPP, you can
either use git clone like this:

git clone git://ozlabs.org/~paulus/ppp.git

and then browse with gitk, git log, etc., and keep it up to date by
doing a git pull every so often.

Or, if you don't want to install git, you can browse the history with
gitweb at

http://git.ozlabs.org/?p=ppp.git;a=summary

Paul.
