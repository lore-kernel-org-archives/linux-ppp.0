From: Johan Gill <johane@lysator.liu.se>
Date: Thu, 04 Mar 2004 16:10:31 +0000
Subject: Re: Strange problem seeing certain websites over dial-up connection
Message-Id: <404754F7.3070707@lysator.liu.se>
List-Id: <linux-ppp.vger.kernel.org>
References: <404705F7.40308@lysator.liu.se>
In-Reply-To: <404705F7.40308@lysator.liu.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

James Carlson wrote:

> What MRU do you have configured? 


> At just a wild guess, if it'sanything other than the default of 1500, 
> you're likely forcing the
>
>access server to do PMTU discovery, and if there's a broken firewall
>in front of those web servers, you may have trouble reaching them.
>
>  
>
What do you know...it was way too low, my dial script messed it up. 
Thank you!

/Johan Gill <johane@lysator.liu.se>

