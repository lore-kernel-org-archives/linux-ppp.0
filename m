From: Madhavi Manchala <madhavi.lscsi@gmail.com>
Date: Wed, 02 Sep 2009 08:37:20 +0000
Subject: netconsole configuration problem in FC-8 and FC-10 with 2.6.28 and
Message-Id: <97a757510909020125y52641b93sec7c1ec04b27d804@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Dear All,

I am not able to configure the netconsole on my Fedora Core 8 and
Fedora Core 10 systems with 2.6.28 and 2.6.30 kernel versions. I have
gone through the following link and tried all the available options in
that link.

http://www.mjmwired.net/kernel/Documentation/networking/netconsole.txt

I have changed the values in /etc/sysconfig/netconsole. I have also
changed the /proc/sys/kernel/sysrq value to 1 and
/proc/sys/kernel/printk to 9 4 1 7. I also tried with nc command. But
there is no luck.

After going through the following article
http://www.cyberciti.biz/tips/linux-netconsole-log-management-tutorial.html

I tried to load the netconsole with the following command in FC-8 and
FC-10 systems.

# modprobe netconsole 6666@192.168.1.5/eth0,514@192.168.1.100/00:19:D1:2A:BA:A8

I got the Unknown parameter error.

Please let me know if I am missing any thing in the Fedora Core 8 /
Fedora Core  10 with 2.6.28 / 2.6.30 kernel versions.

Thanks and Regards,
Madhavi M.
