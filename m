From: Guy Rouillier <guy-rouillier@speakeasy.net>
Date: Tue, 15 Jun 2004 16:42:06 +0000
Subject: Fw: sha1 linux/mppe fix for 64-bit Linux
Message-Id: <20040615124206.00006526@ma1033>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Multipart=_Tue__15_Jun_2004_12_42_06_-0400_CXcFu=Ht0xevLdnU"
List-Id: <linux-ppp.vger.kernel.org>
To: linux-ppp@vger.kernel.org

This is a multi-part message in MIME format.

--Multipart=_Tue__15_Jun_2004_12_42_06_-0400_CXcFu=Ht0xevLdnU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

This is one of two messages addressing a fix to the sha1 code in PPP to
enable it to work on 64-bit systems.  The fix addressed in the current
message is for the linux/mppe component; the corresponding fix in the
other message is for the pppd component.  Both sets of changes are
required.  Without either I was encountering a segfault.  With only the
pppd changes, I got a kernel panic.  With both sets of changes, I am
able to use pptp with ppp to connect with a Microsoft server.

The major set of changes was to convert long data types to data types
with explicit length.  Basically, I changed longs to 32-bit data values
and unsigned chars to 8-bit values.  I also included a wrapper sha1()
function that I found in later versions of the code by the author, Steve
Reid.

This is my first submittal, so I apologize if I am not submitting this
properly.  I followed the advice I was given and read the submittal
guidelines at gnu.org.  However, after running diff -u against the ppp
component I pulled out of cvs and against my updates, I wasn't able to
run patch successfully against the result.  I asked on the
help.gnu.utils newsgroup but received no reply and I'm going out of town
for the rest of the week.  Because of this, I'm including both the diff
and my modified sources in the attached file.  I will gladly redo this
when I return if there is a better way to do it.

-- 
Guy Rouillier

--Multipart=_Tue__15_Jun_2004_12_42_06_-0400_CXcFu=Ht0xevLdnU
Content-Type: application/octet-stream;
 name="linux.tar.gz"
Content-Disposition: attachment;
 filename="linux.tar.gz"
Content-Transfer-Encoding: base64

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
zAO3AFAAAA==

--Multipart=_Tue__15_Jun_2004_12_42_06_-0400_CXcFu=Ht0xevLdnU--
