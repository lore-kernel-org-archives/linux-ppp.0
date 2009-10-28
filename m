From: Bill Unruh <unruh@physics.ubc.ca>
Date: Wed, 28 Oct 2009 20:23:20 +0000
Subject: Re: pty
Message-Id: <Pine.LNX.4.64.0910281316230.4393@info.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <W5658327625161531256756882@webmail25>
In-Reply-To: <W5658327625161531256756882@webmail25>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I presume that you have the program ppp_relay which you say he wrote. You will
have to look into that to see what it does.

man pppd

  pty script
               Specifies that the command script is to be used to commu-
               nicate rather than a specific terminal device.  Pppd will
               allocate  itself  a  pseudo-tty master/slave pair and use
               the slave as its terminal device.  The script will be run
               in  a  child  process  with  the pseudo-tty master as its
               standard input and output.  An explicit device  name  may
               not  be  given  if  this  option  is used.  (Note: if the
               record option is used in conjuction with the pty  option,
               the  child  process will have pipes on its standard input
               and output.)

pppd connects it stdout to that program's stdin, and stdin to that program's
stdout. Ie, that program is responsible for all communications with the phone.

You will have to look at it to see why no responses are generated. ( you could
also look at the debug output of pppd to see what pppd is seeing-- you can up
the log level to get more detailed info.
pppd uses the daemon log facility of syslog for its error messages. 
iYou need something like
daemon.*       /var/log/daemonlog
in /etc/syslog.conf
to get the stuff output to the file /var/log/daemonlog.

See the entry for "debug" in man pppd

On Wed, 28 Oct 2009, tony.chamberlain@lemko.com wrote:

> This is somewhat different from my other question and is on a different
> system and of course the person who developed it left.
>
> There is a mobile phone which connects to a CDMA BTS and then from there
> to a Linux machine.  A process called pdsn is running on the linux machine
> and detects when the mobile phone calls.  It then spawns a process with
> a bunch of parameters (port, ip, etc) like this
>
>   pppd pty 'ppp_relay -p port -a address ...'
>
> So pppd uses ppp_relay (which is also something he wrote) to handle the
> ppp stuff.
>
> Now this worked on Red Hat 9 but there seems to be a problem on CentOS 4.5.
>> From what I can tell, ppp_relay receives a TCP port number (I guess from
> pdsn?) and tries to communicate to the pppd process through this port.
> It sends a message but never gets a response.
>
> I am curious how the pppd pty process (in this case ppp_relay) communicates
> to pppd?  We did a netstat and found pppd but no TCP nor UDP ports were
> associated with it.  It was just a UNIX-type process.
>
> Is ppp_relay attempting to talk through a port when it should be using
> some kind of Linux message?
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

-- 
William G. Unruh   |  Canadian Institute for|     Tel: +1(604)822-3273
Physics&Astronomy  |     Advanced Research  |     Fax: +1(604)822-5324
UBC, Vancouver,BC  |   Program in Cosmology |     unruh@physics.ubc.ca
Canada V6T 1Z1     |      and Gravity       |  www.theory.physics.ubc.ca/
