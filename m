From: "Michael St. Laurent" <mikes@hartwellcorp.com>
Date: Thu, 30 Oct 2008 19:40:08 +0000
Subject: RE: Banyan Vines
Message-Id: <3BF93070B3D1B047BA7ABF612958950D0483EBD1@hcex.hartwellcorp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <W9913123352266171225199214@webmail4>
In-Reply-To: <W9913123352266171225199214@webmail4>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Might it not also be that the client connecting has the Banyan Vines
protocol installed?

> -----Original Message-----
> From: linux-ppp-owner@vger.kernel.org [mailto:linux-ppp-
> owner@vger.kernel.org] On Behalf Of James Carlson
> Sent: Tuesday, October 28, 2008 7:03 AM
> To: tony.chamberlain@lemko.com
> Cc: linux-ppp@vger.kernel.org
> Subject: Re: Banyan Vines
> 
> tony.chamberlain@lemko.com writes:
> > Does anyone know what it means if you are running pptp and in
> > /var/log/messages you get a message "unsupported protocol Banyan
Vines"
> > (along with a lot of unsupported protocol messages which are just
> > hex values), or what to do about it?
> 
> It means you're getting garbled packets from the peer.
> 
> If it's persistent and doesn't correct itself over time, the most
> plausible reason (I think) would be that you're using MPPE (MS
> proprietary packet encryption) and there's a bug in that code.
> 
> If it just happens intermittently and then fixes itself, I'd ignore
> it.  The cause would be dropped or corrupted packets and recovery by
> the encryption code.
> 
> --
> James Carlson         42.703N 71.076W
<carlsonj@workingcode.com>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-ppp"
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

This e-mail may contain technical information which is controlled by the United States Government, Department of State, International Traffic & Arms Regulations (ITAR) (22 CFR 120-130) which requires an export license prior to sharing with foreign persons. Lacking such license, ITAR technical data is limited to US Legal Residents only. It is the responsibility of the organization and individual in control of this data to abide by US export laws. If you are not a US Legal Resident, immediately forward this e-mail to notify@hartwellcorp.com or reply to sender without reading any further. Take no other action with this e-mail until contacted.

Notice:  The information in this document and document itself, in whole or in part, in any form ("Information") is proprietary and/or confidential property of Hartwell Corporation, Placentia, California.  Hartwell Corporation and its successors and assignees retain and reserve all right, title and interest in this information in whole or in part and in all forms.  This Information is provided to the original recipient only for confidential use, with the understanding that it will not be used in any manner detrimental to the interests of Hartwell Corporation, and subject to return on request.  Reproduction, transmission, distribution or publication of this Information in any form, in whole or in part, for any purpose without prior written permission of Hartwell Corporation is strictly prohibited.

