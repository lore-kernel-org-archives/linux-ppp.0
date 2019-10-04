From: Levente <leventelist@gmail.com>
Date: Fri, 04 Oct 2019 08:22:30 +0000
Subject: Re: [PATCH 4/9] pppd: include time.h before using time_t
Message-Id: <CACwWb3BoHF0WQ3ve3PQ_7L3LfJsvqC3Z9ZF5zOwd-r-GWv8CuA@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <1569482466-9551-5-git-send-email-dev.kurt@vandijck-laurijssen.be>
In-Reply-To: <1569482466-9551-5-git-send-email-dev.kurt@vandijck-laurijssen.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

IMHO time_t is defined in sys/types.h


Lev

On Fri, Oct 4, 2019 at 9:28 AM Paul Mackerras <paulus@ozlabs.org> wrote:
>
> On Thu, Sep 26, 2019 at 09:21:01AM +0200, Kurt Van Dijck wrote:
> > Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
> > ---
> >  include/net/ppp_defs.h | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/include/net/ppp_defs.h b/include/net/ppp_defs.h
> > index b06eda5..ed04486 100644
> > --- a/include/net/ppp_defs.h
> > +++ b/include/net/ppp_defs.h
> > @@ -35,6 +35,8 @@
> >   * OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
> >   */
> >
> > +#include <time.h>
> > +
> >  #ifndef _PPP_DEFS_H_
> >  #define _PPP_DEFS_H_
>
> I applied this series, but then reverted this one because it breaks
> compilation of the kernel device driver on Solaris.  What exactly is
> the error that you are seeing without this #include?  Would your error
> be fixed by including <sys/time.h> (which would be OK on Solaris)?
>
> Paul.
