From: James Carlson <carlsonj@workingcode.com>
Date: Wed, 12 Jan 2011 15:29:37 +0000
Subject: Re: ppp / open vpn
Message-Id: <4D2DC8E1.4040005@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <W90767349010091294791641@webmail30>
In-Reply-To: <W90767349010091294791641@webmail30>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 01/12/11 10:17, tony.chamberlain@lemko.com wrote:
>>> inet addr:10.1.0.6 P-t-P:10.1.0.6 Mask:255.0.0.0
> 
>> That doesn't look happy. Why would both the local and remote address be
>> equal? (I wouldn't expect a functioning system to allow a configuration
>> like that.)
> 
> I thought the same thing, but that is how openvpnas sets up the routes.
> As for changing the software so it does not kill all the tunnels, I agree
> completely (as I agree they should use two different config files for
> routing traffic, one to route everything through VPN and one to route
> everything through ethernet) but I have no control over that.  I can't
> change the software.

Ah, the classic overconstrained problem.  Good luck.

At least the IP routing part of the solution should work.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
