From: Bill Unruh <unruh@physics.ubc.ca>
Date: Mon, 04 Aug 2008 20:44:14 +0000
Subject: Re: timeout
Message-Id: <Pine.LNX.4.64.0808041343240.6878@info.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <W821531458670521217882275@webmail39>
In-Reply-To: <W821531458670521217882275@webmail39>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Mon, 4 Aug 2008, tony.chamberlain@lemko.com wrote:

> I am using pptp which calls pppd.  I use ip-up.local to add routes.
>
> Problem is, when connecting, after only 10 or 15 seconds the link gets dropped
> by the peer due to inactivity (I think it is the peer and not me).

Who is the peer? Are you sure you do not have a timeout where you thought
the time was in minutes but really is in seconds?


>
> Anyway I can make a stupid script to ping the other side every 5 seconds, which keeps the link up.  But there should be a better way.  I thought lcp-echo-request set to 5 would do it, but that sends only if it hasn't heard from the peer in 5 seconds, and by then it is too late.
>
> Any suggestions?
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

-- 
William G. Unruh   |  Canadian Institute for|     Tel: +1(604)822-3273
Physics&Astronomy  |     Advanced Research  |     Fax: +1(604)822-5324
UBC, Vancouver,BC  |   Program in Cosmology |     unruh@physics.ubc.ca
Canada V6T 1Z1     |      and Gravity       |  www.theory.physics.ubc.ca/
