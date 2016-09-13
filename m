From: Sekar D <sekar.linux@gmail.com>
Date: Tue, 13 Sep 2016 13:37:14 +0000
Subject: Re: CHAP Auth issue at CentOS-6.8
Message-Id: <CAGc3wVCy+=+0ej4ykJLQPcAsr6PquPbP=B95RByORPf1RS7_uQ@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAGc3wVD6QP4T4wzYsV0hiFU4aXqX0O0fka=f966jNfWCTb4OXA@mail.gmail.com>
In-Reply-To: <CAGc3wVD6QP4T4wzYsV0hiFU4aXqX0O0fka=f966jNfWCTb4OXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

Hi James,

Thanks for helping me.

Yes. It happens only when I bring up DSL line before 2 minutes. The
same DSL lines are working fine without any issue at CentOS-5.11. I
could see the issue only at CentOS-6.8. So I would like to know that I
need to configure more to avoid these issues.

debug log:
-------------
Sep 13 15:16:15 Linux pppd[9425]: pppd 2.4.5 started by it-amazon, uid 0
Sep 13 15:16:15 Linux pppd[9425]: using channel 62
Sep 13 15:16:15 Linux pppd[9425]: Using interface ppp0
Sep 13 15:16:15 Linux pppd[9425]: Connect: ppp0 <--> /dev/pts/6
Sep 13 15:16:15 Linux pppoe[9426]: PADS: Service-Name: ''
Sep 13 15:16:15 Linux pppoe[9426]: PPP session is 11525 (0x2d05)
Sep 13 15:16:16 Linux pppd[9425]: sent [LCP ConfReq id=3D0x1 <mru 1492>
<magic 0x539b3bc6>]
Sep 13 15:16:16 Linux pppd[9425]: rcvd [LCP ConfReq id=3D0x4c <mru 1492>
<auth chap MD5> <magic 0x22bf9b51>]
Sep 13 15:16:16 Linux pppd[9425]: sent [LCP ConfAck id=3D0x4c <mru 1492>
<auth chap MD5> <magic 0x22bf9b51>]
Sep 13 15:16:16 Linux pppd[9425]: rcvd [LCP ConfAck id=3D0x1 <mru 1492>
<magic 0x539b3bc6>]
Sep 13 15:16:16 Linux pppd[9425]: sent [LCP EchoReq id=3D0x0 magic=3D0x539b=
3bc6]
Sep 13 15:16:16 Linux pppd[9425]: rcvd [CHAP Challenge id=3D0x1
<24a06e14743d399c933b61865730ea63>, name =3D "BSLYO656"]
Sep 13 15:16:16 Linux pppd[9425]: sent [CHAP Response id=3D0x1
<502b6f4ee944310f014e0033e9b5438b>, name =3D "fti/hbufbty"]
Sep 13 15:16:16 Linux pppd[9425]: rcvd [LCP EchoRep id=3D0x0 magic=3D0x22bf=
9b51]
Sep 13 15:16:16 Linux pppd[9425]: rcvd [CHAP Failure id=3D0x1 "CHAP
authentication failure, unit 509"]
Sep 13 15:16:16 Linux pppd[9425]: CHAP authentication failed: CHAP
authentication failure, unit 509
Sep 13 15:16:16 Linux pppd[9425]: CHAP authentication failed
Sep 13 15:16:16 Linux pppd[9425]: sent [LCP TermReq id=3D0x2 "Failed to
authenticate ourselves to peer"]
Sep 13 15:16:16 Linux pppd[9425]: rcvd [LCP TermReq id=3D0x4d]
Sep 13 15:16:16 Linux pppd[9425]: sent [LCP TermAck id=3D0x4d]
Sep 13 15:16:16 Linux pppd[9425]: rcvd [LCP TermAck id=3D0x2]
Sep 13 15:16:16 Linux pppd[9425]: Connection terminated.
Sep 13 15:16:16 Linux pppd[9425]: Waiting for 1 child processes...
Sep 13 15:16:16 Linux pppd[9425]:   script /usr/sbin/pppoe -p
/var/run/pppoe-adsl-0.pid.pppoe -I eth1.101 -T 0 -U  -m 1412   , pid
9426
Sep 13 15:16:16 Linux pppoe[9426]: read (asyncReadFromPPP): Session
11525: Input/output error
Sep 13 15:16:16 Linux pppoe[9426]: Sent PADT
Sep 13 15:16:16 Linux pppd[9425]: Script /usr/sbin/pppoe -p
/var/run/pppoe-adsl-0.pid.pppoe -I eth1.101 -T 0 -U  -m 1412
finished (pid 9426), status =3D 0x1
Sep 13 15:16:16 Linux pppd[9425]: Exit.
Sep 13 15:16:16 Linux pppoe-connect: PPPoE connection lost; attempting
re-connection.

My config file :

USERCTL=3Dyes
BOOTPROTO=3Ddialup
NAME=3DDSLppp0
DEVICE=3Dppp0
TYPE=3DxDSL
ONBOOT=3Dno
PIDFILE=3D/var/run/pppoe-adsl-0.pid
FIREWALL=3DNONE
PING=3D.
PPPOE_TIMEOUT=80
LCP_FAILURE=3D3
LCP_INTERVAL0
CLAMPMSS=1412
CONNECT_POLL=3D6
CONNECT_TIMEOUT=20
SYNCHRONOUS=3Dno
ETH=3Deth1
PROVIDER=3DDSLppp0
USER=3D"xxxxxx"
PEERDNS=3Dno
DEMAND=3Dno
DEFAULTROUTE=3Dno


Thanks,


On Tue, Sep 13, 2016 at 6:40 PM, James Carlson <carlsonj@workingcode.com> w=
rote:
> On 09/13/2016 08:33 AM, Sekar D wrote:
>> I did not see kind of issue on CentOS-5.11 . Please let me know if I
>> need to change any config parameters.
>
> It's a little hard to tell.  What are your current configuration paramete=
rs?
>
> Have you tried running pppd with debugging enabled?  It would help to
> have a trace of the connection in order to diagnose the failure mode.
> The starting point is the pppd "debug" option, but if you're controlling
> this connection with ifup/ifdown scripts, you'll have to look at your
> system configuration to find out what pppd options are in use for that
> link.  One possible answer, if all else fails, would be to run this
> while the link is in the process of establishing:
>
>   ps -fp `pgrep -d, pppd` | cat
>
> (Yes, the "cat" is important; it tricks ps into printing the whole line.)
>
> What kind of connection is this?  That is, what's the underlying serial
> link?  Is it a physical wire on a serial port?  Is it a USB serial port?
>  Is it ISDN?  Is it PPPoE or PPTP or L2TP?  Is it something else?
>
> At a guess, the problem is on the remote end.  Typically, a user's PPP
> connection is set up to be a "client" -- that is, to reply to
> authentication requests from the peer and not to request authentication
> from the peer.  This means that the remote system you're talking to
> asked for your CHAP credentials, your system supplied them, and the
> remote system denied your access based on those credentials.
>
> If that only happens "sometimes" or is dependent on timing, then it
> sounds like the remote system has some kind of usage restriction.
>
> --
> James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
