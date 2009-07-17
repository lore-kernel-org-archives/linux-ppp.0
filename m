From: David Leon <dleon741210@gmail.com>
Date: Fri, 17 Jul 2009 18:19:17 +0000
Subject: Re: pppd against RADIUS
Message-Id: <51894d8a0907171119r5afe7b67od73797672e4b3d25@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <51894d8a0907170915p604dfeaavcd3529afe7c93c@mail.gmail.com>
In-Reply-To: <51894d8a0907170915p604dfeaavcd3529afe7c93c@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi James

Sorry  for my bad English. In fact, your example about RADIUS server
it's very clear to me, I just wanted to ad the detail that the remote
peer is using it as an authentication squeme. I'm including the
scripts and see if you can help me out. I'm really new on this pppd
stuff.

I'm passing all pppd parameters in command line, so my
/etc/ppp/options is blank. See my config files and a log at the end

I hope you can help me out.

Thanks

David

*******************
/etc/ppp/scripts/ppp-on
*******************

#!/bin/sh
#
# Script to initiate a ppp connection. This is the first part of the
# pair of scripts. This is not a secure pair of scripts as the codes
# are visible with the 'ps' command.  However, it is simple.
#
# These are the parameters. Change as needed.
TELEPHONEU5555 # The telephone number for the connection
ACCOUNT=myusername # The account name for logon (as in 'George Burns')
PASSWORD=mypassword # The password for this account (and 'Gracie Allen')
LOCAL_IP=0.0.0.0 # Local IP address if known. Dynamic = 0.0.0.0
REMOTE_IP=0.0.0.0 # Remote IP address if desired. Normally 0.0.0.0
NETMASK%5.255.255.0 # The proper netmask if needed
#
# Export them so that they will be available at 'ppp-on-dialer' time.
export TELEPHONE ACCOUNT PASSWORD
#
# This is the location of the script which dials the phone and logs
# in.  Please use the absolute file name as the $PATH variable is not
# used on the connect option.  (To do so on a 'root' account would be
# a security hole so don't ask.)
#
DIALER_SCRIPT=/etc/ppp/scripts/ppp-on-dialer

#
# Initiate the connection
#
# I put most of the common options on this command. Please, don't
# forget the 'lock' option or some programs such as mgetty will not
# work. The asyncmap and escape will permit the PPP link to work with
# a telnet or rlogin connection. You are welcome to make any changes
# as desired. Don't use the 'defaultroute' option if you currently
# have a default route to an ethernet gateway.
#

exec /usr/sbin/pppd debug lock modem crtscts /dev/ttyS0 115200 plugin
radius.so \
$LOCAL_IP:$REMOTE_IP noipdefault defaultroute connect $DIALER_SCRIPT


*******************
/etc/ppp/scripts/ppp-on-dialer
*******************
#!/bin/sh
#
# This is part 2 of the ppp-on script. It will perform the connection
# protocol for the desired connection.
#
exec chat -v                                            \
        TIMEOUT         10                              \
        ABORT           '\nBUSY\r'                      \
        ABORT           '\nNO ANSWER\r'                 \
        ABORT           '\nRINGING\r\n\r\nRINGING\r'    \
        ''              \rAT                            \
        'OK-+++\c-OK'   ATH0                            \
        TIMEOUT         60                              \
        OK              ATDT$TELEPHONE                  \
        CONNECT         ''                              \
        sername:        $ACCOUNT                        \
        assword:        $PASSWORD                       \
        DPSCFR--DPSCFR  ppp                             \
        ~               ''


*******************
/etc/ppp/scripts/ppp-off
*******************
#!/bin/sh
######################################################################
#
# Determine the device to be terminated.
#
if [ "$1" = "" ]; then
        DEVICE=ppp0
else
        DEVICE=$1
fi

######################################################################
#
# If the ppp0 pid file is present then the program is running. Stop it.
if [ -r /var/run/$DEVICE.pid ]; then
        kill -INT `cat /var/run/$DEVICE.pid`
