From: terry white <twhite@aniota.com>
Date: Sat, 29 Jan 2011 16:20:41 +0000
Subject: Re: DSL link sometimes dies: pppd or kernel problem?
Message-Id: <Pine.LNX.4.64.1101290740481.2756@yossarian.aniota.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <201101281649.51225.juergen127@kreuzholzen.de>
In-Reply-To: <201101281649.51225.juergen127@kreuzholzen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

... ciao:

: on "1-29-2011" "Juergen Beisert" writ:
 
: But why it is up and running again when I just restart the pppd?
 
    "perhaps" restarting pppd 'tickles' the provider's system, and it 
responds.  i can't say for sure.


: This log is from  the pppd-2.4.5.

    "RP-PPPoE plugin version 3.8p compiled against pppd 2.4.5
     pppd version 2.4.5"


: Running the pppd-2.4.4 a message like the "Modem hangup" terminates the pppd, 
: nothing else.

    "yossarian pppd[8703]: Serial link appears to be disconnected.
     yossarian pppd[8703]: ... ( more log data )
     yossarian pppd[8703]: Connect time 7026.8 minutes.
     yossarian pppd[8703]: Connection terminated.
     yossarian pppd[8703]: Modem hangup"
 
    if you're saying, the "ONLY" thing your (2.4.4) logs say about losing 
a connection is, "Modem hangup", i'd suggest you make the reporting more 
verbose.


: Also in this case I just start the pppd again and everything is 
: working again. I'm confused. 
 
    from my reading, your confusion is aggrivated by not knowing if the 
problem, pppd-version specific, or provider related.  in my case, i was 
getting the same results with identical modems, and 'sometimes' they both 
worked "flawlessly".  that did not suggest a problem with pppd, and 
'failure to respond to echo requests' tended to support that conclusion.
  
    assuming, no hardware changes, i'd suggest going back to 2.4.4 and 
watching what happens.  see if you can isolate the problem.  if, it turns 
out to be a version specific issue, the ChangeLog might offer a starting 
point for further investigation ...


-- 
... it's not what you see ,
    but in stead , notice ...
