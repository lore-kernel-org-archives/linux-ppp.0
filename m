From: John Horne <john.horne@plymouth.ac.uk>
Date: Wed, 05 Oct 2005 16:59:16 +0000
Subject: Radius plugin failover - not working?
Message-Id: <1128531556.19093.60.camel@jhorne.csd.plymouth.ac.uk>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello,

We have a server running Fedora Core 3 linux (2.6.12-1.1372_FC3 kernel),
with pptpd 1.2.2, freeradius 1.0.1, and ppp 2.4.3 (with mppe/mppc patch)
and the radius plugin. This is all used as a VPN server for mainly
Windows XP clients using mppe/pptp. This works fine - the radius plugin
talks fine with the local radius server.

However, I have being testing failover with another server using the
same software, and the failover does not seem to work. (I also tried
this with ppp 2.4.4.b1 - same result.) In the radiusclient.conf file on
the local host I have specified both radius servers for the
authserver/acctserver as:

  authserver  localhost:1812 vpn2.plymouth.ac.uk:1812
  acctserver  localhost:1813 vpn2.plymouth.ac.uk:1813

If I stop the local radius server, then I can see (using tcpdump and ppp
in debug mode) the local host/ppp sending a radius authentication
request to the remote server. The remote server sends the reply (an
authentication success). But the client always receives a 691 error
complaining about 'access was denied because the username and/or
password was invalid'. The username/pwd are correct.

(More details:
   client is      141.163.60.7
   local host is  141.163.111.250 (aka 'vpn1')
   remote host is 141.163.195.250 (aka 'vpn2') )

A snippet of the local host logged ppp messages shows:

==================================
  Oct  5 17:36:01 fred pppd[8030]: sent [CHAP Challenge id=0x68
     <acf53fca24a9xxxxxxe42cc27178f>, name = "vpn1.plymouth.ac.uk"]
  Oct  5 17:36:01 fred pptpd[8029]: CTRL: Received PPTP Control Message
     (type: 15)
  Oct  5 17:36:01 fred pptpd[8029]: CTRL: Ignored a SET LINK INFO packet
     with real ACCMs!
  Oct  5 17:36:01 fred pppd[8030]: rcvd [LCP Ident id=0x2
     magic=0xf504989 "MSRASV5.10"]
  Oct  5 17:36:01 fred pppd[8030]: rcvd [LCP Ident id=0x3
     magic=0xf504989 "MSRAS-0-TO91315828"]
  Oct  5 17:36:01 fred pppd[8030]: rcvd [LCP EchoRep id=0x0
     magic=0xf504989]
  Oct  5 17:36:01 fred pppd[8030]: rcvd [CHAP Response id=0x68
<2a013bd20dc9431e37c07c068bxxxxxxxxxxxxx00000000235d9aa335df1504ea22d33198f346b3fec4a2264740fa5d00>,
     name = "jhorne"]
  Oct  5 17:36:01 fred pppd[8030]: rc_check_reply: received invalid
     reply digest from RADIUS server
  Oct  5 17:36:01 fred pppd[8030]: Peer jhorne failed CHAP
     authentication
  Oct  5 17:36:01 fred pppd[8030]: sent [CHAP Failure id=0x68 ""]
  Oct  5 17:36:01 fred pppd[8030]: sent [LCP TermReq id=0x2
    "Authentication failed"]
==================================


However, the remote server shows:

==================================
  rad_recv: Access-Request packet from host 141.163.111.250:32782,
     id, length8
        Service-Type = Framed-User
        Framed-Protocol = PPP
        User-Name = "jhorne"
        MS-CHAP-Challenge = 0xc4bf059db253xxxxx8de5f867261cb
        MS-CHAP2-Response 0xba00bf7109a9e36a3145bec1aca284b5a0b90xxxxxxxxxxxxxxx00069e8e973231102c453458d413e8f91ffe00cb13ca3556070
        Calling-Station-Id = "141.163.60.7"
        NAS-IP-Address = 141.163.111.250
        NAS-Port = 0

==================================


So the request is definitely sent by the local host and received by the
remote server. The remote server then sends back:

==================================
  Login OK: [jhorne] (from client vpn1 port 0 cli 141.163.60.7)
  Sending Access-Accept of id 10 to 141.163.111.250:32782
        Framed-Protocol = PPP
        Reply-Message = "Yes"
        Service-Type = Framed-User
==================================


As far as I can tell a valid authentication accept packet is sent back
but then something happens to it. I have no idea what.

I know the 'invalid reply digest' bit usually means that the shared
secret is wrong, but again I have checked and rechecked that and it is
correct. If it wasn't then I wouldn't expect to see an authentication
accept packet being sent back from the remote server!

Has anyone got this working? Anyone any ideas of what I can try or test
next?


Thanks,

John.

-- 
---------------------------------------------------------------
John Horne, University of Plymouth, UK  Tel: +44 (0)1752 233914
E-mail: John.Horne@plymouth.ac.uk       Fax: +44 (0)1752 233839

