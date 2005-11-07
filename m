From: Warren Turkal <wt@penguintechs.com>
Date: Mon, 07 Nov 2005 10:00:34 +0000
Subject: linux ppp problem
Message-Id: <200511070400.34908.wt@penguintechs.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

I know this is not a normal use case, but I am hoping that an oops can be=20
avoided in this case. I was using a cell phone as /dev/ttyACM0 and the cell=
=20
phone came unconnected. The kernel then oopsed.

It looks like the kernel is removing the ttyACM device before the ppp0 driv=
er=20
has a chance to let it go.

If I can do anything else to help, please let me know by CC as I am not a=20
member of this list.

Here is the oops from my logs.

Nov  7 03:31:32 localhost kernel: usb 1-2: USB disconnect, address 2
Nov  7 03:31:33 localhost kernel: Unable to handle kernel NULL pointer=20
dereference at virtual address 0000000c
Nov  7 03:31:33 localhost kernel:  printing eip:
Nov  7 03:31:33 localhost kernel: c01ad03f
Nov  7 03:31:33 localhost kernel: *pde =3D 00000000
Nov  7 03:31:33 localhost kernel: Oops: 0000 [#1]
Nov  7 03:31:33 localhost kernel: SMP=20
Nov  7 03:31:33 localhost kernel: Modules linked in: ppp_deflate zlib_defla=
te=20
bsd_comp ppp_async crc_ccitt ppp_generic slhc wacom radeon drm binfmt_misc =

rfcomm l2cap bluetooth af_packet ipv6 lp thermal fan button ac battery xfs =

exportfs cdc_acm acpi_cpufreq freq_table processor cpufreq_userspace video =

sbp2 scsi_mod eth1394 pcmcia firmware_class ohci1394 ieee1394 snd_maestro3 =

e100 mii yenta_socket rsrc_nonstatic pcmcia_core intel_agp agpgart shpchp=20
pci_hotplug snd_intel8x0m snd_ac97_codec snd_ac97_bus snd_pcm_oss=20
snd_mixer_oss snd_pcm snd_timer snd uhci_hcd i2c_i801 soundcore i2c_core=20
usbcore snd_page_alloc floppy parport_pc parport rtc pcspkr ide_cd serio_ra=
w=20
cdrom unix reiserfs dm_mod ide_disk ide_generic generic piix ide_core evdev=
=20
mousedev psmouse
Nov  7 03:31:33 localhost kernel: CPU:    0
Nov  7 03:31:33 localhost kernel: EIP:    0060:[sysfs_hash_and_remove+31/26=
5]   =20
Not tainted VLI
Nov  7 03:31:33 localhost kernel: EFLAGS: 00010246   (2.6.14-1-686-smp)=20
Nov  7 03:31:33 localhost kernel: EIP is at sysfs_hash_and_remove+0x1f/0x109
Nov  7 03:31:33 localhost kernel: eax: eeed0578   ebx: ef610608   ecx:=20
c01d8c30   edx: ea09b760
Nov  7 03:31:33 localhost kernel: esi: 00000000   edi: eb269480   ebp:=20
c172ec80   esp: ce287e54
Nov  7 03:31:33 localhost kernel: ds: 007b   es: 007b   ss: 0068
Nov  7 03:31:33 localhost kernel: Process pppd (pid: 6809, threadinfo=CE286=
000=20
task=CD320a70)
Nov  7 03:31:33 localhost kernel: Stack: c171ef00 ee0be8e4 ee0be940 ef61060=
8=20
ef610600 eb269480 c172ec80 c0240d82=20
Nov  7 03:31:33 localhost kernel:        eeed0578 eb269480 c172ecf4 ef61060=
0=20
00000000 c02f6182 00000000 c0240df0=20
Nov  7 03:31:33 localhost kernel:        ef610600 ef164d80 f0c3e64f ef61060=
0=20
0a600000 ef164d80 f0c3e74a ef164d80=20
Nov  7 03:31:33 localhost kernel: Call Trace:
Nov  7 03:31:33 localhost kernel:  [class_device_del+178/272]=20
class_device_del+0xb2/0x110
Nov  7 03:31:33 localhost kernel:  [class_device_unregister+16/32]=20
class_device_unregister+0x10/0x20
Nov  7 03:31:33 localhost kernel:  [pg0+814159439/1069749248]=20
acm_tty_unregister+0x1f/0x70 [cdc_acm]
Nov  7 03:31:33 localhost kernel:  [pg0+814159690/1069749248]=20
acm_tty_close+0xaa/0xb0 [cdc_acm]
Nov  7 03:31:33 localhost kernel:  [release_dev+355/1904]=20
release_dev+0x163/0x770
Nov  7 03:31:33 localhost kernel:  [page_add_file_rmap+73/96]=20
page_add_file_rmap+0x49/0x60
Nov  7 03:31:33 localhost kernel:  [lock_timer_base+36/80]=20
lock_timer_base+0x24/0x50
Nov  7 03:31:33 localhost kernel:  [pte_alloc_map+62/224]=20
pte_alloc_map+0x3e/0xe0
Nov  7 03:31:33 localhost kernel:  [inotify_dentry_parent_queue_event+82/22=
4]=20
inotify_dentry_parent_queue_event+0x52/0xe0
Nov  7 03:31:33 localhost kernel:  [__handle_mm_fault+380/464]=20
__handle_mm_fault+0x17c/0x1d0
Nov  7 03:31:33 localhost kernel:  [tty_release+20/32] tty_release+0x14/0x20
Nov  7 03:31:33 localhost kernel:  [__fput+161/400] __fput+0xa1/0x190
Nov  7 03:31:33 localhost kernel:  [filp_close+82/144] filp_close+0x52/0x90
Nov  7 03:31:33 localhost kernel:  [sys_close+121/192] sys_close+0x79/0xc0
Nov  7 03:31:33 localhost kernel:  [syscall_call+7/11] syscall_call+0x7/0xb
Nov  7 03:31:33 localhost kernel: Code: 90 90 90 90 90 90 90 90 90 90 90 90=
 55=20
57 56 53 83 ec 0c 8b 44 24 20 8b 50 0c 8b 70 54 85 d2 74 7c f0 ff 4a 74 0f =
88=20
ea 00 00 00 <8b> 46 0c 8d 68 fc 8b 4d 04 0f 18 01 90 83 c6 0c 89 c3 39 f0 8=
9=20
Nov  7 03:33:45 localhost kernel:  <6>usb 1-2: new full speed USB device us=
ing=20
uhci_hcd and address 3
Nov  7 03:33:45 localhost kernel: usb 1-2: configuration #1 chosen from 2=20
choices
Nov  7 03:33:45 localhost kernel: cdc_acm 1-2:1.0: ttyACM1: USB ACM device
Nov  7 03:39:11 localhost kernel: usb 1-2: USB disconnect, address 3

wt
