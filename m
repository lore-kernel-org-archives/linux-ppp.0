From: Frank Krauss <fmfkrauss@mindspring.com>
Date: Thu, 10 Jun 2004 16:04:08 +0000
Subject: Re: Specifing Hays Extended Command Set in PPP 2.4.1
Message-Id: <200406101204.08263.fmfkrauss@mindspring.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <200406081914.35819.fmfkrauss@mindspring.com>
In-Reply-To: <200406081914.35819.fmfkrauss@mindspring.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello Bill,

Thank you very much for your feedback.

That was exactly my problem.  I had to put anything that had special 
characters within Single Quotes.  Then It worked perfect.

Just for your Information, concerning this particular Modem, 
I had to specify the exact same string as my first set of AT commands
as was created by the MINICOM program when it iniatializes the Modem.
When I specified that String as my first one, the Modem is now working
great with PPP/CHAT.

Thank you again for your great information.

Yours truly,

Frank

===========================
On Tuesday 08 June 2004 19:41, Bill Unruh wrote:
> On Tue, 8 Jun 2004, Frank Krauss wrote:
> > Hello everyone,
> >
> > I'm attempting to specify a value in a CHAT Script for an AT command
> > that has a & in it.
> >
> > This is because it is a Hays Extended Command Set value.  For example:
> > "" ATX1&S1E1Q0
> >
> > Whenever I specify this type of command in a String, I get the
> > following message:
> >
> > Can't get terminal parameters: inappropriate IOCTL for device
> >
> > If I remove the command with the & in it, the rest of the command runs
> > fine. I know that the command itself is good since when I run it under
> > MINCOM, the entire stmt runs fine.
>
> "" 'ATX1&S1E1Q0'
>
> Try putting it in quotes. The shell is probably interpreting the &
> rather than its being sent to the chat script ( give the chat script the
> -v option, make sure that you have
> local2.*;daemon.*		/var/log/ppplog
> in /etc/syslog.conf and see what is actually sent to the modem)
>
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

