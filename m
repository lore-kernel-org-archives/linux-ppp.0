From: Greg <gregborbonus@gmail.com>
Date: Sun, 09 Mar 2014 14:14:29 +0000
Subject: Re: pppd plugin development
Message-Id: <531C7745.9050006@gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <531BEBF2.3020508@gmail.com>
In-Reply-To: <531BEBF2.3020508@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I've been able to code a basic plugin. The problem I'm having now is 
that I can't seem to figure out how to retrieve the password from the 
chap_verify_hook.

I've gotten my code to work with the hook, but the password appears to 
be fully encrypted. Does anyone know how I can get the original 
password, or an MD5 version of the password entered?

Thank you,
Greg Borbonus
*Nix Server administrator

On 3/8/2014 10:20 PM, Greg wrote:
> Hi guys,
>
> I'm trying to develop a module that will allow me to authenticate via 
> a script.
> a simple call to execute script and it's return value says whether or 
> not to authenticate.
>
> If someone had already coded something like that, please let me know.
> Otherwise, Is there any documentation? (besides the man page)
>

