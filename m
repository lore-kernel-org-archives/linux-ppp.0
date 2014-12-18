From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 18 Dec 2014 21:24:39 +0000
Subject: Re: PPP compression
Message-Id: <54934617.403@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <3b4526880d737ed5094d632636e6fef8@great.ufc.br>
In-Reply-To: <3b4526880d737ed5094d632636e6fef8@great.ufc.br>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 12/18/14 15:49, arthurpaulino wrote:
> We configured a PPTP VPN server with no encryption. The compression
> algorithm negotiated during the connection phase is Deflate.

The simplest method (of course) would be to disable compression and just
avoid the issue.

But assuming you don't want to do that, there are two other options:

- If you're actually running pppd, you could use the "record" option
  to record raw data and then dump using pppdump.  That tool has a
  "-d" option to decompress this kind of data.

- If you're not running pppd, and have just GRE-encapsulated data
  captured off the network, then I suggest writing a small tool that
  will extract the PPP frames (ff 03 ...) and rewrite them to a file
  in the very simple format that pppdump expects so that you can use
  pppdump to display them.

The file format can be deduced by looking at the code in pppdump.c.
For a really trivial converter (payload only), you can use:

  01 LL LL ...   - sent data, where LLLL is the number of bytes in
                   big endian (network byte order) format.
  02 LL LL ...   - received data, same format.

Note that pppdump expects the data to be AHDLC encoded (!) so you
have to do that before doing the encoding above.  AHDLC is pretty
simple; replace any instance of 7D or 7E in the data with 7D 5D or 7D 5E
(respectively) and then end the frame with 7E.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
