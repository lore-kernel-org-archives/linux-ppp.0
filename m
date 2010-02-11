From: Ashmath Khan <hashmat.email@gmail.com>
Date: Thu, 11 Feb 2010 17:48:26 +0000
Subject: Re: Control pppd behaviour
Message-Id: <b17c42311002110936u18de5c7fxf6e710f41c033da5@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <27543592.post@talk.nabble.com>
In-Reply-To: <27543592.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

Thanks James.

I do understand the daemon part. We do run the pppd as daemon that is
in the background, we don't run from terminal but an application runs
this. And able to catch exit codes as well !
But pppd doesn't exit if say authetication fails, instead it will retry.

I did have a look at maxfail:
maxfail n
    Terminate after n consecutive failed connection attempts. A value
of 0 means no limit. The default value is 10.

I wanted to have 0 retries. Is there a way ?


On Thu, Feb 11, 2010 at 10:31 PM, James Carlson
<carlsonj@workingcode.com> wrote:
> Ashmath Khan wrote:
>> Thanks James.
>>>From man page:
>> updetach
>> =A0 =A0 With this option, pppd will detach from its controlling terminal
>> once it has successfully established the ppp connection (to the point
>> where the first network control protocol, usually the IP control
>> protocol, has come up).
>>
>> How about if chap authentication fails ? then updetach won't work.
>
> If authentication fails, then pppd exits with an error code as
> documented. =A0The man page entry for updetach documents the _latest_
> point at which the daemon will exit, not the earliest point.
>
> Basically, by using updetach, you can rely on the exit code from pppd to
> tell you whether it was successful in starting the session (exit code 0)
> and is now running in the background, or whether it failed to start
> (exit code !=3D 0).
>
> I suspect this is the behavior you're looking for.
>
>> what is controlling terminal here ?
>
> It's a UNIX term. =A0Processes may or may not have what's called a
> "controlling terminal."
>
> When you start a process from a shell, the controlling terminal is
> usually your tty. =A0This allows you to (for instance) press ^C and
> interrupt that process. =A0It's what also terminates any lingering
> processes with SIGHUP when you log out.
>
> Processes that run as daemons generally disconnect from the controlling
> terminal, so that they are no longer affected by the user who originally
> started the process (unless explicitly sent a signal with "kill").
>
> For more information, you may want to try googling the term.
>
> --
> James Carlson =A0 =A0 =A0 =A0 42.703N 71.076W =A0 =A0 =A0 =A0 <carlsonj@w=
orkingcode.com>
>
>
