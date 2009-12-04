From: Diederik Hattingh <diederikjhattingh@gmail.com>
Date: Fri, 04 Dec 2009 08:35:37 +0000
Subject: Fwd: VPN to windows ISA server
Message-Id: <d68727470912040035h4f58561ai7a8ea36df69c445@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On Mon, Nov 30, 2009 at 1:10 AM, James Carlson <carlsonj@workingcode.com> w=
rote:
> Diederik Hattingh wrote:
>> Nov 29 14:29:35 [pppd] sent [LCP ConfAck id=3D0x2 <asyncmap 0x0> <magic
>> 0x15190f75> <accomp>]
>
> It looks like you've trimmed away the beginning of the negotiation in
> the debug information you posted. =A0That's unfortunate, as this likely
> includes important details that will be needed to resolve the problem.
>
> In the future, don't do that.

Oops, sorry.

>
>> I read online that the NT Domain part must be left blank, but the
>> domain added as prefix, as described above, to the username. =A0Is this
>> still valid?
>
> It depends on how the NT server is configured. =A0There's no way to know
> without asking the administrator of that system.

Our system administrator =A0informed me, and from what I have read
online, it must always be "myworkdomain\username" =A0I specified the
domain separately, and also the username as mentioned before.

>
>> # Secrets for authentication using CHAP
>> # client =A0 =A0 =A0 =A0server =A0secret =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0IP addresses
>> myworkdomain\\djh =A0 =A0 =A0 myworkdomain =A0 =A0*****
>> myworkdomain =A0 =A0myworkdomain\\djh =A0 =A0 =A0 *****
>
> The second of those looks bogus; you would never identify yourself to
> the peer as though your name were just "myworkdomain". =A0I would have had
> this for the first entry:
>
> myworkdomain\\djh =A0 =A0 =A0 * =A0 =A0 =A0 "my secret here"
>
> It shouldn't be necessary (or helpful) to specify the server's name in
> the second column, particularly as Microsoft systems tend to refuse to
> identify themselves.
>
> As for the double line seen in your configuration file, it looks to me
> like whoever (or whatever) added it this way was confused about how that
> file actually works.

pptp-command made that file. =A0Not sure why it wrote both lines?
My pasword has a "#" in it. =A0So to wrap it in quotes was essential.

>
>> Notice that the connection server is called server.myworkdomain.co.za,
>> but the domain I specified as myworkdomain (without .co.za)
>
> I don't believe that NT authentication domains have anything to do with
> DNS domain names. =A0They're wholly unrelated concepts. =A0You can't just
> lop off the trailing ".co.za" and expect it to work, unless the NT
> authentication domain (part of Kerberos, I think) just happens to be the
> same as that portion of the DNS name by coincidence. =A0You need to have
> proper NT authentication credentials if you're going to use MS-CHAPv2.
>

The domain was just called myworkdomain.

Another factor that really threw me off track was that the server I
was trying to connect to had an open port 1723, but no VPN service was
running on the server. =A0The real address was
server2.myworkdomain.co.za. =A0Our IT guys help with this regard. =A0In
retrospect, I would have saved lots of time by following
http://pptpclient.sourceforge.net/howto-diagnosis.phtml#fault_tree to
the letter.

Thanks for the help James
Diederik
