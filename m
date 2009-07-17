From: David Leon <dleon741210@gmail.com>
Date: Fri, 17 Jul 2009 16:15:45 +0000
Subject: pppd against RADIUS
Message-Id: <51894d8a0907170915p604dfeaavcd3529afe7c93c@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi all

I need some help. I'm dialing out to a "closed network" to make a ppp
link, but have to authenticate against a remote RADIUS server on that
network.

I connected manually using minicom and I already have the ppp-on and
ppp-on-dialer scripts working ok. I have to authenticate twice. Fist
time to get access to the router, and execute ppp manually, wich the
script already done, and the authentiocate ppp against the RADIUS
server wich I don't have a clue how can I do that.

Thanks in advance

David
