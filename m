From: James Cameron <quozl@laptop.org>
Date: Fri, 11 Mar 2011 03:45:28 +0000
Subject: Re: pptponfig centos 5.4
Message-Id: <20110311034528.GH6776@us.netrek.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <W6630510430284451299766958@webmail23>
In-Reply-To: <W6630510430284451299766958@webmail23>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Fri, Mar 11, 2011 at 03:09:19AM +0000, tony.chamberlain@lemko.com wrote:
> Yeah I did pptpsetup -whatever (i put all the parameters in and called
> the connection "hill"  Then I did "pppd call hill".  That connected,
> set up my IP and routes and I had ppp connections for a few minutes (5
> or so) but then it would disconnect again

common symptom.  further diagnosis would involve pppd debug logs most
likely.

-- 
James Cameron
http://quozl.linux.org.au/
