From: Matthew Percival <matthew@capgo.com>
Date: Wed, 01 Feb 2006 05:34:19 +0000
Subject: Re: Hot to perform a null login?
Message-Id: <1138772059.8869.23.camel@localhost.localdomain>
List-Id: <linux-ppp.vger.kernel.org>
References: <1138770376.8869.17.camel@localhost.localdomain>
In-Reply-To: <1138770376.8869.17.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

G'Day,

> Why would you want to do this? It is not at all clear that anything can
> understand a null login name.  Why do you think you need to send a null
> username

	Apparently that is what is required for the server I am connecting to.
You would need to ask the provider for why or how: I am just trying to
do what I have been told.

> You might have a line
> 
> ''    GSM  ''
> in /etc/pap-secrets and have
> user ''
> as an option for pppd.

	I just tried that, but it still defaulted to my local name.
From /var/log/syslog:
Feb  1 16:28:29 localhost pppd[15869]: sent [PAP AuthReq id=0x1
user="matthew" password=<hidden>]

	-- Matthew

