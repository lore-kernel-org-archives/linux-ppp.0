From: Guy Rouillier <guy-rouillier@speakeasy.net>
Date: Thu, 10 Jun 2004 04:13:25 +0000
Subject: Re: 2.4.2 on AMD64 Linux: assumes 4-byte long - FIXED!
Message-Id: <20040610001325.338bbc8d@localhost>
List-Id: <linux-ppp.vger.kernel.org>
References: <20040606021936.14c69b54@localhost>
In-Reply-To: <20040606021936.14c69b54@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Wed, 9 Jun 2004 16:24:08 +1000
James Cameron <james.cameron@hp.com> wrote:

> You're right.
> 
> The patches to the PPP maintainers, chuck 'em at the mailing list, and
> ask for a response.  If that fails, and it has to do with MPPE, send
> it to Frank Cusack <fcusack@fcusack.com>.
> 
> The kernel, if it has to do with the PPP modules, again, chuck 'em at
> the linux-ppp mailing list.  Paul Mackerras is ultimately responsible
> to promote them to the kernel team.  Or you could explain it very
> carefully and try the LKML (Linux Kernel Mailing List).

James, thank you for the detailed reply.  I mentioned this is my first
fix to the kernel, right?  So I won't be to embarrassed to admit that
I'm a little confused about the kernel part.  The fix I made definitely
worked.   But I took the time to download the stock kernel from
kernel.org, and none of the files I changed are in there!  I looked at
both the 2.6.3 and 2.6.6 versions.  The version I'm working with is
Mandrake 2.6.3-9.  The files I changed are drivers/net/sha1.c and
/drivers/net/sha1.h.  In the Mandrake kernel source, /drivers/net also
has some files related to mppe: ppp_mppe_compress.c and ppp_mppe.mod.c. 
The stock kernels from kernel.org don't have any of these four files!

Does that mean these files were added by Mandrake, and I should file a
bug report with them instead of ppp-linux?  I'm surprised to learn that
mppe is not supported by the stock kernel.  Appreciate your guiding a
newbie through this process.

> 
> http://www.tldp.org/HOWTO/Software-Release-Practice-HOWTO/patching.html
> has some good hints to help your patch be accepted.
> 
> I'm just an interested bystander.  ;-)
> 
> -- 
> James Cameron                         http://quozl.netrek.org/
> HP Open Source, Volunteer             http://opensource.hp.com/
> PPTP Client Project, Release Engineer
> http://pptpclient.sourceforge.net/


-- 
Guy Rouillier
