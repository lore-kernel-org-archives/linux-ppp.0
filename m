From: "cyx" <cyx@fiberhome.com.cn>
Date: Thu, 10 Jul 2008 03:30:09 +0000
Subject: Re: Re: about re-negotiate dns server IP
Message-Id: <200807101130094216040@fiberhome.com.cn>
List-Id: <linux-ppp.vger.kernel.org>
References: <200807101053023595691@gmail.com>
In-Reply-To: <200807101053023595691@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

>>DNS server addresses are negotiated by IPCP as ms-dns, not by LCP.  I
>>don't know the answer to your question though, sorry.

pppoe-server give its clients DNS address from ms-dns in pppoe-server-options FILE. If I change ms-dns when the ppp link established, will the server re-negotiate the DNS address to its clients? Thank you.

