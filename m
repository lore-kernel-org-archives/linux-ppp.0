From: Bill Unruh <unruh@physics.ubc.ca>
Date: Wed, 13 Sep 2006 15:55:37 +0000
Subject: Re: serial device access from welcome script
Message-Id: <Pine.LNX.4.61.0609130853340.19410@info.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <200609061445.20406.thilo@riessner.de>
In-Reply-To: <200609061445.20406.thilo@riessner.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Wed, 13 Sep 2006, Thilo Riessner wrote:

> The program needs one device for reading and writing. Therefore the /dev/stdin
> and /dev/stdout is not usable. Or do I get something wrong there?
>

???? reading=/dev/stdin, writing=/dev/stdout. ???

Also a device or whatever can in general be opened for both reading and
writing.


>
>> Use the files /dev/stdin and /dev/stdout
>>
>> On Thu, 2006-09-07 at 16:44 +0200, Thilo Riessner wrote:
>>> Am Mittwoch, 6. September 2006 23:53 schrieben Sie:
>>>> Thilo Riessner writes:
>>>>>> From a program called by the welcome script which tries to access
>>>>>> the serial
>>>>>
>>>>> port (in this case /dev/ttyI0) I get the errormessage:
>>>>>         Port or socket open error!
>>>>> I guess, that the serial port is blocked by the pppd.
>>>>> Is there any possibility to access the serial port nevertheless?
>>>>
>>>> You shouldn't be trying to access the port directly.  Instead, when
>>>> the "welcome" script runs, your script's standard input and standard
>>>> output are connected directly to the tty.
>>>>
>>>> You should be able to use 'read' and 'echo' (or whatever your
>>>> scripting language supports) without having to open anything.
>>>>
>>>> This is true for "connect", "disconnect", "init", and "pty" as well.
>>>
>>> Thanks for your hint, but I have the problem, that the program (which is
>>> a binary program) I am running out of my welcome script (which is a bash
>>> script) does not support the usage of stdin and stdout, but it demands
>>> the usage of a device for reading and writing. Is there a trick that I
>>> could use in the  welcome script to  redirect stdin and stdout to a
>>> "device" and use that device in the program, which is called from the
>>> welcome script. -
>>> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
