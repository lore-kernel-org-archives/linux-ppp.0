From: "Ferreira, Fernando Borges" <FernandoBorges.Ferreira@getronics.com>
Date: Tue, 06 Apr 2004 09:42:03 +0000
Subject: RE: RES: Problem with PPP0 interface
Message-Id: <33B641675B6BBC419F539832368D73C80501116F@excbrsp002.americas.unity>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.LNX.4.50.0404021743370.1892-100000@string.physics.ubc.ca>
In-Reply-To: <Pine.LNX.4.50.0404021743370.1892-100000@string.physics.ubc.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hallo everybody!

I found out the cause of the problems... do you see those ^M at the end of some lines? That garbage was produced when the numpad enter was pressed and, because of that, some garbage was sent to the modem. I have done the script once again using pppsetup and using the left enter instead of the one near the numpad and everything worked fine. 
Thanks for the help and have a nice day!

Fernando


-----Original Message-----
From: Bill Unruh [mailto:unruh@physics.ubc.ca]
Sent: Friday, April 02, 2004 22:49
To: Ferreira, Fernando Borges
Cc: Linux-ppp
Subject: Re: RES: Problem with PPP0 interface


On Fri, 2 Apr 2004, Ferreira, Fernando Borges wrote:

> I'm sorry, Bill. I know I should have provided you with more information but that was not possible since I wasn't at home, so, I sent the only message I remembered. Now I'll provide you with the logs.

The log says that you never do connect with the far end. YOur chat
script times out while waiting for login. 
Now, it could be that you are not waiting long enough ( you wait for 
60 sec) and need to increase the timeout time. Or it could be that you
are wrong about the far end wanting you to login first. 

I would advise you to try ending your script with 
CONNECT '\d\c'

and see if that starts up ppp. The second thing I would try is to
increase timeout to 2 min on the login script. After that I would phone
the ISP and find out what they want.


>  
> First of all, my provider doesn't use PAP or CHAP, so I created a script. Here is what I got from my provider connecting with minicom or hyperterminal.

How do you know that they do not use pap or chap. Most phone in help has
no idea what they do. As above I would advise you to try it.


> at
> OK
> atdt30095515
> CONNECT 19200/ARQ
>  
> UQKT2 78.1
> 
> Login: user@itelefonica.com.br
> Password:
>     Entering PPP Session.
>     IP address is 200.171.153.125
>     MTU is 1100.
>  
> Based on it, I created the script using the pppsetup assistent: 
> Expect ogin:
> user@provider.foo
> Expect word:
> password
>  
> Now follow the error messages from the log:
>  
> Apr 2 19:20:56 templum pppd[1906]: pppd 2.4.1 started by root, uid 0
> 
> Apr 2 19:20:57 templum chat[1909]: timeout set to 60 seconds
> 
> Apr 2 19:20:57 templum chat[1909]: abort on (ERROR)
> 
> Apr 2 19:20:57 templum chat[1909]: abort on (BUSY)
> 
> Apr 2 19:20:57 templum chat[1909]: abort on (NO CARRIER)
> 
> Apr 2 19:20:57 templum chat[1909]: abort on (NO DIALTONE)
> 
> Apr 2 19:20:57 templum chat[1909]: send (AT&FH0^M)
> 
> Apr 2 19:20:57 templum chat[1909]: expect (OK)
> 
> Apr 2 19:20:57 templum chat[1909]: AT&FH0^M^M
> 
> Apr 2 19:20:57 templum chat[1909]: OK
> 
> Apr 2 19:20:57 templum chat[1909]: -- got it 
> 
> Apr 2 19:20:57 templum chat[1909]: send (atdt30095515^M)
> 
> Apr 2 19:20:57 templum chat[1909]: timeout set to 75 seconds
> 
> Apr 2 19:20:57 templum chat[1909]: expect (CONNECT)
> 
> Apr 2 19:20:57 templum chat[1909]: ^M
> 
> Apr 2 19:21:23 templum chat[1909]: atdt30095515^M^M
> 
> Apr 2 19:21:23 templum chat[1909]: CONNECT
> 
> Apr 2 19:21:23 templum chat[1909]: -- got it 
> 
> Apr 2 19:21:23 templum chat[1909]: send (^M)
> 
> Apr 2 19:21:23 templum chat[1909]: expect (ogin:)
> 
> Apr 2 19:21:23 templum chat[1909]: 19200/ARQ^M
> 
> Apr 2 19:22:38 templum chat[1909]: alarm
> 
> Apr 2 19:22:38 templum chat[1909]: Failed
> 
> Apr 2 19:22:38 templum pppd[1906]: Connect script failed
> 
> Apr 2 19:22:39 templum pppd[1906]: Exit.
> 
>  
> 
> PPS: Yes, there's /dev/ppp
> 
>  
> 
> Thank you for your help,
> 
> Fernando
> 
> 	-----Mensagem original----- 
> 	De: Bill Unruh [mailto:unruh@physics.ubc.ca] 
> 	Enviada: sex 2/4/2004 14:11 
> 	Para: Ferreira, Fernando Borges 
> 	Cc: Linux-ppp 
> 	Assunto: Re: Problem with PPP0 interface
> 	
> 	
> 
> 	On Fri, 2 Apr 2004, Ferreira, Fernando Borges wrote:
> 	
> 	> Hello everybody,
> 	> I have an US Robotics 33.6 Sportster external modem and I can't get connected. I got connected using minicom and sending commands to the modem, but I couldn't get connected after configuring the pppsetup correctly. The modem dials and, after the auth. process, I tried to check the ppp interface and got the following message: "couldn't find interface ppp0: no such device". I run a Slackware box with the kernel 2.6.3 compiled with PPP support. Everything works fine, but I can't get connected. Any clues?
> 	
> 	That message is not the problem. Post the debug output from ppp here.
> 	
> 	put
> 	debug
> 	into /etc/ppp/options and put the line
> 	daemon.*;local2.*               /var/log/ppplog
> 	into /etc/syslog.conf
> 	and then do
> 	killall -1 syslogd
> 	
> 	Then try to connect and put the output from that connection into the
> 	message here. You do not understand what is happening and so your
> 	selection of the messages to tell us about cannot be trusted. Just post
> 	them all. Keeping the time stamps and everything. Do not edit anything,
> 	except remove your password if it occurs in the file.
> 	
> 	(PS, does /dev/ppp exist?)
> 	
> 	>
> 	> Thanks in advance,
> 	>
> 	> Fernando
> 	> -
> 	> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> 	> the body of a message to majordomo@vger.kernel.org
> 	> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 	>
> 	
> 	--
> 	William G. Unruh   |  Canadian Institute for|     Tel: +1(604)822-3273
> 	Physics&Astronomy  |     Advanced Research  |     Fax: +1(604)822-5324
> 	UBC, Vancouver,BC  |   Program in Cosmology |     unruh@physics.ubc.ca
> 	Canada V6T 1Z1     |      and Gravity       |  www.theory.physics.ubc.ca/
> 	
> 
> 

-- 
William G. Unruh   |  Canadian Institute for|     Tel: +1(604)822-3273
Physics&Astronomy  |     Advanced Research  |     Fax: +1(604)822-5324
UBC, Vancouver,BC  |   Program in Cosmology |     unruh@physics.ubc.ca
Canada V6T 1Z1     |      and Gravity       |  www.theory.physics.ubc.ca/
