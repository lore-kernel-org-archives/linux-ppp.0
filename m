From: Edwardo Garcia <wdgarc88@gmail.com>
Date: Wed, 09 Sep 2015 05:28:56 +0000
Subject: RESOLEVE: pppd, pptpd and radius DNS assigns
Message-Id: <CANso6eH5Ap1ynk2bKNbZyBQdbZ-B=vnxDkX7BzvTWGvVgM8yvw@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

>>>
>>>
>> did you read/follow
>>   http://wiki.freeradius.org/guide/PopTop-HOWTO
>>
>> ?  the radius server *must* respond with the Microsoft vendor id (311)
>> set, otherwise the plugin will not pick up the supplied DNS values.
>>
>>
>> JJK
>>
>
> yes, and yes but it does not
>
>>


The problem is fix, the dicitonary file everybody has on web is wrong,
include freeradius website wiki

From: Noel Butler	Wed, Sep 9, 2015 at 11:06 AM
To: wdgarc88@gmail.com

Willy,

The radius plugin has the code, the problem lies with the broken
dictionary.microsoft file
find attributes 28 and 29, you'll see the rest of the file has 5
entries, the last being the word microsoft, now look at 28 and 29,
youll see theres only 4 values, the 5th, being the term Microsoft is
missing, but for radius to work it *needs* them, so edit the file
adding them, restart pptp and you should see it dishing them out by
checking with your client, and by /var/run/radattr.pppn

I'll try correct the wiki entry soon, if I cant I'll nudge Arran to change it.
