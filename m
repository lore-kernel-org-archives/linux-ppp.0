From: Bill Unruh <unruh@physics.ubc.ca>
Date: Wed, 28 Apr 2004 02:30:28 +0000
Subject: Re: Interface Name
Message-Id: <Pine.LNX.4.50.0404271926500.399-100000@string.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <408E24E6.6090900@guox.net>
In-Reply-To: <408E24E6.6090900@guox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Wed, 28 Apr 2004 soragan@guox.net wrote:

> > On Tue, 27 Apr 2004, James Cameron wrote:
> >
> >> On Tue, Apr 27, 2004 at 07:16:22PM +1000, Soragan Guo wrote:
> >> > how to modify the interface name become pptp0 or adsl0 or any other
> >> > name according to type of connection?
> >>
> >> The name is set by the PPP kernel module.  With suitable expertise you
> >> could modify the kernel module.
> >
> > Actually pppd 2.4.x includes an options called "unit" with which you can
> > request pppd give you that numbr for the interface. If it is not
> > available, it will use the next available one anyway.
> 
> never try that option, but what i am trying to do it to change the
> interface name, not the number like ppp0 ppp1 :)

There is also the linkname option. 

       linkname name
              Sets  the  logical name of the link to name.  Pppd will create a
              file named ppp-name.pid in /var/run (or /etc/ppp  on  some sys-
              tems)  containing  its process ID.  This can be useful in deter-
              mining which instance of pppd is responsible for the link to  a
              given peer system.  This is a privileged option.

Do not know if that would do what you want. 


