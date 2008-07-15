From: James Carlson <carlsonj@workingcode.com>
Date: Tue, 15 Jul 2008 15:28:58 +0000
Subject: Re: a question about script_setenv in main.c for pppd code
Message-Id: <18556.49722.631932.374787@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <200807151722144210868@gmail.com>
In-Reply-To: <200807151722144210868@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

c4linux writes:
>     /* check if this variable is already set */
>     if (script_env != 0) {
> 	for (i = 0; (p = script_env[i]) != 0; ++i) {
> 	    if (strncmp(p, var, varl) = 0 && p[varl] = '=') {
> #ifdef USE_TDB
> 		if (p[-1] && pppdb != NULL)
> 		    delete_db_key(p);
> #endif
> 		free(p-1);
>   ......
>   ......
> 
> why not free(p) but free(p-1) ?

It's because of these two lines in that same function:

    *newstring++ = iskey;
[...]
    script_env[i] = newstring;

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
