From: K-sPecial <spam@blazemail.com>
Date: Tue, 16 Nov 2004 22:59:16 +0000
Subject: Re: Socket doesn't get EOF
Message-Id: <419A8644.1030805@blazemail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <41998875.2020305@blazemail.com>
In-Reply-To: <41998875.2020305@blazemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

carlsonj@workingcode.com wrote:
> K-sPecial writes:
> 
>>Hey, i've got an irc bot of over 3000 lines of perl. I test for EOF on 
>>occasion and do a reconnect if eof is detected. This works greatly for 
>>instances as when the socket times out or is disconnected in most 
>>manors. It doesn't although register an eof when pppd dies. I realy 
>>don't know if this might be specific to perl or if even in C this is an 
>>issue.
> 
> 
> This is a frequently-asked question about TCP/IP.
> 
> No, you won't get EOF.  No, it's not a bug.  It's a feature, and it's
> by design.  The TCP layer sees IP as a connectionless datagram
> service, and tries its best to deliver the data the application
> provides.  IP sees the datalink layers as unrelated to any particular
> transport, so when a datalink layer goes down, the transport (such as
> TCP) isn't involved.  If IP can route around the problem, it does so.
> If it can't, it drops the packets and hopes that either (A) the link
> comes back 'soon' or (B) the transport gives up eventually.
> 
> If you want a shorter timeout, set a timer in your application.
> 

Thanks, that was very informative, it made sense and I much appreciate 
the prompt response. I have added a timeout on the socket and will get a 
glimpse of what happens next time pppd dies.

--K-sPecial


