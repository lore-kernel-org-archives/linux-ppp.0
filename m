From: James Carlson <carlsonj@workingcode.com>
Date: Tue, 22 Nov 2005 16:26:33 +0000
Subject: Re: an embedded linux ppp problem
Message-Id: <17283.18105.817267.273756@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <43834152.8030300@vartek-corp.com>
In-Reply-To: <43834152.8030300@vartek-corp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

James Shaker writes:
> CONNECT ''

This tells the chat script to send a CR right after seeing the word
"CONNECT."  Try using this instead:

	CONNECT '\c'

... to tell it to send nothing when it sees CONNECT.

> expect (115200)
>  115200
>  -- got it
> send ( ^M)
> expect (allin)

That sure doesn't look like a log from this chat script.  It doesn't
match at all.

Are you sure you're using the desired chat script?

Where's the chat script that expects to see "allin" instead of
"login:"?

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
