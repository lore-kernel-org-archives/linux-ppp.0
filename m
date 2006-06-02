From: Marcos Dione <mdione@fcq.unc.edu.ar>
Date: Fri, 02 Jun 2006 16:10:35 +0000
Subject: Re: 4 adsl lines in one nic
Message-Id: <20060602131035.sdpe7qwh59c084ow@webmail.fcq.unc.edu.ar>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

Quoting Bill Unruh <unruh@physics.ubc.ca>:
> On Thu, 1 Jun 2006, Marcos Dione wrote:
>>  hi all. first of all, I'm not suscribed to this list, so please cc: me =
in
>> the answers. I hope my preventive cc: to myself does the work for you; j=
ust
>> =ABreply-to-all=BB.
>>
>>  I'm setting up a machine with 4 ADSL lines connected to the same nic vi=
a a
>> switch. I'm not sure this is `supported=B4 or if I should add the 3 extr=
a nics
>> it `should=B4 have.
>
> No idea what it is that you are trying to accomplish. By switch, do you
> mean a physical rotary type switch, or an ethernet switch.
> The adsl lines I assume come into modems. Then you have an ethernet
> connection from the modem to the "switch". Why? Why would you want 4 ADSL
> lines? How are you going to route them?

  yes, it's an ethernet switch. the four adsl lines will be connected to one
machine and used in a load balancing scheme, but that? another story. we're
connecting the 4 lines to one nic due to hardware limitations.

> Then are you running pppoe on those lines? Is that what the relationship =
to
> ppp is?

  I need to run pppoe on these lines to get the service.

> Not surprising you cannot do proxyarp. The machines MUST be on the same
> subnet to do proxyarp.

  it's not my problem. I should have ommited that line.

>>  I'm starting to think that those are configure-acks `routed=B4 to the w=
rong
>> pppd, because if I bring up one line at a time, all establish the connec=
tion
>> succesfully. I just wanted to make sure I was reaching to the correct
>> conclusion.
>>
>>  also, would it be possible to make pppd abort if too much bad
>> configure-acks? since I'm the one with the problem, I'm interested=20
>> in hacking
>
> Why? especially since it eventually works?

  it works *sometimes*.

>> that. do you think it does any sense, or should I stop doing stupid=20
>> things and
>> put one nic per ADSL line?
>
> If you are paid more than 10 cents per hour, that would probably be cheap=
er.

  not everything is money. now I'm plain wondering if this could work or no=
t.

--=20
Marcos Dione
Departamento de C=F3mputos
Facultad de Ciencias Qu=EDmicas - UNC

----------------------------------------------------------------
Facultad de Ciencias Qu=C3micas - Universidad Nacional de C=C3rdoba

