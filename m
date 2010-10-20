From: Stephen Marron <debian@solo.boxfusion.net>
Date: Wed, 20 Oct 2010 05:35:45 +0000
Subject: Re: multilink with nodetach [PATCH]
Message-Id: <4CBE7CE1.1070506@solo.boxfusion.net>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

*Bump* :)

Is there any chance of the below patch making it in to mainline?

Im happy to test it in any specific scenarios that someone might have
concerns with... or if further explanation is nessicary im happy to
answer any questions that you might have?

Regards

Stephen

On 24/08/10 18:25, Stephen Marron wrote:
> Hi
> 
> This bug has been Reported in the Debian BTS as bug 538107
> 
> 	http://bugs.debian.org/578070
> 
> If pppd is used with l2tpd (nodetach) in a multilink situation then this
> feature of pppd causes problems
> 
> 	MULTILINK
> 	If the first link terminates (for example, because of  a
> 	hangup or  a received  LCP  terminate-request)  the  bundle  is
> 	not destroyed unless there are no other links remaining in the
> 	bundle.  Rather than exiting, the first pppd keeps running
> 	after its link terminates, until all the links in the bundle
> 	have terminated.
> 
> pppd remains connected to l2tpd even though it is just acting as a
> multilink master, causing l2tpd to believe that pppd is connected... i
> have resolved the issue in my own system by instructing pppd to detach
> from the terminal after it changes to PHASE_MASTER i have been using
> this patch since 2009-02-19 in our production systems and havent had any
> problems
> 
> The "if (!detached)" call is redundant since the detach function already
> checks if the process is detached so can be optionally excluded
> 
> I have noticed other people complaining of similar issues when using
> multilink/nodetach in other setups (eg pppoe) I believe that this patch
> may also solve the problem for them, but i have not tested that setup
> 
> -----
> diff --git a/pppd/auth.c b/pppd/auth.c
> index fb71944..62648b8 100644
> --- a/pppd/auth.c
> +++ b/pppd/auth.c
> @@ -669,8 +669,11 @@ link_terminated(unit)
>         (*the_channel->cleanup)();
> 
>      if (doing_multilink && multilink_master) {
> -       if (!bundle_terminating)
> +       if (!bundle_terminating) {
>             new_phase(PHASE_MASTER);
> +           if (!detached)
> +               detach();
> +       }
>         else
>             mp_bundle_terminated();
>      } else
> -----
> 
> feedback is appreciated :)
> 
> Regards
> 
> Stephen
