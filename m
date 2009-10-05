From: "Davy Leon" <davy@scu.escambray.com.cu>
Date: Mon, 05 Oct 2009 16:38:00 +0000
Subject: ppp question
Message-Id: <008201ca45e2$eb8f8f60$0413010a@scu.escambray.com.cu>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi folks

I have a question. Every time I dialup to the internet pppd executes an 
script called ip-up. My question is, everytime someone dials in it's 
executed too? If the answer is yes, how can I handle the script to execute 
one part when dianing out and another part when dialing in. I meant 
something like

if dialing in then

...
...

if dialing out then

...
....



Thanks in advance

David 

