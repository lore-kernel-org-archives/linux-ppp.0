From: Sujit K M <sjt.kar@gmail.com>
Date: Fri, 15 Oct 2010 10:51:13 +0000
Subject: Re: [PATCH] pppoe: Missed check for destination addr in PADT frame processing
Message-Id: <AANLkTinSgLbDuOfB9Cy0JJGiKVNVs2hMeR37=pD+O5NG@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <AANLkTim5m4f-7U4kMghBR0yEQka3-iOaJ9aHwf4sGsxj@mail.gmail.com>
In-Reply-To: <AANLkTim5m4f-7U4kMghBR0yEQka3-iOaJ9aHwf4sGsxj@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

> In case of ISP has single access point, it has one source MAC for all
> network, right? If such AP is buggy and give two(or more) equal
> session_id's to several clients, this cause situation I described
> above.

I am still not clear. The session_id will have an unique value for the pppoe
connection. I think It will be a part of
1. The handshake that goes on
2. Crytography for the device(specific to the modem).

Even If 2 fails, 1 Should fix it(be it single/multiple).
