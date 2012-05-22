From: James Cameron <quozl@laptop.org>
Date: Tue, 22 May 2012 22:47:58 +0000
Subject: Re: PPP connection stuck at bad configuration-ack
Message-Id: <20120522224758.GC12350@us.netrek.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAN0ddOm5akxZaAJ-VN4fgSAVOKEOEaXNoUkHXhDdKe4UAMjv1w@mail.gmail.com>
In-Reply-To: <CAN0ddOm5akxZaAJ-VN4fgSAVOKEOEaXNoUkHXhDdKe4UAMjv1w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I've seen this symptom also in the time between power up of the modem
and successful network attachment.

What fixed it for me was to add to the chatscript:

# cease if modem is not attached to network yet
ABORT '+CGATT: 0'
'' AT+CGATT?

-- 
James Cameron
http://quozl.linux.org.au/
