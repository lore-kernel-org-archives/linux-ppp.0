From: Bradley Kieser <brad@kieser.net>
Date: Mon, 11 Oct 2004 13:09:26 +0000
Subject: Using RSA SecurID (EAP) authentication with pptp and pppd
Message-Id: <416A8606.2000203@kieser.net>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Has anyone been able to log onto a VPN that uses SecurID for 
authentication?

I have installed the RSA SecurID PAM authentication module for the 
SecurID card. However, I cannot get pptp to use SecurID ... whenever I 
try and start the tunnel, it errors with EAP as an unknown 
authentication type and crashes out.

THere HAS to be a way, surely, of telling pptp to use the SecurID PAM 
athentication when it tries to connect to the VPN that I need it for?


As a dedicated Linux person, what really winds me up is that for once, 
in windows, it is easy! You just install the relevant DLLs and you get a 
popup window when you first log in , which you enter the securID details 
into... and bingo! You are in.

I really want to get this working in Linux! I don't want to use M$!

If anyone can help, please do so!

I am running Mandrake 10.0.

Thanks,

Brad
