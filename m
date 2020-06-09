From: James Carlson <carlsonj@workingcode.com>
Date: Tue, 09 Jun 2020 18:03:46 +0000
Subject: Re: PPP cycling between UP and DOWN
Message-Id: <53c19667-8ddd-e192-0d3c-db63bced8255@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <f44e7e14-1621-7141-66a3-3a2218e8db86@mahan.org>
In-Reply-To: <f44e7e14-1621-7141-66a3-3a2218e8db86@mahan.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-ppp@vger.kernel.org

On 6/8/20 6:51 PM, Patrick Mahan wrote:
> On 6/8/20 10:15 AM, James Carlson wrote:
>> On 2020-06-08 13:04, Patrick Mahan wrote:
>>> Connect time 0.1 minutes.
>>> Sent 0 bytes, received 10 bytes.
>>>
>>> NOTE: This is where I think the ip-down callout was triggered.
>>
>> This looks like it could be a normal tear-down of some sort.  Without
>> debug information, we're not going to be able to say a whole lot more
>> about this.  (Crucially, a debug log would likely show which side
>> initiated the tear-down.)
>>
> 
> Understood.  And if we ever get this problem to occur again, I should 
> have those logs.

If this were due to IPCP Terminate-Request from the peer, there should 
have been an "IPCP terminated by peer" message emitted.  (That's done at 
'info' severity level, just like "Connect time," so if you see one, 
you'll see the other.)

If LCP terminated, you should have seen "Connection terminated."

If it were a local signal, then you would have seen "Terminating on signal."

And, of course, lower layer shutdown can be indicated by "Hangup 
(SIGHUP)" or "Modem hangup," depending on whether we find out about the 
issue via a UNIX signal or through EOF on the file descriptor.

The fact that none of these appear is a bit puzzling.  It *could* be 
something the plug-in is doing, but I'm not at all sure at this point. 
(If we do find out what it is, and if it's something in pppd that's 
doing this, we should definitely add a log message for this case.)

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
