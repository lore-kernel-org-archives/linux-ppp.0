From: "Kristian R. Evensen" <kristrev@simula.no>
Date: Tue, 22 May 2012 20:50:37 +0000
Subject: Re: PPP connection stuck at bad configuration-ack
Message-Id: <CAN0ddOmYw112+y2BvYJt3FJKqwv_U58gOYNnJqfPJchxMeZLyw@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAN0ddOm5akxZaAJ-VN4fgSAVOKEOEaXNoUkHXhDdKe4UAMjv1w@mail.gmail.com>
In-Reply-To: <CAN0ddOm5akxZaAJ-VN4fgSAVOKEOEaXNoUkHXhDdKe4UAMjv1w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

Thank you very much for a detailed reply.

On 22 May 2012 20:24, James Carlson <carlsonj@workingcode.com> wrote:
>
> Note just how terribly invalid that reply from the peer really is. =A0He's
> sending us a Configure-Nak, but every single "hint" value exactly
> matches what we sent in our Configure-Request. =A0That's just beyond the
> pale; if what you're "negatively acknowledging" exactly matches what the
> peer is asking, you really should have just acknowledged it, right?

Yes, I agree, I also thought this was very strange behavior.

>
> My guess (and it's just a guess at this point) is that this "huawei"
> thing is one of those horrible 3G access devices that mangles PPP. =A0The
> 3G "standard" specifies that the access server must lie to the client
> and return success during the authentication phase, even if the user
> name and/or password are completely wrong, or if the named user does not
> have the requested network service authorization. =A0The only way you find
> out that something is wrong under this "standard" is when you ask for an
> IP address and the peer is unable to supply one.

Yes, it is a 3g modem and its exact behavior is of course company
secret and undocumented. However, I dont think the configuration of
the modem is the problem, as I have tried the same type of modem with
other ISPs and it works.

> Most likely, your PAP user name "nne5" or password is incorrect or you
> don't have the right configuration set up in the chat script.

I suspect authentication, as the same modem works for other ISPs with
the same chatscript. Thank you very much for pointing me in this
direction.

-Kristian
