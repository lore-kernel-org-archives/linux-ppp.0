From: Christopher Fowler <cfowler@outpostsentinel.com>
Date: Tue, 08 Mar 2005 18:06:57 +0000
Subject: Re: IPCP ConfRej's forever
Message-Id: <1110305217.18073.151.camel@linux.linxdev.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <1110253772.18073.91.camel@linux.linxdev.com>
In-Reply-To: <1110253772.18073.91.camel@linux.linxdev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Ahh.  The FC@ and the Remote operate in demand mode.  pppd is running at
all times on each but there is no physical connection between them until
packets are sent.  Then the connection's idle limit is 30 seconds.  So
the two devices speak via IP with our software but aer only connected on
demand with modems.

On Tue, 2005-03-08 at 12:58, Bill Unruh wrote:
> On Tue, 8 Mar 2005, Christopher Fowler wrote:
> 
> > Te remote is a locked down device.  It is an embedded device running
> > Linux.  each ppp profile is tied to a port.  The profile determines what
> > command line options pppd is executed with.
> >
> > In one case our FC2 server will dial in with ipaddresses that the remote
> > needs to accept.  In the other case a Windows laptop will dial-in
> > requesting remote ip addresses.
> 
> I guess my question would be, why the FC2 needs to supply the addresses. 
> Potentially the only possible reason would be if the remote site MUST
> access the web and you want to do proxyarp. But somehow I doubt this for a
> locked down device. If not, then just have all the system accept that
> machine's addresses.
> 
> >
> > When testnig command line arguments I found this problem of when a
> > server dials in and tries wants to use addresses that are not configured
> > for that profile then this forever loop occurs.  since all this happens
> > over dial-up a misconfiguration on the users part in the profile will
> > cause a very high phone bill since the remote nor the server terminate
> > since they can not agree on the correct addresses to use.
> 
> I agree that it should teminate and that this is a bug.
> 

