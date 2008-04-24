From: "C.J" <c.james.cj@gmail.com>
Date: Thu, 24 Apr 2008 16:01:12 +0000
Subject: how to use compress modul in ppp process
Message-Id: <200804250001085508333@gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi list,                            
I got some troubles on ppp_mppe. After successful negotiation with parameter mppc-128bit encrypt, I cannot get decompressed package.

Between server and client, I got the comp_data package with wireshark also in my client I can get this package( which is not decompressed at all ).

I found ppp_mppe module decomp_init has been called successful. But why it couldn't work for me? 

I only know that we need call ioctl(PPPIOCSCOMPRESS) to set compressor and call ccp_test which is set COMP flags. Both of them I've use in my client.

Any ideas? 






Thx & Regards

--
cj
 

