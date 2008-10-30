From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 30 Oct 2008 20:09:01 +0000
Subject: RE: Banyan Vines
Message-Id: <18698.5213.907486.11830@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <W9913123352266171225199214@webmail4>
In-Reply-To: <W9913123352266171225199214@webmail4>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Michael St. Laurent writes:
> Might it not also be that the client connecting has the Banyan Vines
> protocol installed?

That's probably _really_ unlikely in 2008.  ;-}

Plus, the original poster noted that he had this:

> > > (along with a lot of unsupported protocol messages which are just
> > > hex values), or what to do about it?

That almost certainly makes Banyan Vines a red herring.  We just
happened to see a corrupted packet that started with hex 35 or 00 35.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
