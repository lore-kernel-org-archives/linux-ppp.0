From: David Leon <dleon741210@gmail.com>
Date: Mon, 20 Jul 2009 12:34:23 +0000
Subject: Re: pppd against RADIUS
Message-Id: <51894d8a0907200534h3bd5c119mb038a96ae1a3247a@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <51894d8a0907170915p604dfeaavcd3529afe7c93c@mail.gmail.com>
In-Reply-To: <51894d8a0907170915p604dfeaavcd3529afe7c93c@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Carlson thanks for your comments and ideas. I will change the sripts
following your advice. Thanks. I will keep you posted.

David



On 7/17/09, James Carlson <carlsonj@workingcode.com> wrote:
> David Leon wrote:
>> exec /usr/sbin/pppd debug lock modem crtscts /dev/ttyS0 115200 plugin
>> radius.so \
>> $LOCAL_IP:$REMOTE_IP noipdefault defaultroute connect $DIALER_SCRIPT
>
> Unless the system running this script is itself the remote dial-in host
> (which seems unlikely, given the context), that command is incorrect.
> You should *not* be including the radius.so plugin.  Remove that.
> You're not authenticating your peer using a local RADIUS server on your
> side of the link -- quite the opposite; the remote peer is doing that.
>
> In general, you shouldn't have to use $LOCAL_IP:$REMOTE_IP if you're a
> regular dial-up client ... but I don't know much about these
> vendor-supplied scripts.
>
> You also seem to be missing "user myusername" in the configuration.
> Unless the user name you use to log into PPP on that peer happens to be
> identically the name of your local host, this probably won't work.
>
>> exec chat -v                                            \
>>         TIMEOUT         10                              \
>>         ABORT           '\nBUSY\r'                      \
>>         ABORT           '\nNO ANSWER\r'                 \
>>         ABORT           '\nRINGING\r\n\r\nRINGING\r'    \
>>         ''              \rAT                            \
>>         'OK-+++\c-OK'   ATH0                            \
>>         TIMEOUT         60                              \
>>         OK              ATDT$TELEPHONE                  \
>>         CONNECT         ''                              \
>>         sername:        $ACCOUNT                        \
>>         assword:        $PASSWORD                       \
>>         DPSCFR--DPSCFR  ppp                             \
>>         ~               ''
>
> That almost looks like an OK script, assuming that you really have to do
> a text mode log-in before starting PPP.  But see the note further below
> -- you're being hurt by your choice of shell, and that's why it's not
> working.
>
> One note on it, though: you're not initializing the modem.  Good
> practice usually includes initializing the modem properly.  (Usually
> with at least "AT&F" for generic modems, and "AT&F1" for USR brand
> modems.  Your mileage will vary; see the documentation for your modem.)
>
>> LOG /var/log/messages
>
> This is the key part of any request for pppd help.  ;-}
>
>> Jul 17 14:18:00 linux chat[17860]: expect (/root)
>> Jul 17 14:18:00 linux chat[17860]: >ppp^M
>> Jul 17 14:18:00 linux chat[17860]: Entering PPP mode.^M
>> Jul 17 14:18:00 linux chat[17860]: Async interface address is
>> unnumbered (Ethernet0)^M
>> Jul 17 14:18:00 linux chat[17860]: Your IP address is 172.28.7.208.
>> MTU is 1500 bytes^M
>> Jul 17 14:18:00 linux chat[17860]: Header compression will match your
>> system.^M
>> Jul 17 14:18:00 linux chat[17860]: ^M
>> Jul 17 14:18:04 linux chat[17860]: ~~^?}#@!}!(} }8}"}&} }*} }
>> }#}$@#}%}&_}8W}0}'}"}(}"}2}0~~^?}#@!}!)} }8}"}&} }*} }
>> Jul 17 14:18:06 linux chat[17860]:
>
> Oops.  Your chat script is wrong.  That "garbage" text is actually PPP
> from the peer.
>
> Your shell is expanding "~" on the command line into "/root", and the
> peer never sends that string, so the chat script doesn't ever exit.
> Change the last line of the chat script to read:
>
>         '~'               ''
>
> Note the quotes around '~' -- to stop the shell expansion.  Better still
> would be something like this:
>
> 	'PPP mode'	''
>
> Instead of expecting the '~' character (the start of the first PPP
> message from the peer), you can just expect the notification that PPP is
> starting.  That's enough, and it should make the connection complete
> faster because you will be less likely to lose that first message and
> require a retransmit.
>
> For what it's worth, it's good practice to put your chat script into a
> separate file, and then use chat's "-f" option to read that file.  Doing
> that avoids a host of shell-related hysteria.
>
> --
> James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
>
