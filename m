From: "Colin Dabisza" <cdabisza@hotmail.com>
Date: Wed, 02 Jun 2004 19:35:34 +0000
Subject: pppd on 2.6 kernel
Message-Id: <BAY18-F33GYw13KVLAa0004e3a7@hotmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi there,

I'm having all sorts of issues with pppd on the 2.6.6 kernel.  I have a 
system of 35 mobile phones that I use pppd to put into data calls.  Most of 
these phones are serial, and they use the Rocket Port driver rocket 
(char-major-46).  The other phones are USB based, and they are using a 
driver I wrote (that uses usbserial).  I'm using 2.4.1 of PPP.

On the 2.4.26 kernel the serial phones work fantastic.  I can have up to 128 
mobile phones all in PPP connections...no problem.  Moving to the 2.6.6 
kernel, suddenly everything doesn't work.  The serial phones will usually 
make the first pppd connection, but after my server application SIGHUPs it, 
pppd does not seem to work when it is envoked again (yes, I'm sure the old 
pppd for the device has died and has removed its lock file).  The init and 
connect scripts are no longer parsed correctly.

Interestingly enough, if I remove the -detach option, the serial phones will 
work correctly every time...but I really need pppd not to fork.  The USB 
phones seem to work a bit better (they also have pppd issues, but not the 
same as I'm seeing with the serial).

Obviously something has changed in the 2.6.6 kernel such that the rocket 
driver is no longer functional.  Has anyone come accross this?  Is there a 
solution, or at least a posting that describes the problem in detail?

Thanks very much,

Colin Dabisza

_________________________________________________________________
Free yourself from those irritating pop-up ads with MSn Premium. Get 2months 
FREE*  
http://join.msn.com/?pgmarket=en-ca&page=byoa/prem&xAPID94&DI34&SU=http://hotmail.com/enca&HL=Market_MSNIS_Taglines

