From: Kristian Evensen <kristrev@simula.no>
Date: Tue, 22 May 2012 22:55:12 +0000
Subject: Re: PPP connection stuck at bad configuration-ack
Message-Id: <3AF095DA-EF88-4B8B-A8E3-D774F202B1FD@simula.no>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAN0ddOm5akxZaAJ-VN4fgSAVOKEOEaXNoUkHXhDdKe4UAMjv1w@mail.gmail.com>
In-Reply-To: <CAN0ddOm5akxZaAJ-VN4fgSAVOKEOEaXNoUkHXhDdKe4UAMjv1w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org



On 23. mai 2012, at 00:47, James Cameron <quozl@laptop.org> wrote:

> I've seen this symptom also in the time between power up of the modem
> and successful network attachment.
> 
> What fixed it for me was to add to the chatscript:
> 
> # cease if modem is not attached to network yet
> ABORT '+CGATT: 0'
> '' AT+CGATT?
> 

Thanks, I will try that tomorrow. I just spoke to somebody at the Isp as well, and their theory is that the ppp client is confused by the 127.0.0.1 ms-wins. They will update their ggsn config tomorrow so we can check if that is the case.

Thanks again for the help!
Kristian