#
# If the kill did not work then there is no process running for this
# pid. It may also mean that the lock file will be left. You may wish
# to delete the lock file at the same time.
        if [ ! "$?" = "0" ]; then
                rm -f /var/run/$DEVICE.pid
                echo "ERROR: Removed stale pid file"
                exit 1
        fi
#
# Success. Let pppd clean up its own junk.
        echo "PPP link to $DEVICE terminated."
        exit 0
fi
#
# The ppp process is not running for ppp0
echo "ERROR: PPP link is not active on $DEVICE"
exit 1


*******************
/etc/ppp/pap-secret
*******************

#User           Server          Secret          IP Address
#bob            *               mypassword      *
myusername         *               mypassword     *


*************************************************************
LOG /var/log/messages

Jul 17 14:17:35 linux pppd[17848]: Plugin radius.so loaded.
Jul 17 14:17:35 linux pppd[17848]: RADIUS plugin initialized.
Jul 17 14:17:35 linux kernel: CSLIP: code copyright 1989 Regents of
the University of California
Jul 17 14:17:35 linux kernel: PPP generic driver version 2.4.2
Jul 17 14:17:35 linux pppd[17856]: pppd 2.4.4 started by root, uid 0
Jul 17 14:17:36 linux chat[17860]: timeout set to 10 seconds
Jul 17 14:17:36 linux chat[17860]: abort on (\nBUSY\r)
Jul 17 14:17:36 linux chat[17860]: abort on (\nNO ANSWER\r)
Jul 17 14:17:36 linux chat[17860]: abort on (\nRINGING\r\n\r\nRINGING\r)
Jul 17 14:17:36 linux chat[17860]: send (rAT^M)
Jul 17 14:17:36 linux chat[17860]: expect (OK)
Jul 17 14:17:36 linux chat[17860]: rAT^M^M
Jul 17 14:17:36 linux chat[17860]: OK
Jul 17 14:17:36 linux chat[17860]:  -- got it
Jul 17 14:17:36 linux chat[17860]: send (ATH0^M)
Jul 17 14:17:36 linux chat[17860]: timeout set to 60 seconds
Jul 17 14:17:36 linux chat[17860]: expect (OK)
Jul 17 14:17:36 linux chat[17860]: ^M
Jul 17 14:17:36 linux chat[17860]: ATH0^M^M
Jul 17 14:17:36 linux chat[17860]: OK
Jul 17 14:17:36 linux chat[17860]:  -- got it
Jul 17 14:17:36 linux chat[17860]: send (ATDT555555^M)
Jul 17 14:17:36 linux chat[17860]: expect (CONNECT)
Jul 17 14:17:36 linux chat[17860]: ^M
Jul 17 14:17:57 linux chat[17860]: ATDT686140^M^M
Jul 17 14:17:57 linux chat[17860]: CONNECT
Jul 17 14:17:57 linux chat[17860]:  -- got it
Jul 17 14:17:57 linux chat[17860]: send (^M)
Jul 17 14:17:57 linux chat[17860]: expect (sername:)
Jul 17 14:17:57 linux chat[17860]:  115200^M
Jul 17 14:17:58 linux chat[17860]: CC^M
Jul 17 14:17:58 linux chat[17860]:           ^M
Jul 17 14:17:58 linux chat[17860]: Bienvenidos al router DPSC!!!^M
Jul 17 14:17:58 linux chat[17860]: ^M
Jul 17 14:17:58 linux chat[17860]: Username:
Jul 17 14:17:58 linux chat[17860]:  -- got it
Jul 17 14:17:58 linux chat[17860]: send (myusername^M)
Jul 17 14:17:58 linux chat[17860]: expect (assword:)
Jul 17 14:17:59 linux chat[17860]:  myusername^M
Jul 17 14:17:59 linux chat[17860]: Password:
Jul 17 14:17:59 linux chat[17860]:  -- got it
Jul 17 14:17:59 linux chat[17860]: send (mypassword*^M)
Jul 17 14:17:59 linux chat[17860]: expect (DPSCFR)
Jul 17 14:18:00 linux chat[17860]:  ^M
Jul 17 14:18:00 linux chat[17860]: ^M
Jul 17 14:18:00 linux chat[17860]: RouterDPSCFR
Jul 17 14:18:00 linux chat[17860]:  -- got it
Jul 17 14:18:00 linux chat[17860]: send (ppp^M)
Jul 17 14:18:00 linux chat[17860]: expect (/root)
Jul 17 14:18:00 linux chat[17860]: >ppp^M
Jul 17 14:18:00 linux chat[17860]: Entering PPP mode.^M
Jul 17 14:18:00 linux chat[17860]: Async interface address is
unnumbered (Ethernet0)^M
Jul 17 14:18:00 linux chat[17860]: Your IP address is 172.28.7.208.
MTU is 1500 bytes^M
Jul 17 14:18:00 linux chat[17860]: Header compression will match your system.^M
Jul 17 14:18:00 linux chat[17860]: ^M
Jul 17 14:18:04 linux chat[17860]: ~~^?}#@!}!(} }8}"}&} }*} }
}#}$@#}%}&_}8W}0}'}"}(}"}2}0~~^?}#@!}!)} }8}"}&} }*} }
Jul 17 14:18:06 linux chat[17860]:
}#}$@#}%}&_}8W}0}'}"}(}"[^Y~~^?}#@!}!*} }8}"}&} }*} }
}#}$@#}%}&_}8W}0}'}"}(}"^Q}+~
Jul 17 14:18:10 linux chat[17860]: ~^?}#@!}!+} }8}"}&} }*} }
}#}$@#}%}&_}8W}0}'}"}(}"X^B~~^?}#@!}!,} }8}"}&} }*} } }#}
Jul 17 14:18:14 linux chat[17860]:
$@#}%}&_}8W}0}'}"}(}"}4'~~^?}#@!}!-} }8}"}&} }*} }
}#}$@#}%}&_}8W}0}'}"}(}"].~~^?}
Jul 17 14:18:16 linux chat[17860]: #@!}!.} }8}"}&} }*} }
}#}$@#}%}&_}8W}0}'}"}(}"^W<~~^?}#@!}!/} }8}"}&} }*} } }#}$@#
Jul 17 14:18:20 linux chat[17860]: }%}&_}8W}0}'}"}(}"^5~~^?}#@!}!0}
}8}"}&} }*} } }#}$@#}%}&_}8W}0}'}"}(}"}&"~~^?}#@!
Jul 17 14:18:22 linux chat[17860]: }!1} }8}"}&} }*} }
}#}$@#}%}&_}8W}0}'}"}(}"O+~~^?}#@!}!2} }8}"}&} }*} } }#}$@#}%}
Jul 17 14:18:26 linux chat[17860]: &_}8W}0}'}"}(}"^E9~^M
Jul 17 14:18:26 linux chat[17860]: NO CARRIER^M



