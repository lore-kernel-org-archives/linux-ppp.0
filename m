From: Bill Unruh <unruh@physics.ubc.ca>
Date: Tue, 22 Nov 2005 19:19:58 +0000
Subject: Re: an embedded linux ppp problem
Message-Id: <Pine.LNX.4.61.0511221118120.12479@info.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <43834152.8030300@vartek-corp.com>
In-Reply-To: <43834152.8030300@vartek-corp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Tue, 22 Nov 2005, James Shaker wrote:

> I am running busybox in an embedded application.  I have the chat script 
> working up to the login portion.  At that point the script hangs waiting for 
> the "ogin:".  When I have the modem hooked up to my laptop and manually 
> dialed into the callin server I get the right prompts. However when the modem 
> is connected to the embedded device, the last message sent is CONNECT 115200.

I do not know who your privider is but almost none want you to logon first. 
End your chat script with
CONNECT '\d\c'


>
> Here are is some of the scripts:
>
> $ cat ppp-on
> #!/bin/sh
> PHN=xxxxxxxxxxx
> TELEPHONE=$PHN
> ACCOUNT=xxxxxxxx
> PASSWORD=xxxxxxx
> LOCAL_IP=0.0.0.0
> REMOTE_IP=0.0.0.0
> NETMASK%5.255.255.0
> PROTOCOL=PPP
> export TELEPHONE ACCOUNT PASSWORD PROTOCOL
> DIALER_SCRIPT=/etc/ppp/ppp-on-dialer
> /bin/setserial /dev/ttyAM1 auto_irq autoconfig
> exec pppd $LOCAL_IP:$REMOTE_IP /dev/ttyAM1 115200 modem connect 
> $DIALER_SCRIPT &
>
> $ cat ppp-on-dialer
> #!/bin/sh
> /usr/sbin/chat -E -v -s -f /etc/ppp/pppconnect
>
> $ cat pppconnect
> TIMEOUT 6
> ABORT 'BUSY'
> ABORT 'NO ANSWER'
> '' AT
> 'OK' ATH0
> TIMEOUT 60
> OK ATDTxxxxxxxxxxx
> CONNECT ''

replace this with 
CONNECT '\d\c'
and remove the rest of the script.

> ogin: xxxxx
> assword: 'xxxxxx
>
> Here what the connect-errors shows:
>
> timeout set to 6 seconds
> abort on (BUSY)
> abort on (NO ANSWER)
> send (AT^M)
> expect (OK)
> AT^M^M
> OK
> -- got it
>
> send (ATH0^M)
> timeout set to 60 seconds
> expect (OK)
> ^M
> ATH0^M^M
> OK
> -- got it
>
> send (ATDT18669686661^M)
> expect (CONNECT)
> ^M
> ATDT18669686661^M^M
> MESSAGE-WAITING^M
> ^M
> CONNECT
> -- got it
>
> send (^M)
> expect (115200)
> 115200
> -- got it
>
> send ( ^M)
> expect (allin)
> ^M
> alarm
> Failed
>
>
> Any suggestions of what to try are greatly appreciated.
>
> James
> -
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

-- 
William G. Unruh   |  Canadian Institute for|     Tel: +1(604)822-3273
Physics&Astronomy  |     Advanced Research  |     Fax: +1(604)822-5324
UBC, Vancouver,BC  |   Program in Cosmology |     unruh@physics.ubc.ca
Canada V6T 1Z1     |      and Gravity       |  www.theory.physics.ubc.ca/
