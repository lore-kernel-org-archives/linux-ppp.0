From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 28 Jul 2005 17:33:35 +0000
Subject: Re: Authentificating with certificates ("unknown authentication type 13; Naking")
Message-Id: <17129.5871.982327.392349@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <e8666cf9050727142635284b29@mail.gmail.com>
In-Reply-To: <e8666cf9050727142635284b29@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Boky Gmail writes:
> Note: resending; it seems it didn't get through the first time round.

No, it came through fine the first time.

> I was wondering if it is possible to use certificates instead of
> passwords for authentification over PPTP?

"Possible"?  Sure; you've got source code.

> EAP: unknown authentication type 13; Naking

That's EAP-TLS.  At least for debug, we should add decoding of the
well-known types.

> Now, I know for a fact that our administrator has certificate-only VPN
> login policy in place.

Sounds likely.

> I am suspecting that "EAP: unknown authentication type 13; Naking"
> means that the server requested certificate-based authentification but
> the client does not have any implementation to handle this and
> therefor the conection terminated.

Right.

> Is my hunch correct?

Yes.

> If it is, will certificate authentification be ever possible?

Sure; it's possible.

> If so,
> is there an ETA? A feature-request, perhaps?

Unless you're volunteering to write the code or know some who is
volunteering (and has the right equipment to test the results
properly), then I can't imagine what the ETA would be.  This is open
source; things get done because someone cares about the result, not
_just_ because there's a request.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
