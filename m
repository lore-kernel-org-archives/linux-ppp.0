From: James Carlson <carlsonj@workingcode.com>
Date: Wed, 23 Jan 2013 12:25:07 +0000
Subject: Re: PPP on TP-Link router?
Message-Id: <50FFD6A3.2010506@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <50FF425E.4000208@mbm.vn>
In-Reply-To: <50FF425E.4000208@mbm.vn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-ppp@vger.kernel.org

On 01/22/13 21:23, Nguyễn Hồng Quân wrote:
> Here is my log:
> http://paste.ubuntu.com/1561429/

The logs show what appears to be a low-level communications problem.
We're receiving fine, but the peer cannot receive the messages we're
sending.

If you're able to get diagnostic information out of the peer, you may be
able to find out what is going wrong, but I think it's more likely that
a problem like this will require a dedicated external Ethernet analyzer
to figure out whether or not your system is sending correctly-formed
messages.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
