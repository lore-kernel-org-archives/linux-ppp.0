From: James Carlson <carlsonj@workingcode.com>
Date: Wed, 28 Oct 2009 20:20:06 +0000
Subject: Re: pty
Message-Id: <4AE8A776.5060202@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <W5658327625161531256756882@webmail25>
In-Reply-To: <W5658327625161531256756882@webmail25>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

tony.chamberlain@lemko.com wrote:
> I am curious how the pppd pty process (in this case ppp_relay) communicates
> to pppd?  We did a netstat and found pppd but no TCP nor UDP ports were
> associated with it.  It was just a UNIX-type process.

The ppp_relay process will have stdin and stdout connected to the master
side of a pty pair.  Pppd then configures PPP to run on the slave side.
 Pppd is completely unaware of what that child process is doing; it
won't have any network ports open.

The process run by the pppd "pty" option should read and write
AHDLC-encoded PPP packets on standard input and output.  Where and how
it gets those packets are a problem for the person writing ppp_relay.

Or, as the fine man page says:

       pty script
        Specifies  that  the command script is to be used to communicate
        rather than a specific  terminal  device.   Pppd  will  allocate
        itself  a  pseudo-tty master/slave pair and use the slave as its
        terminal device.  The script will be run in a child process with
        the  pseudo-tty  master  as  its  standard input and output.  An
        explicit device name may not be given if this  option  is  used.
        (Note:  if  the record option is used in conjuction with the pty
        option, the child process will have pipes on its standard  input
        and output.)

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
