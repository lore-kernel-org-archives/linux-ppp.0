From: Christian <crich-ml@beronet.com>
Date: Tue, 31 Oct 2006 17:21:07 +0000
Subject: Re: Way how frames are read in pppd
Message-Id: <45478603.1090000@beronet.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <4540C35F.9010104@beronet.com>
In-Reply-To: <4540C35F.9010104@beronet.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


Hi James,

>>>You can feel free to use this one:
>>>
>>> ftp://ftp.workingcode.com/pub/carlson/ppp/ahdlc.c
>>> ftp://ftp.workingcode.com/pub/carlson/ppp/ahdlc.h
>>>
>>> 
>>>
>>>      
>>>
>>I tried to fetch them, but i got:
>>    
>>
>
>I'll send you a copy by email.
>  
>

I could easily integrate your hdlc implementation, and it works like a
charm! I even do not need to crudely patch pppd, that's really good !

Thank you very much James !

You can see your hdlc implementation in our application bundle at
www.beronet.com/downloads/apps/app_bundle.tar.gz
 in the next few days.

I will mention your work in the README.

Christian

