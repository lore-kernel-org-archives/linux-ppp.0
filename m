From: Bill Unruh <unruh@physics.ubc.ca>
Date: Fri, 02 Apr 2004 17:11:52 +0000
Subject: Re: Problem with PPP0 interface
Message-Id: <Pine.LNX.4.50.0404020908310.30544-100000@string.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <33B641675B6BBC419F539832368D73C803F38E8D@excbrsp002.americas.unity>
In-Reply-To: <33B641675B6BBC419F539832368D73C803F38E8D@excbrsp002.americas.unity>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Fri, 2 Apr 2004, Ferreira, Fernando Borges wrote:

> Hello everybody,
> I have an US Robotics 33.6 Sportster external modem and I can't get connected. I got connected using minicom and sending commands to the modem, but I couldn't get connected after configuring the pppsetup correctly. The modem dials and, after the auth. process, I tried to check the ppp interface and got the following message: "couldn't find interface ppp0: no such device". I run a Slackware box with the kernel 2.6.3 compiled with PPP support. Everything works fine, but I can't get connected. Any clues?

That message is not the problem. Post the debug output from ppp here.

put 
debug
into /etc/ppp/options and put the line 
daemon.*;local2.*		/var/log/ppplog
into /etc/syslog.conf
and then do 
killall -1 syslogd

Then try to connect and put the output from that connection into the
message here. You do not understand what is happening and so your
selection of the messages to tell us about cannot be trusted. Just post
them all. Keeping the time stamps and everything. Do not edit anything,
except remove your password if it occurs in the file.

(PS, does /dev/ppp exist?)

> 
> Thanks in advance,
> 
> Fernando
> -
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 
William G. Unruh   |  Canadian Institute for|     Tel: +1(604)822-3273
Physics&Astronomy  |     Advanced Research  |     Fax: +1(604)822-5324
UBC, Vancouver,BC  |   Program in Cosmology |     unruh@physics.ubc.ca
Canada V6T 1Z1     |      and Gravity       |  www.theory.physics.ubc.ca/
