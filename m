From: Benjamin Cama <benoar@dolka.fr>
Date: Tue, 16 Feb 2021 10:04:47 +0000
Subject: Re: Configuring pppd to accept link-local IPv6 interface id from remote peer
Message-Id: <072169f215e68427ba9b65caac3c3effef3b971c.camel@dolka.fr>
List-Id: <linux-ppp.vger.kernel.org>
References: <d529e496-ac5f-9498-0e3d-1fa1ec2c4750@aelius.com>
In-Reply-To: <d529e496-ac5f-9498-0e3d-1fa1ec2c4750@aelius.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-ppp@vger.kernel.org

Hi Nicholas,

[Cc'ing the list if I may, as it may be useful]

Le mardi 16 février 2021 à 00:56 +0000, Nicholas Humfrey a écrit :
>  > It is a very small change that is basically activated on the “client”-
>  > side with:
>  >
>  >   ipv6 ::,
>  >
>  > thus sending a zero identifier for our side.
> 
> 
> I just tried applying your patch to Git master (5191399) and 
> successfully compiled it.

Thanks for testing!

> However when running this on my 'client':
> ./pppd/pppd file ~/ppp-options ipv6 ::, ipv6cp-accept-local /dev/ttyAMA0 
> 115200
> 
> Then it seemed to fail to negotiate the link-local address. Here is the 
> output:
> https://gist.github.com/njh/437713988b108880a8fe23ed10168c0c

It seems it keeps sending ConfReq for the zero identifier… strange.
Here is the output with the patched version from last june when I wrote
it, latest git at the time (some time after 2.4.8), which works:

   using channel 19
   Using interface ppp0
   Connect: ppp0 <--> /dev/pts/18
   rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xfc846b9d> <pcomp> <accomp>]
   sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0x29314916> <pcomp> <accomp>]
   sent [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xfc846b9d> <pcomp> <accomp>]
   rcvd [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0x29314916> <pcomp> <accomp>]
   sent [LCP EchoReq id=0x0 magic=0x29314916]
   sent [CCP ConfReq id=0x1 <deflate 15> <deflate(old#) 15> <bsd v1 15>]
   sent [IPV6CP ConfReq id=0x1 <addr fe80::0000:0000:0000:0000>]
   rcvd [LCP EchoReq id=0x0 magic=0xfc846b9d]
   sent [LCP EchoRep id=0x0 magic=0x29314916]
   rcvd [CCP ConfReq id=0x1 <deflate 15> <deflate(old#) 15> <bsd v1 15>]
   sent [CCP ConfAck id=0x1 <deflate 15> <deflate(old#) 15> <bsd v1 15>]
   rcvd [IPV6CP ConfReq id=0x1 <addr fe80::0000:0000:0000:0001>]
   sent [IPV6CP ConfAck id=0x1 <addr fe80::0000:0000:0000:0001>]
   rcvd [LCP EchoRep id=0x0 magic=0xfc846b9d]
   rcvd [CCP ConfAck id=0x1 <deflate 15> <deflate(old#) 15> <bsd v1 15>]
   Deflate (15) compression enabled
   rcvd [IPV6CP ConfNak id=0x1 <addr fe80::0000:0000:0000:0002>]
   sent [IPV6CP ConfReq id=0x2 <addr fe80::0000:0000:0000:0002>]
   rcvd [IPV6CP ConfAck id=0x2 <addr fe80::0000:0000:0000:0002>]
   local  LL address fe80::0000:0000:0000:0002
   remote LL address fe80::0000:0000:0000:0001
   Script /etc/ppp/ipv6-up started (pid 11628)
   Script /etc/ppp/ipv6-up finished (pid 11628), status = 0x0
   ^CTerminating on signal 2
   Script /etc/ppp/ipv6-down started (pid 11655)
   sent [LCP TermReq id=0x2 "User request"]
   Script /etc/ppp/ipv6-down finished (pid 11655), status = 0x0
   Child process sudo /home/benoar/Dev/ppp/pppd/pppd notty noauth noip +ipv6 ipv6 ::1,::2 (pid 11617) terminated with signal 2
   Modem hangup
   Connection terminated.
   Connect time 0.1 minutes.
   Sent 120 bytes, received 120 bytes.

   It correctly gets nacked when sending zero iid, and then acks the given
   identifier. BTW, I use a quick “self-test” for development testing:

   sudo ./pppd/pppd pty "sudo $(pwd)/pppd/pppd notty noauth noip +ipv6 ipv6 ::1,::2" noauth nodetach noip +ipv6 ipv6 ::, debug

   But with latest git and my patch, I indeed get the same trace as you.

   > In my hack, rather than changing the definition of what a valid 
> Interface Identifier is, I instead looked for the calls to eui64_magic() 
> and commented them out.

The VALIDID macro was sparsely used and fitted my use-case well, so I
went with that.

> Looking at the git master branch, it looks like Pali Rohár is actively 
> working in this space:
> 
> https://github.com/paulusmack/ppp/commits/master

Well, I'll give a look to find what's wrong.

Thanks for your feedback!
Regards,
--
benjamin
