From: Jelle de Jong <jelledejong@powercraft.nl>
Date: Sat, 16 Jan 2010 20:17:21 +0000
Subject: Re: slow transfer speed issue between two ppp based servers
Message-Id: <4B521ED1.3080004@powercraft.nl>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------000301000605060608000805"
List-Id: <linux-ppp.vger.kernel.org>
References: <4B4AFA68.4020500@powercraft.nl>
In-Reply-To: <4B4AFA68.4020500@powercraft.nl>
To: linux-ppp@vger.kernel.org

This is a multi-part message in MIME format.
--------------000301000605060608000805
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Jelle de Jong wrote, on 15-01-10 15:20:
> James Carlson wrote, on 11-01-10 15:38:
>> Is there any chance you could make the raw tcpdump files (rather than
>> the decoded text output) available?  It's much harder to debug things
>> when information has been subtracted.
>>
>> Based on what little is available here, I'm seeing what seems to be an
>> RTT that jumps around a lot, from a few milliseconds on up to 150
>> milliseconds, and causing TCP to misbehave.  It's likely that this is a
>> kernel issue that needs to be investigated.
> 
> I created an new tcpdump of the issue and attached it in the mail.
> 
> http://filebin.ca/zmmnws/tcpdump01.tar.gz
> 
> I changed the sammy servers pppoe connection to an normal eth5
> interface to an ciso router that is providing a 50/50mbit fiber
> interface. So the upload speed of the sammy server should be very
> high. But is only 30KB when uploading to my mobile umts systems. When
> uploading form an other server to the umts systems the upload speed is
> the max of that server (100kB) so the umts systems should not be the
> problem here.
> 
> We opened the tcmpdumps with wireshark and did an analyse > export
> info and it showed a lot of "TCP Fast retransmissions" compared to the
> the other tcmpdump of the good download from the ashley server.
> 
> I also tried the below kernels, but it did not change anything.
> 
> linux-image-686 | 2.6.30
> linux-image-686 | 2.6.31
> linux-image-686 | 2.6.32
> linux-image-amd64 | 2.6.30
> linux-image-amd64 | 2.6.32
> 
> If anybody can have a look at the tcp dumps or maybe have other
> suggestion to get more debug info?

I did a lot of testing these last days, and it's making me believe the
issue is between two Dutch internet service providers (KPN <->
VODAFONE) I am still guessing how to fix it... traceroute from
Vodafone to KPN seems to go through complete Europe instead of staying
a bit local.

If somebody sees something in the tcpdumps, please enlighten me :)

Best regards,

Jelle

--------------000301000605060608000805
Content-Type: text/plain;
 name="setup-sammy-uplinkspeed-traceroute-debug01.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="setup-sammy-uplinkspeed-traceroute-debug01.txt"

------------------------------------------------------------------------

# traceroute to server with slow an internet connection

# traceroute -I 188.201.91.186
traceroute to 188.201.91.186 (188.201.91.186), 30 hops max, 40 byte packets
 1  * * *
 2  10.36.145.5 (10.36.145.5)  825.560 ms  825.513 ms  825.467 ms
 3  172.22.0.61 (172.22.0.61)  845.536 ms  845.503 ms  845.472 ms
 4  172.22.0.58 (172.22.0.58)  845.439 ms  845.413 ms  845.387 ms
 5  172.22.0.101 (172.22.0.101)  87.849 ms  107.777 ms  131.729 ms
 6  172.22.0.6 (172.22.0.6)  159.700 ms  159.653 ms  199.587 ms
 7  10.36.144.3 (10.36.144.3)  167.485 ms  147.676 ms  151.587 ms
 8  10.36.144.17 (10.36.144.17)  179.546 ms  179.474 ms  179.406 ms
 9  * * *
10  172.22.2.82 (172.22.2.82)  115.954 ms  87.899 ms  107.798 ms
11  85.205.12.213 (85.205.12.213)  131.934 ms  131.855 ms  127.974 ms
12  85.205.24.174 (85.205.24.174)  127.858 ms  127.781 ms  147.704 ms
13  xe-10-3-0.bar1.Milan1.Level3.net (213.242.65.25)  159.630 ms  119.918 ms  139.835 ms
14  ae-7-7.ebr2.Paris1.Level3.net (4.69.142.186)  139.954 ms  127.900 ms  147.817 ms
15  ae-100-100.ebr1.Paris1.Level3.net (4.69.141.237)  167.755 ms  139.939 ms  143.849 ms
16  ae-2-2.ebr1.London1.Level3.net (4.69.142.106)  151.966 ms  139.971 ms  163.971 ms
17  ae-100-100.ebr2.London1.Level3.net (4.69.141.166)  143.967 ms  139.960 ms  159.949 ms
18  ae-2-2.ebr2.Amsterdam1.Level3.net (4.69.132.134)  151.954 ms  159.930 ms  163.853 ms
19  ae-2-52.edge3.Amsterdam1.Level3.net (4.69.139.169)  167.961 ms  159.939 ms  159.856 ms
20  kpn-level3-xe.Amsterdam1.Level3.net (212.72.33.10)  147.930 ms  147.850 ms  171.964 ms
21  asd2-rou-1021.NL.eurorings.net (134.222.231.193)  179.965 ms  171.968 ms  159.965 ms
22  * * *
23  * * *
24  * * *
25  * * *
26  * * *
27  static.kpn.net (188.201.91.185)  199.012 ms  238.937 ms  238.890 ms
28  static.kpn.net (188.201.91.186)  238.857 ms  238.821 ms  238.794 ms

