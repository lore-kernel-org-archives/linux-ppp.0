From: Greg <gregborbonus@gmail.com>
Date: Mon, 17 Mar 2014 15:37:52 +0000
Subject: Fwd: Setting environment variables and strange string in client
Message-Id: <532716D0.507@gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


hi guys,

I'm creating a logging system that is tracking the bandwidth of a
particular user. The thing is, users can login to the same system
multiple times. So I need to assign a unique id for tracking to each
connection.

Is there a way to set an environment variable from the script at
client-connect or from another option?

Also, when I setup and ovpn file, In the client I see: "This is a static
profile that will connect to %S@%S"

Anyone know how I can correct that string %S@%S to something@something?





-- 
Thank you,
Greg Borbonus
*Nix Server administrator



