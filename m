From: "Michael St. Laurent" <mikes@hartwellcorp.com>
Date: Mon, 15 Mar 2004 20:05:56 +0000
Subject: Moving logwtmp
Message-Id: <91A5926EFF44D3118B1200104B7276EB02C56E0B@hart-exchange.hartwellcorp.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi folks, 

I'm new to the ppp list but I've been a member of the poptop-server list for
some time.  Something recently came up on that list that should properly be
addressed over here.

The discussion was "How do I know who is connected."  A command has been
cobbled together that will parse the output of ps and then do a lookup on
the log files but it was also pointed out that a few lines of code would
make a wtmp entry and thus solve the problem.

After looking at the pppd code I found the lines in auth.c where this is
done but, aparently, only if one is using PAP authentication.  Since almost
everyone using PPTP also uses Chap, this code is never called and we see
nothing in the who list.

I'm thinking that this code should be moved out of the plogin routine and
put somewhere else instead.  Am I making sense?

-- 
Michael St. Laurent
Hartwell Corporation
