From: "Sadiq Shaikh" <sadiq.shaikh@analog.com>
Date: Mon, 27 Dec 2004 10:25:33 +0000
Subject: pppoatm: tring to insert module pppoatm.o, although plugin pppoatm.so is loaded.
Message-Id: <ALEGKCGFAAHCNBMHOENDKEAICJAA.sadiq.shaikh@analog.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi,

I'm working on pppoatm. Recently i have downloaded
ppp-2.4.3. I'm running into problem, its will be great
if someone answer my questions.Thank you in advance.

1) Why ppp0 interface is not created ?
2) why its trying to insert module, when i added it as plugin.
3) I'm using ppp-2.4.3, linux kernel 2.4.18, any issues with this
combination ?

kernel conf:

Networking Options:
[*]Asynchronous Transfer Mode (ATM) (EXPERIMENTAL)
[*]Classical IP over ATM
[*]RFC 2684 Bridging

Network Device Support:
<*> PPP (point-to-point protocol) support
<*>PPP support for async serial ports
<*>PPP over ATM (EXPERIMENTAL)

file: /etc/ppp/options
----------8<---------------8<------------------
user pppoa_user46lc
name user
defaultroute
-detach
nobsdcomp
nodeflate
nopcomp
novj
novjccomp
noipdefault
noaccomp -am
#refuse-chap
+chap
plugin pppoatm.so 46.62
persist
maxfail 0

console output:
----------8<---------------8<------------------
# pppd

do_cpu() called w/ EPC = 00436030
Algorithmics/MIPS FPU Emulator v1.4
do_cpu() called w/ EPC = 00436040
do_cpu() called w/ EPC = 0043605c
do_cpu() called w/ EPC = 00436070
Plugin pppoatm.so loaded.
PPPoATM plugin_init
PPPoATM setdevname_pppoatm - SUCCESS:46.62
insmod: pppoatm.o: no module by that name found
setsockopt(SO_ATMQOS): Invalid argument

----------8<---------------8<------------------

Regards & Thanks,
Sadiq Shaikh

