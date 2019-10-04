From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Fri, 04 Oct 2019 07:06:05 +0000
Subject: Re: [PATCH 4/9] pppd: include time.h before using time_t
Message-Id: <20191004070344.GB881@x1.vandijck-laurijssen.be>
List-Id: <linux-ppp.vger.kernel.org>
References: <1569482466-9551-5-git-send-email-dev.kurt@vandijck-laurijssen.be>
In-Reply-To: <1569482466-9551-5-git-send-email-dev.kurt@vandijck-laurijssen.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-ppp@vger.kernel.org

On vr, 04 okt 2019 08:40:54 +1000, Paul Mackerras wrote:
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

I have no Solaris around, hence I didn't see that problem :-)

My output:

cd pppd; make  all
make[1]: Entering directory `/srv/src/net/ppp/pppd'
musl-gcc -O2 -pipe -Wall -g -DHAVE_PATHS_H -DIPX_CHANGE -DHAVE_MMAP -I../include '-DDESTDIR="/usr/local"' -DCHAPMS=1 -DMPPE=1 -DHAS_SHADOW -DHAVE_CRYPT_H=1 -I/usr/include/openssl -DHAVE_MULTILINK -DUSE_TDB=1 -DPLUGIN -DINET6=1 -DMAXOCTETS   -c -o sha1.o sha1.c
In file included from sha1.c:21:0:
../include/net/ppp_defs.h:182:5: error: unknown type name ‘time_t’
     time_t xmit_idle;  /* time since last NP packet sent */
     ^
../include/net/ppp_defs.h:183:5: error: unknown type name ‘time_t’
     time_t recv_idle;  /* time since last NP packet received */
     ^
make[1]: *** [sha1.o] Error 1
make[1]: Leaving directory `/srv/src/net/ppp/pppd'

the time_t type isn't defined while being used.
AFAIK, time_t is defined in time.h

Wrapping the include inside a #ifdef SOLARIS seems the most correct solution.
including sys/time.h works, but that is rather by accident at this moment.

Kind regards,
Kurt
