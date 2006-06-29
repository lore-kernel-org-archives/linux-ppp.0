From: Ray Van Dolson <rayvd@digitalpath.net>
Date: Thu, 29 Jun 2006 06:52:05 +0000
Subject: Radius plugin bug.
Message-Id: <20060629065205.GA18383@digitalpath.net>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I have a busy Linux-based PPTP concentrator (backed by pppd) using Radius
authentication and am seeing some situations where a user connects and gets
no /var/run/radattr file.

I've determined the situation is occuring as a result of User A connecting
and being assigned interface ppp0; disconnecting, and while disconnecting
user B connects and is assigned interface ppp0 (it apparently is made
available before User A's disconnection process or plugins complete
running).  User B's radattr script is written before user A's disconnect
process is completed.  User A's process removes the radattr file (which is
actually for user B!).

Here is an example from my logs of this type of situation occurring:

Jun 28 23:08:50 chico-pptp1 pppd[22494]: Plugin radius.so loaded.
Jun 28 23:08:50 chico-pptp1 pppd[22494]: RADIUS plugin initialized.
Jun 28 23:08:50 chico-pptp1 pppd[22494]: Plugin radattr.so loaded.
Jun 28 23:08:50 chico-pptp1 pppd[22494]: RADATTR plugin initialized.
Jun 28 23:08:50 chico-pptp1 pppd[22494]: pppd 2.4.3 started by root, uid 0
Jun 28 23:08:50 chico-pptp1 pppd[22494]: Using interface ppp29
Jun 28 23:08:50 chico-pptp1 pppd[22494]: Connect: ppp29 <--> /dev/pts/113
Jun 28 23:08:53 chico-pptp1 pppd[22494]: Peer jewell@cncnet.us CHAP authentication succeeded
Jun 28 23:08:53 chico-pptp1 pppd[22494]: MPPE 128-bit stateless compression enabled
Jun 28 23:08:55 chico-pptp1 pppd[22494]: found interface eth0 for proxy arp
Jun 28 23:08:55 chico-pptp1 pppd[22494]: local  IP address 208.53.80.9
Jun 28 23:08:55 chico-pptp1 pppd[22494]: remote IP address 208.53.80.189
Jun 28 23:09:49 chico-pptp1 pppd[22494]: LCP terminated by peer (^D~^SM-a^@<M-Mt^@^@^@^@)
Jun 28 23:09:50 chico-pptp1 pppd[22494]: Connect time 1.0 minutes.
Jun 28 23:09:50 chico-pptp1 pppd[22494]: Sent 504 bytes, received 1294 bytes.
Jun 28 23:09:50 chico-pptp1 pppd[22494]: Modem hangup
Jun 28 23:09:50 chico-pptp1 pppd[22494]: Connection terminated.
Jun 28 23:09:51 chico-pptp1 pppd[23135]: Plugin radius.so loaded.
Jun 28 23:09:51 chico-pptp1 pppd[23135]: RADIUS plugin initialized.
Jun 28 23:09:51 chico-pptp1 pppd[23135]: Plugin radattr.so loaded.
Jun 28 23:09:51 chico-pptp1 pppd[23135]: RADATTR plugin initialized.
Jun 28 23:09:51 chico-pptp1 pppd[23135]: pppd 2.4.3 started by root, uid 0
Jun 28 23:09:51 chico-pptp1 pppd[23135]: Using interface ppp29
Jun 28 23:09:51 chico-pptp1 pppd[23135]: Connect: ppp29 <--> /dev/pts/268
Jun 28 23:09:51 chico-pptp1 pppd[23135]: Peer frems21@myswi.net CHAP authentication succeeded
Jun 28 23:09:51 chico-pptp1 pppd[23135]: MPPE 128-bit stateless compression enabled
Jun 28 23:09:51 chico-pptp1 pppd[23135]: found interface eth0 for proxy arp
Jun 28 23:09:51 chico-pptp1 pppd[23135]: local  IP address 208.53.80.9
Jun 28 23:09:51 chico-pptp1 pppd[23135]: remote IP address 208.53.81.169
Jun 28 23:09:51 chico-pptp1 pppd[22494]: Exit.

As you can see, process 22494 doesn't exit until after 23135 completes its
plugin processing (you'll have to take my word for it since timestamp
accuracy is in seconds).

I hacky fix idea I had in mind was to have cleanup() in radattr.c check the
file modification time on the file in question to ensure it hasn't been
written to by another process.  If so, don't remove it.

Maybe the proper fix would be to do some file locking or to reserve the
interface from being assigned to another pppd until the previous connection
has completed?

Suggestions?

Ray
