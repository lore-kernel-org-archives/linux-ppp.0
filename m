From: Frank Krauss <fmfkrauss@mindspring.com>
Date: Tue, 08 Jun 2004 23:14:35 +0000
Subject: Specifing Hays Extended Command Set in PPP 2.4.1
Message-Id: <200406081914.35819.fmfkrauss@mindspring.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello everyone,

I'm attempting to specify a value in a CHAT Script for an AT command
that has a & in it.

This is because it is a Hays Extended Command Set value.  For example:
"" ATX1&S1E1Q0

Whenever I specify this type of command in a String, I get the 
following message:

Can't get terminal parameters: inappropriate IOCTL for device

If I remove the command with the & in it, the rest of the command runs fine.
I know that the command itself is good since when I run it under MINCOM,
the entire stmt runs fine.

The reason that I have to enter this type of command is because I'm attempting
to get a US Robotics Sportster External 56K Fax Modem to work under Linux
and I need to specify this type of Command in my Chat Script.

My DIP Switch setting are as follows:
   1. Up          5. Up 
   2. Up          6. Up
   3. Up          7. Up
   4. Down      8. Down

My Environment is the following:
   1.  Computer is a Pentium II.
   2.  Distribution is Caldera 2.3
   3.  Kernel is 2.4.22
   4.  PPP is 2.4.1

Would someone be able to tell me what my mistake is or how I can get around
this problem?

Yours truly,

Frank Krauss
 

