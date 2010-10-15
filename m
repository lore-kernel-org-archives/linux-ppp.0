From: Sujit K M <sjt.kar@gmail.com>
Date: Fri, 15 Oct 2010 10:34:30 +0000
Subject: Re: [PATCH] pppoe: Missed check for destination addr in PADT frame processing
Message-Id: <AANLkTinOVGrHb=mKRGkk1MjxYJOgZeZYOMKKOUJ3V=_o@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <AANLkTim5m4f-7U4kMghBR0yEQka3-iOaJ9aHwf4sGsxj@mail.gmail.com>
In-Reply-To: <AANLkTim5m4f-7U4kMghBR0yEQka3-iOaJ9aHwf4sGsxj@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On Wed, Oct 13, 2010 at 6:03 PM, Leonid Lisovskiy <lly.dev@gmail.com> wrote:
> =A0One of our customer encountered sporadic disconnects problem with
> his ISP when using kernel PPPoE driver. After some investigation, we

I am facing similar sort of disconnect at times when you have for example
having two PPPOE Connections Running, This is very specific example to
your case. My Case is that on an DSL Line When you browse and speak over
the Phone the DSL line Drop's. But once I contacted the Service Provider, T=
hey
Corrected It. I think It might have been an switch problem.


> discovered that it happens due to PADT frames being received with
> destination MAC not matching the client MAC even though they have
> proper source MAC and session_id. It seems that these ISP use very

This seems to be a wrong way of interpreting the scenario. I think It shoul=
d be
proper source MAC and session_id.

> cheap equipment that doesn't provide generation of unique
> session_id's. User-space rp-pppoe 3.10 works correctly in this case
> since it has an additional check for destination MAC in PADT frame
> processing.

Above seems to be acceptable for most of the Modem's.
