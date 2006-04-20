From: Vladimir <bobahu4@mail.ru>
Date: Thu, 20 Apr 2006 13:21:38 +0000
Subject: lost packets with 2.6.17-rc2 (and rc1)
Message-Id: <20060420182138.d412a5d0.bobahu4@mail.ru>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

It's problems using ppp driver in 2.6.17-rc2(and rc1)
Kernel lose packets.

e.g.

$ ping -c10 google.com
PING google.com (64.233.187.99) 56(84) bytes of data.
64 bytes from 64.233.187.99: icmp_seq=2 ttl#4 timeU7 ms
64 bytes from 64.233.187.99: icmp_seq=3 ttl#4 timeU8 ms
64 bytes from 64.233.187.99: icmp_seq=4 ttl#4 timeW5 ms
64 bytes from 64.233.187.99: icmp_seq=5 ttl#4 timeY7 ms
64 bytes from 64.233.187.99: icmp_seq=6 ttl#4 timeW9 ms
64 bytes from 64.233.187.99: icmp_seq=7 ttl#4 timeX0 ms
64 bytes from 64.233.187.99: icmp_seq=8 ttl#4 timeW6 ms
64 bytes from 64.233.187.99: icmp_seq=9 ttl#4 timee9 ms

--- google.com ping statistics ---
10 packets transmitted, 8 received, 20% packet loss, time 11355ms
rtt min/avg/max/mdev = 557.688/585.883/659.876/30.434 ms

I use "pppd call mts" command to connect

-------------------
/etc/ppp/peers/mts

hide-password
noauth
connect "/usr/sbin/chat -f /etc/ppp/mts.chat"

/dev/ttyACM0
115200
defaultroute
noipdefault
user "mts"
remotename mts
ipparam mts

usepeerdns
nobsdcomp
nodeflate
novj
nodetach

usepeerdns

--------------------

pppd version 2.4.3


No such problem with 2.6.16.x

lsmod output 

Module                  Size  Used by
ppp_async               8448  1
ppp_generic            22420  5 ppp_async
slhc                    6016  1 ppp_generic
crc_ccitt               1920  1 ppp_async
fglrx                 444876  21
snd_rtctimer            2444  1
i2c_i801                7564  0
i2c_dev                 7172  0
raw                     6560  1
ipv6                  216032  18
joydev                  7872  0
snd_es1938             17444  0
snd_opl3_lib            8320  1 snd_es1938
snd_hwdep               6788  1 snd_opl3_lib
snd_mpu401_uart         5504  1 snd_es1938
snd_rawmidi            18592  1 snd_mpu401_uart
snd_pcm_oss            36768  0
snd_mixer_oss          15488  1 snd_pcm_oss
snd_intel8x0           27804  2
snd_ac97_codec         85280  1 snd_intel8x0
snd_ac97_bus            1920  1 snd_ac97_codec
snd_pcm                72840  5 snd_es1938,snd_pcm_oss,snd_intel8x0,snd_ac97_codec
snd_page_alloc          7688  2 snd_intel8x0,snd_pcm
parport_pc             25284  1
lp                      9160  0
parport                19008  2 parport_pc,lp
usblp                  11136  0
iptable_filter          2304  0
ip_tables              10840  1 iptable_filter
x_tables               10500  1 ip_tables
af_packet              15624  0
it87                   17572  0
hwmon_vid               2816  1 it87
i2c_isa                 3456  1 it87
ide_cd                 35588  0
cdrom                  37024  1 ide_cd
loop                   12808  0
reiser4               372056  1
supermount             33172  1
configfs               21520  1
intel_agp              18844  1
agpgart                26588  2 fglrx,intel_agp
i8xx_tco                5908  0
snd_seq_oss            28672  0
snd_seq_midi_event      5632  1 snd_seq_oss
snd_seq                42704  5 snd_seq_oss,snd_seq_midi_event
snd_timer              18948  4 snd_rtctimer,snd_opl3_lib,snd_pcm,snd_seq
snd_seq_device          6540  4 snd_opl3_lib,snd_rawmidi,snd_seq_oss,snd_seq
snd                    42724  18 snd_es1938,snd_opl3_lib,snd_hwdep,snd_mpu401_uart,snd_rawmidi,snd_pcm_oss,snd_mixer_oss,snd_intel8x0,snd_ac97_codec,snd_pcm,snd_seq_oss,snd_seq,snd_timer,snd_seq_device
soundcore               7008  1 snd
evdev                   7680  1
analog                  9888  0
ns558                   4608  0
gameport               10504  4 snd_es1938,analog,ns558
8139too                21376  0
mii                     4736  1 8139too
cdc_acm                11040  2
uhci_hcd               18828  0
ehci_hcd               26248  0
ohci_hcd               17668  0
usbcore               108288  6 usblp,cdc_acm,uhci_hcd,ehci_hcd,ohci_hcd
container               3328  0
button                  5008  0


Vladimir
