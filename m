From: James Carlson <carlsonj@workingcode.com>
Date: Sun, 25 May 2008 16:34:35 +0000
Subject: Re: about authenticatee user name?
Message-Id: <18489.38171.101759.344820@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <200805231020561560013@foxmail.com>
In-Reply-To: <200805231020561560013@foxmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

cyx_mail writes:
> >When configured as an authenticatee, the name pppd presents to the peer for identification is in the our_name[] array.
> 
> I got the AC-Name instead of the user name from the our_name[] array. why?

You haven't provided much in the way of context here, but at a guess,
I'd expect that you've specified the "name" option with that string.

(It looks like I misspoke somewhat anyway in that text you're quoting;
we use 'user[]' for the remote user name when operating as an
authenticatee, and 'our_name[]' for the "name" option, which is the
overall system name, used for authenticator operation *and* as the
default for 'user[]'.)

I don't mean to be dismissive or offensive, but based on the questions
you're asking, it sounds like you're not bothering to read the code.
I strongly recommend reading the code if you're trying to modify it.
If the problem instead is that you've read but don't understand the
code, then I'd recommend finding a local expert (consultant or
otherwise) to help you out.

I don't think you're going to find too many people on this list who
are willing to lead you by hand through each line of code.  Please at
least do some elementary research before asking for help.  If you
haven't read this document, do so now:

  http://www.catb.org/~esr/faqs/smart-questions.html

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
