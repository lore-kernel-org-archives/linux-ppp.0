From: Greg <gregborbonus@gmail.com>
Date: Mon, 10 Mar 2014 14:23:08 +0000
Subject: Re: PPPD plugin development
Message-Id: <531DCACC.2020309@gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------050404080506030007060204"
List-Id: <linux-ppp.vger.kernel.org>
References: <531BEBF2.3020508@gmail.com>
In-Reply-To: <531BEBF2.3020508@gmail.com>
To: linux-ppp@vger.kernel.org

This is a multi-part message in MIME format.
--------------050404080506030007060204
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I'm attempting to authenticate a user who is trying to connect to pptp 
via an external means.

They would sign up on the site and have the username and password stored 
in a database(I do not want direct database access).  The password would 
be encrypted(MD5).


On 3/10/2014 9:01 AM, James Carlson wrote:
> On 03/10/14 08:31, Greg wrote:
>> as stated before, I'm trying to write a plugin to authenticate against
>> an external script. So far, I've only managed to get it to write a bit
>> information to a log file on the server.
> It would help if you could provide details -- the code you're using, the
> debug log messages, the configuration options in use, and any other
> information related to your system.
>
> At this point, I'm not even really sure whether you're attempting to
> write authenticator or authenticatee code.  The two are different.
> Details on the problem to be solved would help -- "authenticate against
> an external script" is a chosen solution to some issue, not a problem
> statement.
I'm attempting to write an authenticator on the server itself.

As for the debugging, how can I provide that for you?

The code is attached.


>> I'm trying to use the digest->code to determine the type of digest used.
>> I figured that if I can find out which type it's using then I could then
>> move forward with converting it or determining how to store the
>> encrypted password to do a comparison.
> digest->code will have the PPP code number for the digest type, which
> will be CHAP_MD5 (0x05), CHAP_MICROSOFT (0x80), or CHAP_MICROSOFT_V2 (0x81).
>
> You can see all of the registered chap_digest_type objects by grepping
> the code for chap_register_digest.
>
> I don't believe it can end up being anything else, given the current design.
It's empty.

>> I've also made it return 1 so that no matter what I enter, it should
>> show authenticated.
>>
>> digest->code writes as blank.
> "writes"?
I'm writing the output of the variables to a file.
I've tried writing the value of digest->code to a file. it's empty or 
being interpreted in such a way that it's not writing anything to the file.


>
>> When using it as a switch->case scenario, it goes to default:
>> switch (digest->code) {
>>          case CHAP_MICROSOFT:
>>          {
>>            codemess = "MIC";
>>          }
>>          case CHAP_MICROSOFT_V2:
>>          {
>>            codemess = "MV2";
>>          }
>>          default:
>>            codemess = "Default";
>> }
> At a guess, that should mean that digest->code is CHAP_MD5, though I'm
> really not sure without more information.  A debug trace would likely
> show more, as would a copy of your code.
I missed that one, but added it to the check and it to still shows default.
>> The return 1 appears to work, but then I get the message:
>> MPPE required, but keys are not available.  Possible plugin problem?
> If you return 1 when MS-CHAP is enabled, then you're required to set up
> keys and set the mppe_keys_set flag.  It's a bit ugly, but MPPE and
> MS-CHAP are deeply intertwined.
>
>> I REALLY wish this was a documented better. Though I code in other
>> scripting languages, C is not something I'm used to coding. So please
>> feel free to give me a hard time, I'm muddling my way through C just to
>> get the basics right.
> The plug-in interface just is not designed for use by someone without a
> deep understanding of the existing code and a healthy amount of C
> experience.  I somewhat doubt that a plug-in shared library type
> interface, regardless of the depth of the documentation, could get
> around that.
>
> Normally, when folks want to do external authentication, they do it with
> RADIUS or some other AAA protocol like that.  It might help to know what
> problem you're trying to solve.
>

Thank you,
Greg Borbonus
*Nix Server administrator


--------------050404080506030007060204
Content-Type: text/plain; charset=windows-1252;
 name="external_auth.c.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="external_auth.c.txt"

#include "pppd.h"
#include "chap-new.h"
#include "chap_ms.h"
#ifdef MPPE
#include "md5.h"
#endif
#include "fsm.h"
#include "ipcp.h"
#include <syslog.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/time.h>
#include <sys/wait.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#include <errno.h>
#include <ctype.h>

/**
        static int external_chap_check(void);
        static int external_chap_verify(char *user, char *ourname, int id,
                    struct chap_digest_type *digest,
                    unsigned char *challenge,
                    unsigned char *response,
                    char *message, int message_space);
**/
        static int external_chap_check(void){
          return 1;
        }
        static int external_auth_hook(char *user, char *ourname, int id,
                    struct chap_digest_type *digest,
                    unsigned char *challenge,
                    unsigned char *response,
                    char *message, int message_space)
        {
char *codemess;
switch (digest->code) {
        case CHAP_MICROSOFT:
        {
          codemess = "MIC";
        }
        case CHAP_MICROSOFT_V2:
        {
          codemess = "MV2";
        }
        case CHAP_MD5:
        {
          codemess = "MD5";
        }
        default:
          codemess = "Default";
}

        FILE *f = fopen("/tmp/auth.pppd.log", "w");
if (f == NULL)
{
    printf("Error opening file!\n");
    exit(1);
}



fprintf(f, "User: %s\n", user);
fprintf(f, "Challenge: %s\n",challenge);
fprintf(f, "Response: %s\n", response);
fprintf(f, "CODE: %s\n",codemess);

fclose(f);


        return 1;
        }


void plugin_init(void) {
        dbglog("PLUGIN: Initializing authenticaton plugin.");


        chap_check_hook=external_chap_check;
        chap_verify_hook=external_auth_hook;

        return;
}
--------------050404080506030007060204--
