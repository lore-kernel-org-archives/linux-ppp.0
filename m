From: James Carlson <carlsonj@workingcode.com>
Date: Sun, 29 Nov 2009 23:10:50 +0000
Subject: Re: VPN to windows ISA server
Message-Id: <4B12FF7A.70706@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <d68727470911290541h3531b46cs45db474472bc7975@mail.gmail.com>
In-Reply-To: <d68727470911290541h3531b46cs45db474472bc7975@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Diederik Hattingh wrote:
> Nov 29 14:29:35 [pppd] sent [LCP ConfAck id=0x2 <asyncmap 0x0> <magic
> 0x15190f75> <accomp>]

It looks like you've trimmed away the beginning of the negotiation in
the debug information you posted.  That's unfortunate, as this likely
includes important details that will be needed to resolve the problem.

In the future, don't do that.

> Nov 29 14:29:35 [pppd] MPPE required, but MS-CHAP[v2] auth not performed.

That looks like the key problem here.  You need to do MS-CHAPv2 with the
peer in order to use MPPE.  Either your system is misconfigured such
that it doesn't do MS-CHAPv2, or the peer just refuses to allow that
authentication mechanism.

> I added my CHAP "secret" with pptp-command.  Adding the secret does
> not add the "*" for IP address coloum in the  "/etc/ppp/chap-secrets
> file, is this normal?

Only the authenticator ("server") side of the connection needs that
extra column in the chap-secrets file, so this part of the configuration
is normal.

> Another question is the format of the domain\username.  In the secret
> file for chap, the example was "domain\\username". Should this be the
> same for the "user" value in the peer file?

Yes.  pppd doesn't actually know anything about "domain" names or
anything like that.  It just passes the string along to the peer (the
Windows server system), and that's what will parse out the domain and
user name.  Thus, you have to use the same string everywhere.

> I read online that the NT Domain part must be left blank, but the
> domain added as prefix, as described above, to the username.  Is this
> still valid?

It depends on how the NT server is configured.  There's no way to know
without asking the administrator of that system.

> # Secrets for authentication using CHAP
> # client        server  secret                  IP addresses
> myworkdomain\\djh       myworkdomain    *****
> myworkdomain    myworkdomain\\djh       *****

The second of those looks bogus; you would never identify yourself to
the peer as though your name were just "myworkdomain".  I would have had
this for the first entry:

myworkdomain\\djh	*	"my secret here"

It shouldn't be necessary (or helpful) to specify the server's name in
the second column, particularly as Microsoft systems tend to refuse to
identify themselves.

As for the double line seen in your configuration file, it looks to me
like whoever (or whatever) added it this way was confused about how that
file actually works.

> Notice that the connection server is called server.myworkdomain.co.za,
> but the domain I specified as myworkdomain (without .co.za)

I don't believe that NT authentication domains have anything to do with
DNS domain names.  They're wholly unrelated concepts.  You can't just
lop off the trailing ".co.za" and expect it to work, unless the NT
authentication domain (part of Kerberos, I think) just happens to be the
same as that portion of the DNS name by coincidence.  You need to have
proper NT authentication credentials if you're going to use MS-CHAPv2.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
