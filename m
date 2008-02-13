From: "Eugene Paskevich" <eugene@raptor.kiev.ua>
Date: Wed, 13 Feb 2008 22:19:42 +0000
Subject: Re: if-up et al script relocation
Message-Id: <op.t6hhm4jc2m4sxy@kite.raptor.kiev.ua>
List-Id: <linux-ppp.vger.kernel.org>
References: <15468731.post@talk.nabble.com>
In-Reply-To: <15468731.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Wed, 13 Feb 2008 23:46:28 +0200, bfc <chappaquasuite@yahoo.com> wrote:

> If that's not possible, is it possible to have some variant of if-up and
> friends for only particular
> ttyname -- the Doc shows an alternate options file for a particular  
> ttyname,
> but not the rest
> of the stuff.  (OR... if there was a magic option to plant the default
> scripts elsewhere.)

Each of the scripts you mentioned is passed a tty-device as an argument,
which means you can easily put your per-tty logic into a single script.

-- 
Eugene Paskevich             |   *=)-----------   |     Plug me into
eugene@raptor.kiev.ua        |   -----------(=*   |      The Matrix
