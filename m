From: Vanitha Ramaswami <vanitha@agilis.st.com.sg>
Date: Mon, 09 Feb 2004 10:25:43 +0000
Subject: Ping Request failed for PPP packets of size greater than 1460 in RP-PPPoE with multilink enabled
Message-Id: <01C3EF3A.218DF940.vanitha@agilis.st.com.sg>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi All,

I have established a PPPoE session between two linux PCs, with the
MTU of the PPP interface set to 1492 and Multilink Enabled

I am trying to ping between the two  PPP interfaces. I am facing a
problem when i send ping requests with data of size  >= 1460 bytes

When i captured the packets with a packet analyzer, i am getting some
weird output. The ping request that is sent, is fragmented by the IP
layer and the packet is received partially by the Linux PC. Even the
sender side PPPoE doesnt send the packet out fully. Is this a problem
with RP-PPPoE..? Is there any other configuration that has to be taken
done ?? I dont see this problem when Multilink is disabled.

I have written a application similar to RP-PPPoE client, which runs PPP
on the slave side and reading the ppp data from the master side of the PTY.
I am using the "read" system call to read the packets arrived on the master
side of the PTY giving a default buffer size of 1500. When i send data of
larger size, so that the IP layer fragments the data, then i see the second
IP fragment being received by the master PTY first and the first IP fragment
coming next..?? Why is this in out-of-order..??


Thanks,
Vanitha
