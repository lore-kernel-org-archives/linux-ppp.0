From: Frank Krauss <fmfkrauss@mindspring.com>
Date: Sun, 23 Jan 2005 20:04:34 +0000
Subject: Re: Problem with "persist" on PPP 2.4.3 under Linux Kernel 2.6.9
Message-Id: <05012315194700.21504@sevencardstud.cable.nu>
List-Id: <linux-ppp.vger.kernel.org>
References: <05011913351800.04070@sevencardstud.cable.nu>
In-Reply-To: <05011913351800.04070@sevencardstud.cable.nu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello Bhaskar,

Thank you very much for the Patch.

I had gone back to the 2.4.0 version of PPP where the "persist" option is
running perfect with Kernel 2.6.9.

When I got your Code, I did some research on it.
Unfortunately, there is no function called "disestablish_ppp" in
sys-linux.c in the PPP 2.4.3 version that I have.

The only two functions whose names are similar to this are
"tty_disestablish_ppp" and "generic_disestablish_ppp".

Would you be able to tell me where you found this Patch?
Would you be able to give me the actual patch file, where the line numbers are
mentioned?

Thank you again very much for taking an interest in my Problem.

Yours truly,

Frank

=====================================

On Sat, 22 Jan 2005, Bhaskar wrote:
> Hi,
> Even I had faced this problem.  I found that its because of some bug in 
> the linux kernel itself.  I don't exactly know where is the problem.  
> But I found a small patch added to ppp code which solved the problem.
> If you enable "debug" option and also give the logfile, you would see 
> one error displayed saying it could not open the channel #  and the 
> channel number changes and never connects. 
> 
> The patch added is
> 
>         if (!looped && ifunit >= 0 && ioctl(ppp_dev_fd, PPPIOCDETACH) < 0) {
>             int flags;
> 
>             error("Couldn't release PPP unit: %m");
>             close(ppp_dev_fd);
>             ppp_dev_fd = open("/dev/ppp", O_RDWR);
>             if (ppp_dev_fd < 0)
>                 fatal("Couldn't open /dev/ppp: %m");
>             flags = fcntl(ppp_dev_fd, F_GETFL);
>             if (flags = -1
>                 || fcntl(ppp_dev_fd, F_SETFL, flags | O_NONBLOCK) = -1)
>                 warn("Couldn't set /dev/ppp to nonblock: %m");
>         }
> 
> in sys-linux.c file and the function name is disestablish_ppp().
> 
> This should work if you are still facing the problem.
> 
> -Bhaskar
> Frank Krauss wrote:
> 
> >Hello Ankit,
> >
> >Thank you very much for your response.
> >
> >Unfortunately, in my case, I don't believe that the method you suggested is
> >feasable.
> >
> >My connection supports a Web/Ftp/Game Server and thus has to be connected to
> >the Internet and available 24/7 so that my potential clients can see my Web
> >page and play the Game that I offer.
> >
> >I have been running my system using the "persist" option to keep me connected to
> >the Internet for over a year and its worked perfectly.
> >
> >I believe that there must be some type of Bug in the "persist" area of the Code
> >that is going bad.
> >
> >Thank you again for your suggestion.
> >
> >Frank
> >
> >=====================================
> >
> >On Wed, 19 Jan 2005, Desai, Ankit (Export) wrote:
> >  
> >
> >>You can try and use diald option, which will try to reconnect to the
> >>internet on demand/use. So, even if you are offline, and there is a demand
> >>for internet connection, it will try to reconnect on its own.
> >>
> >>Just make sure, you configure diald correctly, it is a little bit tricky.
> >>
> >>Regards,
> >>Ankit
> >>
> >>-----Original Message-----
> >>From: Frank Krauss [mailto:fmfkrauss@mindspring.com]
> >>Sent: Wednesday, January 19, 2005 1:30 PM
> >>To: linux-ppp@vger.kernel.org
> >>Subject: Problem with "persist" on PPP 2.4.3 under Linux Kernel 2.6.9
> >>
> >>
> >>Good day,
> >>
> >>I'm having a problem that I can't seem to find any indication of a fix on
> >>GOOGLE for and so I'm hoping that someone on this list can point me in
> >>the correct direction.
> >>
> >>I'm running Linux Kernel 2.6.9 on a Pentium 4 using the Caldera
> >>Distribution.
> >>I installed PPP 2.4.3 and have been using it successfully for a couple of
> >>days.  My problem with it is the following:
> >>
> >>I'm running a 24/7 Server and after every 12 Hour period, my I.S.P,
> >>which is Mindspring/Earthlink, drops my connection.
> >>I have the "persist" option specified to take care of this problem and so
> >>PPP should re-connect successfully.  This worked perfect with my previous
> >>system using Kernel 2.4.22 and PPP 2.4.1.
> >>
> >>Unfortunatly, the "persist" option dosn't seem to be working correctly for
> >>me.  At the moment the line gets dropped, PPP now gives me the following
> >>messages in my /var/log/messages file:
> >>   tcflush failed: Input/output error
> >>   Modem hangup
> >>   tcsetattr: Invalid argument (line 962)
> >>   tcsetattr: Invalid argument (line 1001)
> >>   Exit.
> >>
> >>This causes me to have to bring up PPP again myself rather than having
> >>the "persist" option work as it should.
> >>
> >>This has happened each time for the last (3) re-cycle attempts with the
> >>exact same messages.
> >>
> >>If anyone has knowledge of a fix to correct this problem or an option
> >>to use, I would be glad to try them out.
> >>
> >>My Environment is:
> >>Computer:     Pentium-4
> >>Distribution: Caldera 2.3
> >>Kernel:       2.6.9
> >>GCC:          3.4.3
> >>GLIBC:        2.3.3
> >>PPP:          2.4.3
> >>
> >>Any assistance that someone could give me to solve this problem
> >>would be greatly appreciated.
> >>
> >>Yours truly,
> >>
> >>Frank Krauss
> >>  
> >>-
> >>To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> >>the body of a message to majordomo@vger.kernel.org
> >>More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >>    
> >>
> >-
> >To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> >the body of a message to majordomo@vger.kernel.org
> >More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
> >  
> >
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
