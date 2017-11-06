From: David Fernandez <david.fernandez.work@googlemail.com>
Date: Mon, 06 Nov 2017 14:59:24 +0000
Subject: Re: SOLVED: kernel-mode PPPoE does not seem able to work with MPPE.
Message-Id: <65b0fb13-a602-4370-2ae7-5fe78a7d7560@googlemail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <7587137d-f9ae-a4ac-843e-6688af5ff017@googlemail.com>
In-Reply-To: <7587137d-f9ae-a4ac-843e-6688af5ff017@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-ppp@vger.kernel.org

On 06/11/17 14:19, Charlie Brady wrote:
> Why would you do this, rather than just delete the code you are removing?
>
>> --- a/drivers/net/ppp/ppp_mppe.c
>> +++ b/drivers/net/ppp/ppp_mppe.c
>> @@ -521,11 +521,12 @@ mppe_decompress(void *arg, unsigned char
>>                  state->sanity_errors += 100;
>>                  goto sanity_error;
>>          }
>> -       if (state->stateful && ((ccount & 0xff) = 0xff) && !flushed) {
>> +       if (state->stateful && ((ccount & 0xff) = 0xff) && !flushed)
>> {/*
>>                  printk(KERN_DEBUG "mppe_decompress[%d]: FLUSHED
>> bit not set on "
>>                         "flag packet!\n", state->unit);
>>                  state->sanity_errors += 100;
>> -               goto sanity_error;
>> +               goto sanity_error;*/
>> +                flushed = 1;
>>          }

Hi Charlie,

Yes, the code could be deleted, I just wanted somebody to check and say 
that there is no point in yet putting a warning in the log for this...

Definitely you could do:

--- a/drivers/net/ppp/ppp_mppe.c
+++ b/drivers/net/ppp/ppp_mppe.c
@@ -521,11 +521,7 @@ mppe_decompress(void *arg, unsigned char
                 state->sanity_errors += 100;
                 goto sanity_error;
         }
-       if (state->stateful && ((ccount & 0xff) = 0xff) && !flushed) {
+       if (state->stateful && ((ccount & 0xff) = 0xff) && !flushed)
-               printk(KERN_DEBUG "mppe_decompress[%d]: FLUSHED bit not 
set on "
-                      "flag packet!\n", state->unit);
-               state->sanity_errors += 100;
-               goto sanity_error;
+               flushed = 1;
-       }

         /*
@@ -586,8 +587,9 @@ mppe_decompress(void *arg, unsigned char
                                  */
                         }
                 }
-               if (flushed)
+               if (flushed && (state->bits & 1) != 0)
                         mppe_rekey(state, 0);
+               state->bits |= 1;
         }

         /*

Would be good to have this patch in the current and previous kernel 
versions, as it seems to apply cleanly enough.

If there is anything I can do to prepare a more formal patch, let me 
know. Specially some formating and changelog things that I am not aware of.

Regards


