From: "Irfan Khan" <irfan.f.khan@gmail.com>
Date: Tue, 19 Sep 2006 04:56:51 +0000
Subject: Hooking up ppp to virtual serial driver
Message-Id: <e67aee670609182156w79acbf3bg3ba0bc02186aa73b@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <e67aee670609182006v11ba9ddan35207b149b05b11c@mail.gmail.com>
In-Reply-To: <e67aee670609182006v11ba9ddan35207b149b05b11c@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi Everyone,
I am new to ppp,
here is what I am trying to do with ppp in linux:
- Writing a serial tty driver
- this driver shall not handle any real serial port (hardware).
- want to divert all the ppp traffic to this driver.

Now the issue is, when I tried a simple tty driver with minimal functions,
and tried-
-  pppd /dev/flex_modem(drivername) 115200

i am getting a kernel log
Could not attach to channel 0: No such device or address.

After primary analysis, I found ppp tries to attach to the tty channed
and getting failed.

Please help me to solve this probem.

Any pointers would be of great help.

TIA
Irfan
