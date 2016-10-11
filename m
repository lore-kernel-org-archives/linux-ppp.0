From: Bill Unruh <unruh@physics.ubc.ca>
Date: Tue, 11 Oct 2016 16:35:42 +0000
Subject: Re: pppd and plugin license
Message-Id: <alpine.LMD.2.03.1610110932090.17805@physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <2c8a99fe282448d4b8c07b347fde7d78@svr-ies-mbx-01.mgc.mentorg.com>
In-Reply-To: <2c8a99fe282448d4b8c07b347fde7d78@svr-ies-mbx-01.mgc.mentorg.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

For two licenses, the restrictions of both apply. For GPL, if the other
license restricts anything that GPL allows, then GPL does not give you a
license. Thus you have to see if there is anything in the BSD license which
restricts what the GPL grants. Also you need to check which GPL license (2 3
Library,...)

If you have real question about the law, a lawyer is the best source of
advice (one that is competent in Copyright and licensing law).


William G. Unruh __| Canadian Institute for|____ Tel: +1(604)822-3273
Physics&Astronomy _|___ Advanced Research _|____ Fax: +1(604)822-5324
UBC, Vancouver,BC _|_ Program in Cosmology |____ unruh@physics.ubc.ca
Canada V6T 1Z1 ____|____ and Gravity ______|_ www.theory.physics.ubc.ca/

On Tue, 11 Oct 2016, Waller, Claus wrote:

> Hello,
>
> I have a question about the pppd and the plugin licenses.
>
> As I can see the pppd has as license the old style BSD 4 Clause license and some of the plugins which are loaded as a dynamic library are GPL licensed.
> So my question is: Is it true that these licenses are incompatible to each other in the context of the pppd + a loaded plugin?
