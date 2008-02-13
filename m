From: md@Linux.IT (Marco d'Itri)
Date: Wed, 13 Feb 2008 22:04:34 +0000
Subject: Re: if-up et al script relocation
Message-Id: <20080213220434.GB18611@bongo.bofh.it>
List-Id: <linux-ppp.vger.kernel.org>
References: <15468731.post@talk.nabble.com>
In-Reply-To: <15468731.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Feb 13, bfc <chappaquasuite@yahoo.com> wrote:

> Is it possible to relocat the if-up, if-down, auth-up... scripts to somewhere
> other than
> /etc/ppp.  We'd like to use our custom scripts for our app w/o interfering
> with any
> customer use of PPP.
Debian has a patch which does this for some of the files, it should be
made more general and submitted for inclusion.

-- 
ciao,
Marco
