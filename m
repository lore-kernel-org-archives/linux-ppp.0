From: =?UTF-8?Q?David_Bala=C5=BEic?= <xerces9@gmail.com>
Date: Thu, 23 Apr 2020 10:37:41 +0000
Subject: Re: PPPoE Modem hangup after random time - how to debug?
Message-Id: <CAPJ9Yc_C0tAi5RrzK--rugHQpaE1UigqHUX4vWWuwg_kMfmqPw@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
In-Reply-To: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

Some more info:

 - the connect time is random:
# logread  | grep "Connect time"
Wed Apr 22 16:42:18 2020 daemon.info pppd[7960]: Connect time 1742.8 minute=
s.
Wed Apr 22 19:13:03 2020 daemon.info pppd[9563]: Connect time 150.7 minutes.
Thu Apr 23 09:38:31 2020 daemon.info pppd[9884]: Connect time 865.5 minutes.



 - the assigned IP address is different on each connection


 - logs
On Thu, 23 Apr 2020 at 00:00, James Carlson <carlsonj@workingcode.com> wrot=
e:
>
> On 2020-04-22 13:45, David Bala=C5=BEic wrote:
> > Hi!
> >
> > I have a router running openwrt connected to a GPON ONT, running a
> > PPPoE connection (hw details below).
>
> This looks to be (possibly) a PPPoE failure, though there's nothing
> interesting in the log messages provided.  If there were an interesting
> log message, it would almost certainly come somewhere (perhaps even
> *minutes*) before that initial "Modem hangup" message.

Nothing there:

Thu Apr 23 08:59:02 2020 daemon.info hostapd: wlan0: STA
58:XX:XX:XX:XX:b9 IEEE 802.11: deauthenticated due to inactivity
(timer DEAUTH/REMOVE)
Thu Apr 23 09:38:31 2020 daemon.notice pppd[9884]: Modem hangup

I'll try packet capture next.

Regards,
David
