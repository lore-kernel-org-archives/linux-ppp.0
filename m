From: =?UTF-8?Q?David_Bala=C5=BEic?= <xerces9@gmail.com>
Date: Fri, 24 Apr 2020 14:02:52 +0000
Subject: Re: PPPoE Modem hangup after random time - how to debug?
Message-Id: <CAPJ9Yc8O5t9ak_AB51We6w=EnURkbUjS1hXDHAuCroGLjeUxOg@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
In-Reply-To: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-ppp@vger.kernel.org

Sorry for another post, but I just noticed I had a disconnect again,
this time I captured the LCP traffic with: tcpdump -evpni eth1.3902
'not ether[0x14:2] = 0x21 and not ether[0x14:2] = 0x57'


10:42:01.795885 c4:xx:xx:xx:xx:ed > a4:xx:xx:xx:xx:44, ethertype PPPoE
S (0x8864), length 30: PPPoE  [ses 0x1] LCP (0xc021), length 10: LCP,
Echo-Request (0x09), id 20, length 10
        encoded length 8 (=Option(s) length 4)
          Magic-Num 0x277f6119
10:42:01.807239 a4:xx:xx:xx:xx:44 > c4:xx:xx:xx:xx:ed, ethertype PPPoE
S (0x8864), length 56: PPPoE  [ses 0x1] LCP (0xc021), length 10: LCP,
Echo-Reply (0x0a), id 20, length 10
        encoded length 8 (=Option(s) length 4)
          Magic-Num 0x631aa5be
10:42:04.799255 c4:xx:xx:xx:xx:ed > a4:xx:xx:xx:xx:44, ethertype PPPoE
S (0x8864), length 30: PPPoE  [ses 0x1] LCP (0xc021), length 10: LCP,
Echo-Request (0x09), id 21, length 10
        encoded length 8 (=Option(s) length 4)
          Magic-Num 0x277f6119
10:42:04.809234 a4:xx:xx:xx:xx:44 > c4:xx:xx:xx:xx:ed, ethertype PPPoE
S (0x8864), length 56: PPPoE  [ses 0x1] LCP (0xc021), length 10: LCP,
Echo-Reply (0x0a), id 21, length 10
        encoded length 8 (=Option(s) length 4)
          Magic-Num 0x631aa5be
10:42:06.801533 c4:xx:xx:xx:xx:ed > a4:xx:xx:xx:xx:44, ethertype PPPoE
S (0x8864), length 30: PPPoE  [ses 0x1] LCP (0xc021), length 10: LCP,
Echo-Request (0x09), id 22, length 10
        encoded length 8 (=Option(s) length 4)
          Magic-Num 0x277f6119
10:42:06.807236 a4:xx:xx:xx:xx:44 > c4:xx:xx:xx:xx:ed, ethertype PPPoE
S (0x8864), length 56: PPPoE  [ses 0x1] LCP (0xc021), length 10: LCP,
Echo-Reply (0x0a), id 22, length 10
        encoded length 8 (=Option(s) length 4)
          Magic-Num 0x631aa5be
10:42:08.803817 c4:xx:xx:xx:xx:ed > a4:xx:xx:xx:xx:44, ethertype PPPoE
S (0x8864), length 30: PPPoE  [ses 0x1] LCP (0xc021), length 10: LCP,
Echo-Request (0x09), id 23, length 10
        encoded length 8 (=Option(s) length 4)
          Magic-Num 0x277f6119
10:42:08.817232 a4:xx:xx:xx:xx:44 > c4:xx:xx:xx:xx:ed, ethertype PPPoE
S (0x8864), length 56: PPPoE  [ses 0x1] LCP (0xc021), length 10: LCP,
Echo-Reply (0x0a), id 23, length 10
        encoded length 8 (=Option(s) length 4)
          Magic-Num 0x631aa5be
tcpdump: pcap_loop: The interface went down
52753 packets captured
52760 packets received by filter
0 packets dropped by kernel

ppp log:


Fri Apr 24 10:42:32 2020 daemon.notice pppd[11986]: Modem hangup
Fri Apr 24 10:42:32 2020 daemon.info pppd[11986]: Connect time 979.3 minutes.
Fri Apr 24 10:42:32 2020 daemon.info pppd[11986]: Sent 325423487
bytes, received 1643504692 bytes.

It seems echo requests come more often towards the end, almost every
second. Earlier they are also irregular, but come at 30-60 second
intervals.



On Fri, 24 Apr 2020 at 15:47, David Balažic <xerces9@gmail.com> wrote:
>
> On Thu, 23 Apr 2020 at 21:36, David Balažic <xerces9@gmail.com> wrote:
> >
> > OK, more data:
> > I started tcpdump with the -e option as suggested on openwrt forum:
> > tcpdump -e -v -i eth1.3902 pppoed
> >
> > on disconnect, this was logged (times are UTC):
> >
> >
> > tcpdump: listening on eth1.3902, link-type EN10MB (Ethernet), capture
> > size 262144 bytes
> > 18:23:09.204991 a4:7b:2c:9e:c7:44 (oui Unknown) > 44:4e:6d:fd:c7:39
> > (oui Unknown), ethertype PPPoE D (0x8863), length 97: PPPoE PADO
> > [Service-Name] [AC-Name "SIMB_TABOR_BNG1"] [Host-Uniq
> > 0x44************long_number******************************AA]
> > [AC-Cookie ".5b************v"]
>
> Isnt this strange? The dst addr is not my router or any other known.
> Also the Host-Uniq value is different.
> As if is traffic meant for someone else.
