From: Ramses van Pinxteren <Ramses@niob.knaw.nl>
Date: Wed, 13 Apr 2005 07:43:28 +0000
Subject: Re: pppd + ldap??
Message-Id: <f06200709be827afebcc6@[195.169.144.222]>
List-Id: <linux-ppp.vger.kernel.org>
References: <f06200707be81410e288b@[195.169.144.222]>
In-Reply-To: <f06200707be81410e288b@[195.169.144.222]>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Well, let me exactly explain what I want it to do, perhaps you, (or 
one of the list members) can point me in the right direction.

I want to get poptop (VPN) authenticate to an ldap database. so 
poptop calls pppd, who in turn connects to LDAP using one way or the 
other. Thusfar, I have seen some pages (not working ofcourse) that 
people authenticate to a samba server, that connects to ldap.

Until now I have a samba authentication server (no shares, or 
printers) that connects to LDAP, but i don't yet have a radius 
server. What is the easiest way to go? Connect to the samba server 
(running on the same machine) or setup a radius server?

And does anyone have a WORKING howto for setting up either one of them?

Thanks
ramses


>You would use the radius plugin to authenticate against a RADIUS server which
>in turn would be configured to authenticate against LDAP.
>
>Ray
>
>On Tue, Apr 12, 2005 at 11:14:53AM +0200, Ramses van Pinxteren wrote:
>>  Hi,
>>
>>  I read on the net somewhere that ldap authentication was done by
>>  radius.so plugin?? if this is true, then I hope someone can help me
>>  with setting this plugin up?
>>
>>  thanks,
>>  ramses
>-
>To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html

