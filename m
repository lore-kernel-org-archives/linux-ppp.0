From: neha chatrath <neha.chatrath@ibtechnology.com>
Date: Tue, 14 Aug 2012 11:56:49 +0000
Subject: Using pppd as a library
Message-Id: <502A3A31.2050106@ibtechnology.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello,

I have system requirement in which I need to invoke pppd from a user 
application. This user application needs to do configuration, get status 
etc of the PPP links.
Well there are various ways of doing it, I am exploring the option of 
including pppd as a library in my build. With this,
-I can spawn my application as a thread.
-I can avoid  use of fork and exec operations for executing pppd for 
different links.

Can somebody help me with this. Is there any pppd library already available?

Thanks and regards
Neha Chatrath
Disclaimer : 
This email communication may contain privileged and confidential information and is intended for the
use of the addressee only.If you are not an intended recipient you are requested not to reproduce,copy
disseminate or in any manner distribute this email communication as the same is strictly prohibited. If
you have received this email in error, Please notify the sender immediately by return e-mail and delete
the communication sent in error.Email communications cannot be guaranteed to be secure & error free
and INDIABULLS is not liable for any errors in the email communication or for the proper, timely and
complete transmission thereof.

