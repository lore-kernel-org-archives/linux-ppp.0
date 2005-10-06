From: John Horne <john.horne@plymouth.ac.uk>
Date: Thu, 06 Oct 2005 16:40:51 +0000
Subject: Re: Radius plugin failover - not working?
Message-Id: <1128616852.6168.16.camel@jhorne.csd.plymouth.ac.uk>
List-Id: <linux-ppp.vger.kernel.org>
References: <1128531556.19093.60.camel@jhorne.csd.plymouth.ac.uk>
In-Reply-To: <1128531556.19093.60.camel@jhorne.csd.plymouth.ac.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Wed, 2005-10-05 at 17:59 +0100, John Horne wrote:
> 
> We have a server running Fedora Core 3 linux (2.6.12-1.1372_FC3 kernel),
> with pptpd 1.2.2, freeradius 1.0.1, and ppp 2.4.3 (with mppe/mppc patch)
> and the radius plugin. This is all used as a VPN server for mainly
> Windows XP clients using mppe/pptp. This works fine - the radius plugin
> talks fine with the local radius server.
> 
> However, I have being testing failover with another server using the
> same software, and the failover does not seem to work.
>
Hello,

Okay, you can ignore this. It was due to my misunderstanding of the
'key' in the radiusclient/servers file. I have now corrected this, and
failover works fine :-)

Sorry for the hassle.



John.

-- 
---------------------------------------------------------------
John Horne, University of Plymouth, UK  Tel: +44 (0)1752 233914
E-mail: John.Horne@plymouth.ac.uk       Fax: +44 (0)1752 233839

