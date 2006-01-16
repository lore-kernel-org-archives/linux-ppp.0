From: Babarovic Ivica <ivica@asist-traffic.com>
Date: Mon, 16 Jan 2006 09:09:08 +0000
Subject: Re: pppd over gprs modem
Message-Id: <43CB62B4.3020209@asist-traffic.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <43CA8E4E.2020603@asist-traffic.com>
In-Reply-To: <43CA8E4E.2020603@asist-traffic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Thanks for helping me out with my problem
In the end I found out I was dialing the wrong "number"/string.
I was sure I was dialing the right string since I got all those strange
characters in minicom when connection was established.

Anyway ... I should have been dialing atd*99***1# , instead I was
dialing atd*99***#.

I fixed my options as you all suggested.

Thanks again!

Best regards,
I.B.
