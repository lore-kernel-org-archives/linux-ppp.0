From: "Sadiq Shaikh" <sadiq.shaikh@analog.com>
Date: Tue, 28 Dec 2004 04:34:21 +0000
Subject: RE: pppoatm: tring to insert module pppoatm.o, although plugin pppoatm.so is loaded.
Message-Id: <ALEGKCGFAAHCNBMHOENDAEAKCJAA.sadiq.shaikh@analog.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <ALEGKCGFAAHCNBMHOENDKEAICJAA.sadiq.shaikh@analog.com>
In-Reply-To: <ALEGKCGFAAHCNBMHOENDKEAICJAA.sadiq.shaikh@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi,

Thank you, it did help me. I could do some progress.
Now I'm seeing this error "setsockopt(SO_ATMQOS): Invalid argument"
on console. Whats going wrong now. when i trace it, i found optname
 value for setsockopt is userland is different than in kernel.
Although i use SO_ATMQOS in pppd/plugins/pppoatm.c
Also do i need to apply patches to kernel since i'm using 2.4.18 ?
If yes, where i can get those patches ?

Thank you in Advance,
-sadiq.




-----Original Message-----
From: linux-ppp-owner@vger.kernel.org
[mailto:linux-ppp-owner@vger.kernel.org]On Behalf Of Gilles Espinasse
Sent: Monday, December 27, 2004 11:47 AM
To: Sadiq Shaikh
Cc: PPP mailing list
Subject: Re: pppoatm: tring to insert module pppoatm.o, although plugin
pppoatm.so is loaded.



----- Original Message -----
From: "Sadiq Shaikh" <sadiq.shaikh@analog.com>
To: <linux-ppp@vger.kernel.org>
Sent: Tuesday, December 28, 2004 12:54 AM
Subject: pppoatm: tring to insert module pppoatm.o, although plugin
pppoatm.so is loaded.


> Hi,
>
> I'm working on pppoatm. Recently i have downloaded
> ppp-2.4.3. I'm running into problem, its will be great
> if someone answer my questions.Thank you in advance.
>
> 1) Why ppp0 interface is not created ?
because of 2)

> 2) why its trying to insert module, when i added it as plugin.

You need both a module for the kernel and a plugin for pppd

> 3) I'm using ppp-2.4.3, linux kernel 2.4.18, any issues with this
> combination ?
>
CONFIG_PPPOATM=m is available on my rh7.3 2.4.18-3 .config, I don't know for
a standard kernel.

I don't know what is the driver you try to support but if it compile on
2.4.18 and is old, you may need small changes with 2.4.20, 2.4.21 and
2.4.22. Later no more changes than in 2.4.22 should be necessary if I
remember well.


-
To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

