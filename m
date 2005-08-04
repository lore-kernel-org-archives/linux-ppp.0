From: Paul Mackerras <paulus@samba.org>
Date: Thu, 04 Aug 2005 22:24:15 +0000
Subject: Re: [PATCH][PPP] ppp_generic: Add checks for NULL pointers
Message-Id: <17138.38287.648439.271259@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.LNX.4.61.0508040053050.14176@linux08.ece.utexas.edu>
In-Reply-To: <Pine.LNX.4.61.0508040053050.14176@linux08.ece.utexas.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: youssef@ece.utexas.edu
Cc: linux-kernel@vger.kernel.org, linux-ppp@vger.kernel.org

Hmamouche, Youssef writes:

> This patch adds two checks for NULL pointers.

OK, but get the whitespace right please - use tabs not spaces for
indentation, and put a space between "if" and "(".  See
Documentation/CodingStyle.

Paul.
