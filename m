From: "Theodore Y. Ts'o" <tytso@mit.edu>
Date: Sat, 25 Jan 2020 17:08:39 +0000
Subject: Re: [PATCH] Documentation: changes.rst: update several outdated project URLs
Message-Id: <20200125170839.GM1108497@mit.edu>
List-Id: <linux-ppp.vger.kernel.org>
References: <efb1f518-9e66-c472-d124-4b7d91e56639@infradead.org>
 <20200125034622.GA1107489@mit.edu>
 <c91c1ae1-7eb6-e6fd-57e3-aa8e8f356d45@infradead.org>
In-Reply-To: <c91c1ae1-7eb6-e6fd-57e3-aa8e8f356d45@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Randy Dunlap <rdunlap@infradead.org>
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Jan Kara <jack@suse.com>, Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, Pablo Neira Ayuso <pablo@netfilter.org>, Jozsef Kadlecsik <kadlec@netfilter.org>, Florian Westphal <fw@strlen.de>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, Paul Mackerras <paulus@samba.org>, linux-ppp@vger.kernel.org, reiserfs-devel@vger.kernel.org, "Darrick J . Wong" <darrick.wong@oracle.com>, linux-xfs <linux-xfs@vger.kernel.org>

On Fri, Jan 24, 2020 at 08:03:03PM -0800, Randy Dunlap wrote:
> 
> So drop the git URL also?

Let's keep the git URL; sorry I wasn't precise in my previous message.
I was referring to where the tarballs could be downloaded.

      		   	     	      - Ted

P.S. I guess I should mention that there is one reason why some folks
might still want to download from sourceforge; if they want the
tarball signed by me, that's the only place you can get it.  For
$REASONS, the .gpg file on kernel.org is signed by the kernel.org
automation, and of course the git tree has tags signed for me.  But
for folks who want the tarball signed by me --- Debian and its
derivatives want that, for example --- they need to go to sourceforge.
I dunno if the RPM-based distributions still care about gpg signed
tarballs.  I'm guessing though that the people who care know where to
find it.
