From: Thanh Tran <TTRAN@MULTITECH.COM>
Date: Thu, 10 Mar 2005 19:11:14 +0000
Subject: pppd (version 2.4.1) - unrecognized options
Message-Id: <20C86D2620F6D411A199009005DC010208337402@exchange_serve.multitech.prv>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi,

I am trying to start up pppd (version 2.4.1) from the command line and kept
getting the "unrecognized option" for the <loc>:<rem> option.

For example: pppd  /dev/ttyS0 38400 194.186.3.199:194.186.3.190 

and I got back:

>> pppd unrecognized option 194.186.3.199:194.186.3.190
>> Usage: pppd [ options ], where options are:
>>  .... follows are the options list

I checked the source code and found that the "ipcp_option_list" (which
contains "IP addresses", o_wild, (void *) &setipaddr ... ) is defined in the
"ipcp_protent" structure, but this structure is being #if out with "Brindha"
in Main.c (user/pppd-2.4.1/pppd).  

I couldn't find where the definition of the "Brindha" is located.  If anyone
knows where it was defined or if I was looking at the wrong thing for this
problem, please let me know.

Thank you for your help.


In Main.c (user/ppp-2.4.1/pppd)

#if Brindha
    &ipcp_protent,
#endif



Thanh
