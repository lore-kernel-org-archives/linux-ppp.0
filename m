From: "Theodore Y. Ts'o" <tytso@mit.edu>
Date: Sat, 25 Jan 2020 03:46:22 +0000
Subject: Re: [PATCH] Documentation: changes.rst: update several outdated project URLs
Message-Id: <20200125034622.GA1107489@mit.edu>
List-Id: <linux-ppp.vger.kernel.org>
References: <efb1f518-9e66-c472-d124-4b7d91e56639@infradead.org>
In-Reply-To: <efb1f518-9e66-c472-d124-4b7d91e56639@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Randy Dunlap <rdunlap@infradead.org>
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Jan Kara <jack@suse.com>, Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, Pablo Neira Ayuso <pablo@netfilter.org>, Jozsef Kadlecsik <kadlec@netfilter.org>, Florian Westphal <fw@strlen.de>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, Paul Mackerras <paulus@samba.org>, linux-ppp@vger.kernel.org, reiserfs-devel@vger.kernel.org, "Darrick J . Wong" <darrick.wong@oracle.com>, linux-xfs <linux-xfs@vger.kernel.org>

On Thu, Jan 23, 2020 at 11:00:12AM -0800, Randy Dunlap wrote:
>  ---------
>  
>  - <http://prdownloads.sourceforge.net/e2fsprogs/e2fsprogs-1.29.tar.gz>
> +- <https://www.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/>
> +- <https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/>

You might as well deleted the URL for e2fsprogs-1.29.tar.gz while
you're at it.  That version is *old*.  I do actually still upload
e2fsprogs releases to

	https://sourceforge.net/projects/e2fsprogs/files/e2fsprogs/

... but I think just listing the www.kernel.org URL is quite
sufficient.

Other than that,

Acked-by: Theodore Ts'o <tytso@mit.edu>

						- Ted
