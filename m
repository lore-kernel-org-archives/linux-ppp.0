From: James Carlson <carlsonj@workingcode.com>
Date: Mon, 10 Mar 2014 14:01:08 +0000
Subject: Re: PPPD plugin development
Message-Id: <531DC5A4.5050608@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <531BEBF2.3020508@gmail.com>
In-Reply-To: <531BEBF2.3020508@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 03/10/14 08:31, Greg wrote:
> as stated before, I'm trying to write a plugin to authenticate against
> an external script. So far, I've only managed to get it to write a bit
> information to a log file on the server.

It would help if you could provide details -- the code you're using, the
debug log messages, the configuration options in use, and any other
information related to your system.

At this point, I'm not even really sure whether you're attempting to
write authenticator or authenticatee code.  The two are different.
Details on the problem to be solved would help -- "authenticate against
an external script" is a chosen solution to some issue, not a problem
statement.

> I'm trying to use the digest->code to determine the type of digest used.
> I figured that if I can find out which type it's using then I could then
> move forward with converting it or determining how to store the
> encrypted password to do a comparison.

digest->code will have the PPP code number for the digest type, which
will be CHAP_MD5 (0x05), CHAP_MICROSOFT (0x80), or CHAP_MICROSOFT_V2 (0x81).

You can see all of the registered chap_digest_type objects by grepping
the code for chap_register_digest.

I don't believe it can end up being anything else, given the current design.

> I've also made it return 1 so that no matter what I enter, it should
> show authenticated.
> 
> digest->code writes as blank.

"writes"?

> When using it as a switch->case scenario, it goes to default:
> switch (digest->code) {
>         case CHAP_MICROSOFT:
>         {
>           codemess = "MIC";
>         }
>         case CHAP_MICROSOFT_V2:
>         {
>           codemess = "MV2";
>         }
>         default:
>           codemess = "Default";
> }

At a guess, that should mean that digest->code is CHAP_MD5, though I'm
really not sure without more information.  A debug trace would likely
show more, as would a copy of your code.

> The return 1 appears to work, but then I get the message:
> MPPE required, but keys are not available.  Possible plugin problem?

If you return 1 when MS-CHAP is enabled, then you're required to set up
keys and set the mppe_keys_set flag.  It's a bit ugly, but MPPE and
MS-CHAP are deeply intertwined.

> I REALLY wish this was a documented better. Though I code in other
> scripting languages, C is not something I'm used to coding. So please
> feel free to give me a hard time, I'm muddling my way through C just to
> get the basics right.

The plug-in interface just is not designed for use by someone without a
deep understanding of the existing code and a healthy amount of C
experience.  I somewhat doubt that a plug-in shared library type
interface, regardless of the depth of the documentation, could get
around that.

Normally, when folks want to do external authentication, they do it with
RADIUS or some other AAA protocol like that.  It might help to know what
problem you're trying to solve.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
