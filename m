From: Randy Dunlap <rdunlap@infradead.org>
Date: Thu, 23 Jan 2020 23:54:09 +0000
Subject: Re: [PATCH] Documentation: changes.rst: update several outdated project URLs
Message-Id: <792339b0-5fa1-4347-11e2-2620f498856c@infradead.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <efb1f518-9e66-c472-d124-4b7d91e56639@infradead.org>
 <20200123195531.GW8247@magnolia>
In-Reply-To: <20200123195531.GW8247@magnolia>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Jan Kara <jack@suse.com>, Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, Pablo Neira Ayuso <pablo@netfilter.org>, Jozsef Kadlecsik <kadlec@netfilter.org>, Florian Westphal <fw@strlen.de>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, Paul Mackerras <paulus@samba.org>, linux-ppp@vger.kernel.org, reiserfs-devel@vger.kernel.org, linux-xfs <linux-xfs@vger.kernel.org>

On 1/23/20 11:55 AM, Darrick J. Wong wrote:
> On Thu, Jan 23, 2020 at 11:00:12AM -0800, Randy Dunlap wrote:
>> From: Randy Dunlap <rdunlap@infradead.org>
>>
>> Update projects URLs in the changes.rst file.
>>
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Jonathan Corbet <corbet@lwn.net>
>> Cc: linux-doc@vger.kernel.org
>> Cc: Jan Kara <jack@suse.com>
>> Cc: "Theodore Ts'o" <tytso@mit.edu>
>> Cc: Andreas Dilger <adilger.kernel@dilger.ca>
>> Cc: linux-ext4@vger.kernel.org
>> Cc: Pablo Neira Ayuso <pablo@netfilter.org>
>> Cc: Jozsef Kadlecsik <kadlec@netfilter.org>
>> Cc: Florian Westphal <fw@strlen.de>
>> Cc: netfilter-devel@vger.kernel.org
>> Cc: coreteam@netfilter.org
>> Cc: Paul Mackerras <paulus@samba.org>
>> Cc: linux-ppp@vger.kernel.org
>> Cc: Jan Kara <jack@suse.com>
>> Cc: reiserfs-devel@vger.kernel.org
>> Cc: Darrick J. Wong <darrick.wong@oracle.com>
>> Cc: linux-xfs@vger.kernel.org
>> ---
>>
>>  Documentation/process/changes.rst                    |   12 ++++++----
>>  Documentation/translations/it_IT/process/changes.rst |   12 ++++++----
>>  2 files changed, 16 insertions(+), 8 deletions(-)
>>
>> diff -Naurp linux-next-20200123/Documentation/translations/it_IT/process/changes.rst%WWW linux-next-20200123/Documentation/translations/it_IT/process/changes.rst
>> --- linux-next-20200123/Documentation/translations/it_IT/process/changes.rst%WWW	2019-11-24 16:32:01.000000000 -0800
>> +++ linux-next-20200123/Documentation/translations/it_IT/process/changes.rst	2020-01-23 10:47:56.226457425 -0800
>> @@ -391,6 +391,8 @@ E2fsprogs
>>  ---------
>>  
>>  - <http://prdownloads.sourceforge.net/e2fsprogs/e2fsprogs-1.29.tar.gz>
>> +- <https://www.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/>
>> +- <https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/>
>>  
>>  JFSutils
>>  --------
>> @@ -400,12 +402,12 @@ JFSutils
>>  Reiserfsprogs
>>  -------------
>>  
>> -- <http://www.kernel.org/pub/linux/utils/fs/reiserfs/>
>> +- <https://git.kernel.org/pub/scm/linux/kernel/git/jeffm/reiserfsprogs.git/>
>>  
>>  Xfsprogs
>>  --------
>>  
>> -- <ftp://oss.sgi.com/projects/xfs/>
>> +- <https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git>
> 
> Can we add a link to the release tarballs too?
> 
> https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/
> 
> With that amended,
> Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>
> 
> --D

Sure, I added that link.
I'll wait a bit for other comments before posting v2.

thanks.
-- 
~Randy
