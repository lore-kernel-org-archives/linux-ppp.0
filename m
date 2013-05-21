From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Tue, 21 May 2013 18:40:09 +0000
Subject: Re: [RFC PATCH v2 2/4] ppp_mppe: check coherency counter for out-of-order sequencing
Message-Id: <519BBF89.1040900@cogentembedded.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <1369160304-31967-1-git-send-email-jorge@dti2.net> <1369160304-31967-2-git-send-email-jorge@dti2.net>
In-Reply-To: <1369160304-31967-2-git-send-email-jorge@dti2.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jorge@dti2.net
Cc: netdev@vger.kernel.org, linux-ppp@vger.kernel.org

Hello.

On 05/21/2013 10:18 PM, Jorge Boncompte [DTI2] wrote:

> From: "Jorge Boncompte [DTI2]" <jorge@dti2.net>
>
> While testing a L2TP tunnel without sequencing with MPPE encryption in
> stateless mode noticed that after a packet was reordered the encapsulated
> traffic session was stuck but testing against a Cisco gear did work.
>
>  From RFC3078 "MPPE expects packets to be delivered in sequence".
>
> The thing it's that the ppp_mppe module treats the reorder as if the
> coherency counter did wrap and rekeys all the "missing" packets.
>
> The link layer protocol should deliver the packets in order but at least
> with this patch in place the decryption process survives some packet reorder.
>
> Signed-off-by: Jorge Boncompte [DTI2] <jorge@dti2.net>
> ---
>   drivers/net/ppp/ppp_mppe.c |   23 ++++++++++++++++++++++-
>   1 file changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/ppp/ppp_mppe.c b/drivers/net/ppp/ppp_mppe.c
> index 9a1849a..97f4804 100644
> --- a/drivers/net/ppp/ppp_mppe.c
> +++ b/drivers/net/ppp/ppp_mppe.c
[...]
> @@ -547,6 +559,15 @@ mppe_decompress(void *arg, unsigned char *ibuf, int isize, unsigned char *obuf,
>   	 */
>   
>   	if (!state->stateful) {
> +		if (mppe_cmp_ccount(ccount, state->ccount) < 0) {
> +			if (net_ratelimit())
> +				printk(KERN_WARNING "%s[%d]: Dropping out-of-order "

     Why not pr_warn()?

WBR, Sergei

