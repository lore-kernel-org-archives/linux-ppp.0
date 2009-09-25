From: Chris Fowler <cfowler@outpostsentinel.com>
Date: Fri, 25 Sep 2009 18:55:24 +0000
Subject: Re: ppp link time limit
Message-Id: <1253904924.6726.681.camel@compaq>
List-Id: <linux-ppp.vger.kernel.org>
References: <004001ca3e15$69a6b9d0$0413010a@scu.escambray.com.cu>
In-Reply-To: <004001ca3e15$69a6b9d0$0413010a@scu.escambray.com.cu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

#!/usr/bin/perl

my $pid = fork();
exit 0 if $pid;

$pid = fork();

if($pid = 0) {
  exec "/usr/sbin/pppd", ("call", "isp", "nodetach");
  exit 1;
}

sleep 1800;
kill 15, $pid;


On Fri, 2009-09-25 at 14:51 -0400, Charlie Brady wrote:
> On Fri, 25 Sep 2009, Bill Unruh wrote:
> 
> > pppd call isp & sleep 1800; killall pppd
> 
> The above will kill any pppd process, not just the backgrounded one from 
> this shell script.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

