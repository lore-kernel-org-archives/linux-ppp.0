From: Charles Price <cpwp@w3z.co.uk>
Date: Mon, 18 Oct 2004 15:09:57 +0000
Subject: Re: Kernel-mode PPPoE server.
Message-Id: <200410181609.57899.cpwp@w3z.co.uk>
List-Id: <linux-ppp.vger.kernel.org>
References: <200410181453.16399.cpwp@w3z.co.uk>
In-Reply-To: <200410181453.16399.cpwp@w3z.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Thanks, for the quick response, Michal...

> Try running an "strace" on the pppoe-server to see what system call
> fails.
>
I have posted the output of 'strace -f pppoe-server' to 
http://hognaston.com/strace.txt - I thought it might have been bad netiquette 
to post something of that length to a mailing list ;-)

There seem to be a number of entries in there that look like error messages in 
the output, but since I've not used strace before a second opinion would be 
appreciated.

> Also, a tcpdump log of the packets going back and forth would be useful.
>
pppoe2 root # tcpdump -i eth1 -n
tcpdump: WARNING: eth1: no IPv4 address assigned
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on eth1, link-type EN10MB (Ethernet), capture size 68 bytes
16:03:45.626913 PPPoE PADI [Service-Name] [Host-Uniq 0x1D180000] [EOL]
16:03:45.627118 PPPoE PADO [AC-Name "W3Z-2"] [Service-Name "W3Z"] [AC-Cookie 
0x7880E92E058E66DFBCE211A52AACD52592280000] [Host-Uniq 0x1D180000]
16:03:45.627242 PPPoE PADR [Service-Name] [Host-Uniq 0x1D180000] [AC-Cookie 
0x7880E92E058E66DFBCE211A52AACD52592280000]
16:03:45.627766 PPPoE PADS [ses 0x2] [Service-Name "W3Z"] [Host-Uniq 
0x1D180000]
16:03:46.627238 PPPoE  [ses 0x2] LCP, Conf-Request (0x01), id 1, MRU  1492, 
Magic-Num  0xf9397f65, length 14
16:03:49.627791 PPPoE  [ses 0x2] LCP, Conf-Request (0x01), id 1, MRU  1492, 
Magic-Num  0xf9397f65, length 14
16:03:52.628551 PPPoE  [ses 0x2] LCP, Conf-Request (0x01), id 1, MRU  1492, 
Magic-Num  0xf9397f65, length 14
16:03:55.629318 PPPoE  [ses 0x2] LCP, Conf-Request (0x01), id 1, MRU  1492, 
Magic-Num  0xf9397f65, length 14
16:03:58.630084 PPPoE  [ses 0x2] LCP, Conf-Request (0x01), id 1, MRU  1492, 
Magic-Num  0xf9397f65, length 14
16:04:01.630851 PPPoE  [ses 0x2] LCP, Conf-Request (0x01), id 1, MRU  1492, 
Magic-Num  0xf9397f65, length 14
16:04:04.631645 PPPoE  [ses 0x2] LCP, Conf-Request (0x01), id 1, MRU  1492, 
Magic-Num  0xf9397f65, length 14
16:04:07.632412 PPPoE  [ses 0x2] LCP, Conf-Request (0x01), id 1, MRU  1492, 
Magic-Num  0xf9397f65, length 14
16:04:10.633178 PPPoE  [ses 0x2] LCP, Conf-Request (0x01), id 1, MRU  1492, 
Magic-Num  0xf9397f65, length 14
16:04:13.633944 PPPoE  [ses 0x2] LCP, Conf-Request (0x01), id 1, MRU  1492, 
Magic-Num  0xf9397f65, length 14
16:04:16.641160 PPPoE PADT [ses 0x2] [Host-Uniq 0x1D180000] [Generic-Error 
"RP-PPPoE: System call error: Input/o..........."]
16:04:16.641313 PPPoE PADT [ses 0x2] [Generic-Error "Received PADT"]

16 packets captured
16 packets received by filter
0 packets dropped by kernel

Regards,

Charlie Price
