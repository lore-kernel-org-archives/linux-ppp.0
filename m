From: Ajay Dangol <ajay.dangol@parijat.info.com.np>
Date: Thu, 11 Nov 2004 09:49:52 +0000
Subject: ppp problem red hat linux 6.0
Message-Id: <Pine.LNX.4.33.0411111534020.30509-100000@parijat.info.com.np>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


Hi all,

I have an old machine of red hat linux 6.0. It was working fine till this 
morning but now i got ppp error. 

The error message is 


ioctl(TIOCSETD(PPP)): Invalid argument(22)

 This system lacks kernel support for PPP.  This could be because the PPP 
kernel module could not be loaded, or because PPP was not included in the 
kernel configuration.  If PPP was included as a module, try 
`/sbin/modprobe -v ppp'.  If that fails, check t

I tried the options /sbin/modprobe -v ppp but it doesnt work.

I have reinstalled ppp-2.3.11-4 but it also have not helped.

Can somebody please help me out.


Thanks in advace,

ajay dangol

