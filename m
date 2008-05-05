From: James Carlson <carlsonj@workingcode.com>
Date: Mon, 05 May 2008 11:39:09 +0000
Subject: Re: about option_t
Message-Id: <18462.61917.294075.623474@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <200805051534292917103@foxmail.com>
In-Reply-To: <200805051534292917103@foxmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

cyx_mail@foxmail.com writes:
> Which piece of code call the void *addr.

'addr' is a type-dependent value.  It's not necessarily called as a
function -- that only happens if the type is o_special,
o_special_noarg, or o_wild.

> some plugins uses this pointer to call functions when the plugin loads. BTW, what is the exactly meaning of each value of enum opt_type struct? Thanks a lot!

The values should be relatively self-explanatory, if you read the code
in options.c or examine any of the code that uses the options.

  o_special_noarg - option is processed by a function call and
  consumes no other arguments.

  o_special - option processed by function call and consumes one more
  argument.

  o_bool - option address is a 'bool' to be set to the lower 8 bits of
  'flags'.  If 'addr2' is set, use the OPT_A2{COPY,CLR,CLRB,OR) to
  determine what is done to that value.

  o_int - parse an integer, offset by low 8 bits of 'flags', and store
  in 'addr'.

  o_wild - special self-identifying option (no keyword; parsed by
  appearance).  Used only for IPv4 addresses, device name, and tty
  speed.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
