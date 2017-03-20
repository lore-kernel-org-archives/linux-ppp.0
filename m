From: James Carlson <carlsonj@workingcode.com>
Date: Mon, 20 Mar 2017 11:07:25 +0000
Subject: Re: Setup pppd over rs-485 point-to-point
Message-Id: <1b2b66d5-5760-edb3-da67-e178a5e3d6fa@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <2d19b2f1-bb0f-9a09-6d40-f05388c66af5@gmail.com>
In-Reply-To: <2d19b2f1-bb0f-9a09-6d40-f05388c66af5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 03/19/17 10:40, Woody Wu wrote:
> 
> 
> On 03/17/2017 08:05 PM, James Carlson wrote:
>>   - Use a master-slave type of relationship.  This means having one end
>>     (perhaps the PC in this case) sending some sort of signal (I suggest
>>     using back-to-back flags; two 0x7E in a row) to let the slave side
>>     know it should send something if it has it, or to send an empty
>>     packet.  The master then just periodically polls for data or sends
>>     what it has.
> 
> Does this mean I hava to change the pppd source code or even the Linux
> kernel?

I don't think it would necessarily require pppd source changes (though
it's possible someone might want to add an option to control the
feature), but it'd certainly require substantial kernel changes to add
the logic to do the signaling and timing elements.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
