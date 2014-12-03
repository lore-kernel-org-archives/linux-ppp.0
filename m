From: James Carlson <carlsonj@workingcode.com>
Date: Wed, 03 Dec 2014 11:46:38 +0000
Subject: Re: Delayed error message
Message-Id: <547EF81E.7040003@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <2ECB8EB7-DED1-40E2-AD43-A3112183047E@rajancraveri.it>
In-Reply-To: <2ECB8EB7-DED1-40E2-AD43-A3112183047E@rajancraveri.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 12/02/14 17:50, Rajan Craveri wrote:
> Hi, when for some reasons the connection fails
> I receive a delayed message in prompt
> Is there a way to avoid that delayed message?
> 
> I need keep the screen clean after boot in a museum installation.

I think you might need to provide a little more detail on exactly what
message you're getting and what the word "prompt" means in this context.

At a guess, the problem is that there's a rule in your /etc/syslog.conf
(or /etc/rsyslog.conf on some Linux systems) that is directing messages
for 'daemon' to /dev/console.

pppd always writes to syslog, with severity level based on the nature of
the problem.  It never writes a message above "error" severity, so as
long as only "daemon.crit" (and above) are directed to the console, you
shouldn't have that problem.

But that's just a guess.  I don't know whether the message you're
talking about is from pppd or from the kernel or is possibly from
something unrelated to PPP.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
