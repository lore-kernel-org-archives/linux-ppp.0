From: Pieter Loubser <ploubser@sanpeople.com>
Date: Thu, 02 Feb 2006 06:38:14 +0000
Subject: Re: Hot to perform a null login?
Message-Id: <1138862294.2400.133.camel@io.sanpeople.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <1138770376.8869.17.camel@localhost.localdomain>
In-Reply-To: <1138770376.8869.17.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org



I setup a connection like that myself and is easy to do.


step 1:

Have an entry in your pap/chap secret file with
empty username and password.

e.g:
--------------------------------

    ""      *       ""       *

---------------------------------



step 2:

Apply this patch.
(Just comment out the 2 lines which forces a username on you)


---------------------------------------------------------------------------------------------------

--- ppp-2.4.2-FINAL/pppd/auth.c     Tue Feb  1 10:57:00 2005
+++ ppp-2.4.2/pppd/auth.c       Mon Feb  7 09:30:44 2005
@@ -1109,8 +1109,6 @@
     /* Default our_name to hostname, and user to our_name */
     if (our_name[0] = 0 || usehostname)
        strlcpy(our_name, hostname, sizeof(our_name));
-    if (user[0] = 0)
-       strlcpy(user, our_name, sizeof(user));

     /*
      * If we have a default route, require the peer to authenticate

----------------------------------------------------------------------------------------------------


That should work...
(Well it did for me any case)



Pieter








> G'Day,
> 
> 	I am trying to use a GSM modem to create a GPRS connection via pppd.  I
> have managed to work most things out, but am finding authentication a
> stumbling block: I need to send a blank name and password, but pppd is
> sending my local name (which is obviously being treated as incorrect by
> the server).  Looking through the pppd code, I came across null_login(),
> which looks like it may provide what I need, but I cannot seem to get
> pppd to call it --- obviously I am misunderstanding something along the
> way, and have something set up wrong.
> 
> 	Could someone please tell me how to configure pppd to reply to a PAP
> request with a blank name and password?  I'll include dumps of my pppd
> and chat scripts below, in case they are relevant.
> 
> 	-- Matthew
> 
> /etc/ppp/peers/gprs-script:
> 115200
> noauth
> debug
> crtscts
> noipdefault
> modem
> usepeerdns
> defaultroute
> pap-max-authreq 3
> connect-delay 10000
> connect '/usr/sbin/chat -v -f /etc/ppp/gprs-init'
> 
> /etc/ppp/gprs-init:
> TIMEOUT 10
> ABORT "NO CARRIER"
> ABORT "NO DIALTONE"
> ABORT "BUSY"
> ABORT "ERROR"
> "" AT+WOPEN=1 OK
> \dAT+CPIN? TIMEOUT 5 READY-\dAT+CPINU69-OK
> \dAT+CPIN? TIMEOUT 10 READY
> \dAT+CREG=1 OK
> \dAT+CGDCONT=1,"IP","telstra.internet" OK
> \dAT+CGDATA=1 ""
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

