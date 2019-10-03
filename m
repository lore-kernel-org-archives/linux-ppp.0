From: Paul Mackerras <paulus@ozlabs.org>
Date: Thu, 03 Oct 2019 22:40:54 +0000
Subject: Re: [PATCH 4/9] pppd: include time.h before using time_t
Message-Id: <20191003224054.GA26158@blackberry>
List-Id: <linux-ppp.vger.kernel.org>
References: <1569482466-9551-5-git-send-email-dev.kurt@vandijck-laurijssen.be>
In-Reply-To: <1569482466-9551-5-git-send-email-dev.kurt@vandijck-laurijssen.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, Sep 26, 2019 at 09:21:01AM +0200, Kurt Van Dijck wrote:
> Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
> ---
>  include/net/ppp_defs.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/net/ppp_defs.h b/include/net/ppp_defs.h
> index b06eda5..ed04486 100644
> --- a/include/net/ppp_defs.h
> +++ b/include/net/ppp_defs.h
> @@ -35,6 +35,8 @@
>   * OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
>   */
>  
> +#include <time.h>
> +
>  #ifndef _PPP_DEFS_H_
>  #define _PPP_DEFS_H_

I applied this series, but then reverted this one because it breaks
compilation of the kernel device driver on Solaris.  What exactly is
the error that you are seeing without this #include?  Would your error
be fixed by including <sys/time.h> (which would be OK on Solaris)?

Paul.
