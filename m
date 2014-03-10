From: Greg <gregborbonus@gmail.com>
Date: Mon, 10 Mar 2014 12:31:14 +0000
Subject: PPPD plugin development
Message-Id: <531DB092.3040404@gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <531BEBF2.3020508@gmail.com>
In-Reply-To: <531BEBF2.3020508@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

hey guys,

as stated before, I'm trying to write a plugin to authenticate against 
an external script. So far, I've only managed to get it to write a bit 
information to a log file on the server.

I'm trying to use the digest->code to determine the type of digest used. 
I figured that if I can find out which type it's using then I could then 
move forward with converting it or determining how to store the 
encrypted password to do a comparison.

I've also made it return 1 so that no matter what I enter, it should 
show authenticated.

digest->code writes as blank.
When using it as a switch->case scenario, it goes to default:
switch (digest->code) {
         case CHAP_MICROSOFT:
         {
           codemess = "MIC";
         }
         case CHAP_MICROSOFT_V2:
         {
           codemess = "MV2";
         }
         default:
           codemess = "Default";
}


The return 1 appears to work, but then I get the message:
MPPE required, but keys are not available.  Possible plugin problem?


I REALLY wish this was a documented better. Though I code in other 
scripting languages, C is not something I'm used to coding. So please 
feel free to give me a hard time, I'm muddling my way through C just to 
get the basics right.


-- 
Thank you,
Greg Borbonus
*Nix Server administrator