# traceroute -T 188.201.91.186
traceroute to 188.201.91.186 (188.201.91.186), 30 hops max, 40 byte packets
 1  * * *
 2  10.36.145.5 (10.36.145.5)  145.086 ms  145.002 ms  164.109 ms
 3  172.22.0.61 (172.22.0.61)  163.875 ms  191.796 ms  191.711 ms
 4  172.22.0.58 (172.22.0.58)  183.591 ms  203.561 ms  203.482 ms
 5  172.22.0.101 (172.22.0.101)  203.407 ms  223.327 ms  223.262 ms
 6  172.22.0.6 (172.22.0.6)  243.182 ms  139.812 ms  159.656 ms
 7  10.36.144.3 (10.36.144.3)  159.754 ms  159.620 ms  147.899 ms
 8  static.kpn.net (188.201.91.186)  151.845 ms  171.731 ms  159.828 ms

# ping -c 10 188.201.91.186
PING 188.201.91.186 (188.201.91.186) 56(84) bytes of data.
64 bytes from 188.201.91.186: icmp_seq=1 ttl=39 time=194 ms
64 bytes from 188.201.91.186: icmp_seq=2 ttl=39 time=160 ms
64 bytes from 188.201.91.186: icmp_seq=3 ttl=39 time=156 ms
64 bytes from 188.201.91.186: icmp_seq=4 ttl=39 time=164 ms
64 bytes from 188.201.91.186: icmp_seq=5 ttl=39 time=180 ms
64 bytes from 188.201.91.186: icmp_seq=6 ttl=39 time=172 ms
64 bytes from 188.201.91.186: icmp_seq=7 ttl=39 time=160 ms
64 bytes from 188.201.91.186: icmp_seq=8 ttl=39 time=164 ms
64 bytes from 188.201.91.186: icmp_seq=9 ttl=39 time=152 ms
64 bytes from 188.201.91.186: icmp_seq=10 ttl=39 time=176 ms

--- 188.201.91.186 ping statistics ---
10 packets transmitted, 10 received, 0% packet loss, time 9036ms
rtt min/avg/max/mdev = 152.041/167.884/194.442/12.181 ms

------------------------------------------------------------------------

# traceroute to server with normal an internet connection

# traceroute -I 213.207.93.23
traceroute to 213.207.93.23 (213.207.93.23), 30 hops max, 40 byte packets
 1  * * *
 2  10.36.145.5 (10.36.145.5)  121.250 ms  153.215 ms  153.170 ms
 3  172.22.0.61 (172.22.0.61)  141.119 ms  173.109 ms  173.078 ms
 4  172.22.0.58 (172.22.0.58)  201.050 ms  201.022 ms  220.970 ms
 5  172.22.0.101 (172.22.0.101)  111.964 ms  111.887 ms  111.836 ms
 6  172.22.0.6 (172.22.0.6)  131.755 ms  131.710 ms  139.959 ms
 7  10.36.144.3 (10.36.144.3)  127.833 ms  147.745 ms  127.916 ms
 8  10.36.144.17 (10.36.144.17)  159.833 ms  131.913 ms  139.826 ms
 9  * * *
10  172.22.2.82 (172.22.2.82)  139.394 ms  139.904 ms  139.824 ms
11  85.205.12.213 (85.205.12.213)  119.921 ms  119.840 ms  119.925 ms
12  85.205.24.174 (85.205.24.174)  151.844 ms  139.938 ms  139.855 ms
13  xe-10-0-0.bar1.Milan1.Level3.net (213.242.65.61)  159.963 ms  127.961 ms  119.926 ms
14  ae-7-7.ebr2.Paris1.Level3.net (4.69.142.186)  147.843 ms  151.935 ms  151.857 ms
15  ae-2-52.edge3.Paris1.Level3.net (4.69.139.233)  159.963 ms  139.964 ms  139.926 ms
16  prs-b7-link.telia.net (213.248.89.189)  167.859 ms  139.927 ms  151.829 ms
17  prs-bb2-link.telia.net (80.91.248.10)  127.974 ms  139.967 ms  127.933 ms
18  adm-bb2-link.telia.net (80.91.252.38)  159.846 ms  151.952 ms  159.966 ms
19  adm-b2-link.telia.net (80.91.253.169)  139.964 ms  131.882 ms  151.802 ms
20  interconnect-ic-121786-adm-b2.c.telia.net (213.248.84.130)  171.745 ms  159.983 ms  131.952 ms
21  vl33.rt08-z7.db1.interconnect.nl (213.206.213.65)  151.850 ms  159.959 ms  139.969 ms
22  vl95.e-16-3.rx16-z12.db.interconnect.nl (212.83.200.54)  147.918 ms  147.833 ms  179.976 ms
23  fiona.vloerisolatie.eu (213.207.93.23)  159.971 ms  147.902 ms  147.820 ms

# traceroute -T 213.207.93.23
traceroute to 213.207.93.23 (213.207.93.23), 30 hops max, 40 byte packets
 1  * * *
 2  10.36.145.5 (10.36.145.5)  876.061 ms  875.961 ms  875.877 ms
 3  172.22.0.61 (172.22.0.61)  875.770 ms  875.690 ms  875.615 ms
 4  172.22.0.58 (172.22.0.58)  863.398 ms  867.353 ms  867.294 ms
 5  172.22.0.101 (172.22.0.101)  875.342 ms  875.275 ms  99.839 ms
 6  172.22.0.6 (172.22.0.6)  131.704 ms  171.637 ms  167.880 ms
 7  10.36.144.3 (10.36.144.3)  115.694 ms  127.618 ms  127.480 ms
 8  fiona.vloerisolatie.eu (213.207.93.23)  139.314 ms  147.189 ms  167.100 ms

------------------------------------------------------------------------

--------------000301000605060608000805--