On 7/17/09, James Carlson <carlsonj@workingcode.com> wrote:
> David Leon wrote:
>> I need some help. I'm dialing out to a "closed network" to make a ppp
>> link, but have to authenticate against a remote RADIUS server on that
>> network.
>>
>> I connected manually using minicom and I already have the ppp-on and
>> ppp-on-dialer scripts working ok. I have to authenticate twice. Fist
>> time to get access to the router, and execute ppp manually, wich the
>> script already done, and the authentiocate ppp against the RADIUS
>> server wich I don't have a clue how can I do that.
>
> You'll probably need to provide more details, such as your configuration
> files, the exact command sequence you're using, and the messages and/or
> errors you see.
>
> In general, if a remote PPP access device ("server") is using RADIUS,
> then that's no concern of yours as you authenticate to it.  You just set
> up your PAP or CHAP credentials as usual for PPP, and it's the peer's
> responsibility to contact the RADIUS server on your behalf in order to
> verify your identity.
>
> Dial-out clients don't typically run RADIUS.  It doesn't make sense, as
> RADIUS is a mechanism that (among other things) allows you to validate
> someone else's identity.  That's why it's used on the dial-in "server"
> side of the connection.
>
> (If it helps, you can think of RADIUS as being a little like NIS, LDAP,
> Active Directory, or even PAM.  As a user logging into the system, you
> don't really have to know where the server is or much about it.  You
> just have to provide your credentials using whatever the _local_
> protocol is.)
>
> --
> James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
>
