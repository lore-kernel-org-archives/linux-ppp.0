From: GrantC <grant_nospam@dodo.com.au>
Date: Tue, 15 Feb 2005 04:46:37 +0000
Subject: Re: 2 questions about dialup pppd use
Message-Id: <nqu211lm4242qve57relani49ar3td5ski@4ax.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20050212173525.GA27282@iceland.spb.ru>
In-Reply-To: <20050212173525.GA27282@iceland.spb.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Mon, 14 Feb 2005 16:31:10 -0800 (PST), you wrote:

>On Tue, 15 Feb 2005, GrantC wrote:
>
>> On Mon, 14 Feb 2005 15:32:36 -0800 (PST), you wrote:
>>
>>> On Sat, 12 Feb 2005, Serge Koksharov wrote:
>>>
>>> I do not know how your system  or pppd gets the variable CONNECT_TIME.
>>
>> Elapsed seconds from connection up until down.
>
>Yes, that is what it is supposed to be, but is that what it is? (Obvously
>not sometimes). Anyway the question I was asking was what was setting that
>environment variable and how is it calculated.
>
>Looking at the source, the Connect time should be a positive number with no
>rollover until well into the 21 century.

Okay, this is what I do, although I'm on ADSL the pppd part is 
similar enough.

I ran "adsl-stop; sleep 5; adsl-start", waited a minute, and 
ran "adsl-stop; sleep 5; adsl-start" again, producing a 49 second 
connection:

deltree:~$ cat /var/log/rp-pppoe
...
Feb 15 15:15:20 adsl ip dn= 62350 478157418 12891939
Feb 15 15:15:30 adsl ip up= ppp0 111.111.111.111 222.222.22.22
Feb 15 15:16:19 adsl ip dn= 49 2100 847
Feb 15 15:16:31 adsl ip up= ppp0 111.111.111.111 222.222.22.22

This log is written by 

deltree:~$ cat /usr/local/etc/ppp/signal
#!/bin/bash
#
# process events from the rp-pppoe package
#
# environment vars:
# DEVICE
# IFNAME
# IPLOCAL
# IPREMOTE
# PEERNAME
# SPEED
# ORIG_UID
# PPPLOGNAME
# additional vars for auth-down and ip-down:
# CONNECT_TIME
# BYTES_SENT
# BYTES_RCVD
# LINKNAME
# DNS1
# DNS2

log="var/log/rp-pppoe"

function do_ip_up ()
{
        echo "ip up= $IFNAME $IPLOCAL $IPREMOTE" >> $log
        /etc/rc.d/rc.firewall $IFNAME $IPLOCAL > /var/log/ip-up
        /usr/sbin/ntpd
}
function do_ip_down ()
{
        echo "ip dn= $CONNECT_TIME $BYTES_RCVD $BYTES_SENT" >> $log
        echo -e "\nConnection dropped!" >> /var/log/ip-up
        killall ntpd
}

echo -n "$(date "+%b %e %T") adsl " >> $log

case $1 in
        adsl_lost)      echo " lost" >> $log;;
        auth_up)        echo "au up" >> $log;;
        auth_down)      echo "au dn" >> $log;;
        ip_up)          do_ip_up;;
        ip_down)        do_ip_down;;
        *)              echo " oops: $*" >> $log;;
esac

in turn called by:

deltree:~$ cat /etc/ppp/ip-up
#!/bin/bash
# /etc/ppp/ip-up
#
test -x /usr/local/etc/ppp/signal && /usr/local/etc/ppp/signal ip_up
#

deltree:~$ cat /etc/ppp/ip-down
#!/bin/bash
# /etc/ppp/ip-down
#
test -x /usr/local/etc/ppp/signal && /usr/local/etc/ppp/signal ip_down
#

Hope this helps you with the connection timing.

>
>YOu would have to hack chat to make it do that-- parse the CONNECT message
>from teh modem and then put that into an environment variable visible to
>the calling program (env variables usually die with the child).
>
Sorry, I haven't been there -- I used to use my windows box to 
drive dialup modem. 

Cheers,
Grant.


