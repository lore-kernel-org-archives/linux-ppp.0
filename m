From: Rick Blair <rickblair@mac.com>
Date: Sat, 18 Feb 2012 21:11:20 +0000
Subject: PPP to MS RRAS Server Protocol errors
Message-Id: <loom.20120218T220252-25@post.gmane.org>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

hi all,

I can connect to a microsoft RRAS server on Windows 2003 server.

Setup Fedora 15 64 bit 
Kernel 2.6.41.10-3

I am using wvdial

I successfully authenticate with MS-CHAP V2

PPP options
nobsdcomp
refuse-eap
require-mppe-128
mppe-stateful
noaccomp
nodeflate
nopcomp


Everything looks good,  except every packet I receive from the windows box I get
Unsupported protocol xxxxx received

where xxx seems to have a fairly random value.
Any clues?

Thanks







