From: "Mondal Atanu (IFIN DC COM)" <Atanu.Mondal@infineon.com>
Date: Fri, 16 Jan 2004 06:57:52 +0000
Subject: RE: running pppd-2.4.2b3 with pppoatm plugin
Message-Id: <0C674B14EAEBD61196D900B0D03DB49FD21E29@blrw502w.blr.infineon.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <0C674B14EAEBD61196D900B0D03DB49FD21E28@blrw502w.blr.infineon.com>
In-Reply-To: <0C674B14EAEBD61196D900B0D03DB49FD21E28@blrw502w.blr.infineon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi Clive,
I have got the path from http://www.sfgoth.com/~mitch/linux/atm/pppoatm/ and
have take the Dennis Monks contribution of pppoatm.c. the file itself is
available in the link
http://www.sfgoth.com/~mitch/linux/atm/pppoatm/pppoatm.c-for-2.4.2b3. The
only reason why I took it is because it uses the plugin capability of the
pppd-2.4.2b3 and seems to be more generic in nature... I need to have both
pppoe and pppoatm
capability simultaneously, so a plugin is more suitable than a monolithic
code.

If you can forward ur pppoatm.c version, it would be really helpful. Also if
you can, please send me the link from where you have obtained
the file.

Thanking you in advance.

Regards
Atanu

-----Original Message-----
From: linux-ppp-owner@vger.kernel.org
[mailto:linux-ppp-owner@vger.kernel.org] On Behalf Of Clive Nicolson
Sent: Thursday, January 15, 2004 3:57 AM
To: linux-ppp@vger.kernel.org
Cc: Clive Nicolson
Subject: Re: running pppd-2.4.2b3 with pppoatm plugin


Hi Atanu.Mondal,

Where did you get pppoatm.c from? I have a version of pppoatm.c in which 
doit is checked in setdevname, but I've not used it with pppd-2.4.2b3, 
only something slighly older (2,4,2b1). Would you like a copy?

Clive



-
To unsubscribe from this list: send the line "unsubscribe linux-ppp" in the
body of a message to majordomo@vger.kernel.org More majordomo info at
http://vger.kernel.org/majordomo-info.html
