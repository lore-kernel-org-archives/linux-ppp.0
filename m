From: Bill Unruh <unruh@physics.ubc.ca>
Date: Tue, 08 Jun 2004 23:41:09 +0000
Subject: Re: Specifing Hays Extended Command Set in PPP 2.4.1
Message-Id: <Pine.LNX.4.50.0406081638330.6334-100000@string.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <200406081914.35819.fmfkrauss@mindspring.com>
In-Reply-To: <200406081914.35819.fmfkrauss@mindspring.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Tue, 8 Jun 2004, Frank Krauss wrote:

> Hello everyone,
> 
> I'm attempting to specify a value in a CHAT Script for an AT command
> that has a & in it.
> 
> This is because it is a Hays Extended Command Set value.  For example:
> "" ATX1&S1E1Q0
> 
> Whenever I specify this type of command in a String, I get the 
> following message:
> 
> Can't get terminal parameters: inappropriate IOCTL for device
> 
> If I remove the command with the & in it, the rest of the command runs fine.
> I know that the command itself is good since when I run it under MINCOM,
> the entire stmt runs fine.

"" 'ATX1&S1E1Q0'

Try putting it in quotes. The shell is probably interpreting the &
rather than its being sent to the chat script ( give the chat script the
-v option, make sure that you have 
local2.*;daemon.*		/var/log/ppplog
in /etc/syslog.conf and see what is actually sent to the modem)


