From: Greg <gregborbonus@gmail.com>
Date: Tue, 11 Mar 2014 09:55:27 +0000
Subject: Re: PPPD plugin development
Message-Id: <531EDD8F.2000801@gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <531BEBF2.3020508@gmail.com>
In-Reply-To: <531BEBF2.3020508@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hey guys,

Once again, Thanks for all the help.

I've managed to get it to work completely. I had to globalize a USERID 
variable, and from there I was able to set it in the verify function and 
call it from the ip_down notifier. This allowed me to do all the 
updating I needed.

Thanks again for all your help.

Thank you,
Greg Borbonus
*Nix Server administrator

On 3/10/2014 11:56 PM, Greg wrote:
> Thanks guys for help. James you have especially helped.
>
> Update: I've managed to get everything working. I had to ditch the 
> notion of stored password hashes and went with an encrypted password 
> with salts.
>
> Ran into an issue with allowed ips, but quickly fixed that with a 
> function within the plugin.
>
> One last thing left to do, I need to execute a function when the user 
> disconnects. I believe I need to use the "add_notifier" function and 
> set "ip_down_notifier" to a local function within the plugin.
>
> Does anyone know how I might obtain the username from that function? 
> It seems the notifier functions are used even less than the verify 
> hook I've been working with.
>
> Thank you,
> Greg Borbonus
> *Nix Server administrator
>
> On 3/10/2014 10:14 AM, James Carlson wrote:
>> On 03/10/14 10:23, Greg wrote:
>>> I'm attempting to authenticate a user who is trying to connect to pptp
>>> via an external means.
>>>
>>> They would sign up on the site and have the username and password 
>>> stored
>>> in a database(I do not want direct database access).  The password 
>>> would
>>> be encrypted(MD5).
>> MD5 isn't encryption.  It's hashing.  The big difference is that hashes
>> are (by design) not reversible.
>>
>> What you're describing just cannot be done because it's architecturally
>> flawed.  PAP, by design, passes the raw password on the wire, which
>> means that the recipient (the authenticator) can do the usual sort of
>> hashed password comparison: look up the stored hashed password, compute
>> a hash based on the input, and compare results.
>>
>> CHAP doesn't work that way.  With CHAP, the authenticator presents a
>> Challenge to the authenticatee.  That authenticatee then computes a hash
>> and sends it back.  The authenticator then must look up the CLEAR TEXT
>> passphrase, compute a hash based on the CLEAR TEXT and the challenge,
>> and compare results.
>>
>> Note that important part in the previous paragraph: with PAP, the server
>> need not store the original password, but with CHAP, it MUST. This is
>> exactly how it's designed.  See RFC 1994.
>>
>> Of course, MS-CHAP is a little different.  What it does is compute an
>> intermediate passphrase based on an MD4 (not MD5) hash of what the user
>> believes to be the password.  This intermediate passphrase is then used
>> as the actual passphrase for the challenge/response handshake. (Indeed,
>> there's no need for either side to know the original user's password;
>> storing just the intermediate value works as well.  You can do the same
>> with regular CHAP so why the MD4 part is written into the protocol is
>> beyond me.  Individual submissions are strange like that.)
>>
>> I guess that whoever designed that database didn't take that wrinkle
>> into account.
>>
>> That issue aside, PPTP as I understand it generally requires the MS-CHAP
>> variant and MPPE.  So, if you're the autenticator, you should have
>> "require-mschap" or (more likely) "require-mschapv2", plus
>> "require-mppe" among your configuration options.
>>
>>> I'm attempting to write an authenticator on the server itself.
>>>
>>> As for the debugging, how can I provide that for you?
>> Text works.  Use the "debug" option and make sure that syslog
>> "daemon.debug" is directed to a file.
>>
>> Or if syslog isn't an option for some reason, then use the "logfile
>> /tmp/pppd.log" option to direct the log messages to the specified file.
>>   (You can choose any file name you like, of course.)
>>
>>> The code is attached.
>> In your code, "challenge" and "response" are not strings, so printing
>> them that way (even for debug) isn't going to work so well. These are
>> arrays of bytes.
>>
>>>> I don't believe it can end up being anything else, given the current
>>>> design.
>>> It's empty.
>> I still don't understand.  Integers aren't "empty."
>>
>>>>> I've also made it return 1 so that no matter what I enter, it should
>>>>> show authenticated.
>>>>>
>>>>> digest->code writes as blank.
>>>> "writes"?
>>> I'm writing the output of the variables to a file.
>>> I've tried writing the value of digest->code to a file. it's empty or
>>> being interpreted in such a way that it's not writing anything to 
>>> the file.
>> Does the file get created at all?  If so, does it have zero length?
>>
>> Not writing anything to the file doesn't suggest that digest->code is
>> empty.  It suggests that something in your code is falling apart.
>>
>> There's at least one obvious bug here: that switch statement doesn't
>> work because it lacks "break;" between the cases.  Thus, everything
>> falls down to just "Default."  Instead of this:
>>
>>          case CHAP_MICROSOFT:
>>          {
>>            codemess = "MIC";
>>          }
>>          case CHAP_MICROSOFT_V2:
>>          {
>>            codemess = "MV2";
>>          }
>>          case CHAP_MD5:
>>          {
>>            codemess = "MD5";
>>          }
>>          default:
>>            codemess = "Default";
>> }
>>
>> Try this:
>>
>>          case CHAP_MICROSOFT:
>>          {
>>            codemess = "MIC"; break;
>>          }
>>          case CHAP_MICROSOFT_V2:
>>          {
>>            codemess = "MV2"; break;
>>          }
>>          case CHAP_MD5:
>>          {
>>            codemess = "MD5"; break;
>>          }
>>          default:
>>            codemess = "Default";
>> }
>>
>> I don't know what else might be wrong.
>>
>> For what it's worth, I suggest using the logging functions in util.c
>> (fatal, error, warn, notice, info, dbglog) rather than rolling your own
>> with fprintf.  Even with "just" debug code, I think it's easier to use
>> the existing infrastructure.
>>
>

