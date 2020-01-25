From: Randy Dunlap <rdunlap@infradead.org>
Date: Sat, 25 Jan 2020 04:03:03 +0000
Subject: Re: [PATCH] Documentation: changes.rst: update several outdated project URLs
Message-Id: <c91c1ae1-7eb6-e6fd-57e3-aa8e8f356d45@infradead.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <efb1f518-9e66-c472-d124-4b7d91e56639@infradead.org>
 <20200125034622.GA1107489@mit.edu>
In-Reply-To: <20200125034622.GA1107489@mit.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Theodore Y. Ts'o" <tytso@mit.edu>
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Jan Kara <jack@suse.com>, Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, Pablo Neira Ayuso <pablo@netfilter.org>, Jozsef Kadlecsik <kadlec@netfilter.org>, Florian Westphal <fw@strlen.de>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, Paul Mackerras <paulus@samba.org>, linux-ppp@vger.kernel.org, reiserfs-devel@vger.kernel.org, "Darrick J . Wong" <darrick.wong@oracle.com>, linux-xfs <linux-xfs@vger.kernel.org>

On 1/24/20 7:46 PM, Theodore Y. Ts'o wrote:
> On Thu, Jan 23, 2020 at 11:00:12AM -0800, Randy Dunlap wrote:
>>  ---------
>>  
>>  - <http://prdownloads.sourceforge.net/e2fsprogs/e2fsprogs-1.29.tar.gz>
>> +- <https://www.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/>
>> +- <https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/>
> 
> You might as well deleted the URL for e2fsprogs-1.29.tar.gz while
> you're at it.  That version is *old*.  I do actually still upload

OK, I did that.

> e2fsprogs releases to
> 
> 	https://sourceforge.net/projects/e2fsprogs/files/e2fsprogs/
> 
> ... but I think just listing the www.kernel.org URL is quite
> sufficient.

So drop the git URL also?

-- <http://prdownloads.sourceforge.net/e2fsprogs/e2fsprogs-1.29.tar.gz>
+- <https://www.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/>
+- <https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/>


thanks.
-- 
~Randy
