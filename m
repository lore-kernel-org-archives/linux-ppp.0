From: Phil Mayers <p.mayers@imperial.ac.uk>
Date: Sun, 19 Feb 2006 22:49:51 +0000
Subject: final repost - MPPE incorrect REJECT/NAK behaviour (was Re: Windows
Message-Id: <43F8F60F.70106@imperial.ac.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------090004020407090702050007"
List-Id: <linux-ppp.vger.kernel.org>
To: linux-ppp@vger.kernel.org

This is a multi-part message in MIME format.
--------------090004020407090702050007
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Phil Mayers wrote:
>>
>> I've discovered that the problem is the WM2005 PPTP client PPP layer
>> sets none of the 40, 56 or 128 bit MPPE flags, and pppd instantly
>> terminates the connection when this happens. A win2k VPN server NAKs
>> with the preferred keysize.
>>
>> sent [CHAP Challenge id=0x3e <CHAL>, name = "pptpd"]
>> rcvd [CHAP Response id=0x3e <RESP>, name = "user"]
>> sent [CHAP Success id=0x3e "S=BYTES"]
>> sent [CCP ConfReq id=0x1 <mppe +H -M +S +L -D -C>]
>> rcvd [CCP ConfReq id=0x0 <mppe -H -M -S -L -D +C>]
>> sent [LCP TermReq id=0x2 "MPPE required but peer negotiation failed"]
>> sent [CCP ConfRej id=0x0 <mppe -H -M -S -L -D +C>]
> 
> I have also seen this yesterday with a windows ME client. In this 
> instance the patch fixed the connection completely, so I'm inclined to 
> think it's correct.
> 
> Does anyone have any comments on the pppd patch?
> 

I am assuming no-one has an opinion on this? If not I'll bung it into 
our local SVN vendor repo and leave it at that, though obviously I'd far 
rather not maintain it locally.

To summarise - some PPP clients (windows mobile 2005, windows ME) send 
the 40, 56 and 128 bits as zero. Win2k servers NAK with the preferred 
bit set, linux pppd REJECTS with "MPPE required".

This message and the reply refer to the problem some time ago:

http://marc.theaimsgroup.com/?l=linux-ppp&m=107533972806878&w=2
http://marc.theaimsgroup.com/?l=linux-ppp&m=107534084207793&w=2

...and the OP indicates the "forked" ppp 2.4.1 did the right thing. 
Attached is a patch to fix the behaviour, which I have confirmed as 
working here.

Cheers,
Phil

--------------090004020407090702050007
Content-Type: text/x-patch;
 name="mppe_nak_fix.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="mppe_nak_fix.patch"

--- ppp-2.4.3/pppd/ccp.c	2006-02-08 14:28:03.000000000 +0000
+++ ppp-2.4.3/pppd/ccp.c	2006-02-08 14:30:45.000000000 +0000
@@ -1157,9 +1157,16 @@
 			break;
 		    }
 		} else {
-		    /* Neither are set. */
-		    newret = CONFREJ;
-		    break;
+		    /* Neither are set. NAK with the best we support */
+		    if (ao->mppe & MPPE_OPT_128)
+		    	ho->mppe |= MPPE_OPT_128;
+		    else if (ao->mppe & MPPE_OPT_40)
+		    	ho->mppe |= MPPE_OPT_40;
+		    else {
+			newret = CONFREJ;
+			break;
+		    }
+		    newret = CONFNAK;
 		}
 
 		/* rebuild the opts */

--------------090004020407090702050007--
