From: Alexey Osipov <simba@lerlan.ru>
Date: Sun, 19 Feb 2012 04:52:07 +0000
Subject: Re: PPP to MS RRAS Server Protocol errors
Message-Id: <1329627127.4667.11.camel@dahari>
List-Id: <linux-ppp.vger.kernel.org>
References: <loom.20120218T220252-25@post.gmane.org>
In-Reply-To: <loom.20120218T220252-25@post.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-ppp@vger.kernel.org

Hi, Rick!

В Сбт, 18/02/2012 в 21:11 +0000, Rick Blair пишет:
> hi all,
> 
> I can connect to a microsoft RRAS server on Windows 2003 server.
> 
> Setup Fedora 15 64 bit 
> Kernel 2.6.41.10-3
> 
> I am using wvdial
> 
> I successfully authenticate with MS-CHAP V2
> 
> PPP options
> nobsdcomp
> refuse-eap
> require-mppe-128
> mppe-stateful
> noaccomp
> nodeflate
> nopcomp
> 
> 
> Everything looks good,  except every packet I receive from the windows box I get
> Unsupported protocol xxxxx received
> 
> where xxx seems to have a fairly random value.
> Any clues?

I've ran in similar trouble a year ago. The difference in my case was
that I was connecting from windows box to linux server, but the issue
seems to be same.

You can look at my original post to this mail list here:
http://marc.info/?l=linux-ppp&m9753728204109&w=2

But I had no response to that. It seems, nobody here is interested in
getting stateful mppe encryption work. MPPE stateless mode works good,
however.

Alexey.

