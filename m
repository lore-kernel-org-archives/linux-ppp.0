From: Christopher Fowler <cfowler@outpostsentinel.com>
Date: Thu, 28 Dec 2006 18:21:55 +0000
Subject: Re: serial line is looped back!
Message-Id: <1167330115.31503.6.camel@shuttle.linxdev.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <cfd1efa00612270035p56f20450ncda10c76d10fa379@mail.gmail.com>
In-Reply-To: <cfd1efa00612270035p56f20450ncda10c76d10fa379@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, 2006-12-28 at 10:17 -0800, Bill Unruh wrote:
> 
> In many situations you should end with '\d\c' so that your chat script
> does
> not send a carriage return, which it does for '' which you use to end
> it.
> Many isps see taht carriage return as a request to start  a regular
> login
> session rather than ppp. However in your case I guess it is a gsm
> phone or
> something you are using.

I never new that.  Typically all my devices call only Linux servers so
it is Linux calling Linux with mgetty on each end.  Never had a problem
with that carriage return.

