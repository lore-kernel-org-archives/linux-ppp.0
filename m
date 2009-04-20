From: saravanan chanemouganandam <chanemouganandam@gmail.com>
Date: Mon, 20 Apr 2009 14:08:09 +0000
Subject: Re: pppd connection timeout in Mesh network
Message-Id: <87c084000904200708v32d83fb4ld1b908c1926afa8f@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <23136711.post@talk.nabble.com>
In-Reply-To: <23136711.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

Hi Gilles,

I am running pppd version 2.4.4 and Openwrt's Linux-2.6.26.2 on the
wireless mesh boards. pppd options contains the following info

asyncmap 0
auth
crtscts
lock
hide-password
modem
proxyarp
lcp-echo-interval 30
lcp-echo-failure 4
noipx

I have no idea about ppp configuration on the long distance server
side but sure its working fine and givingout services to other mesh
clients.

The same wireless mesh boards works well on other mesh sites. I am
experiencing problem only with this site. The ADSL line seems to work
fine cos Node 1 stays connected since the day installed. Only node 2
and node 3 goes through (bridged with) Node 1 failed most of the time.
ssh between node 1, node 2 and node 3  works perfectly and so wireless
connection do.

log shows no reception of rcvd packets and LCP timeouts.






On Mon, Apr 20, 2009 at 3:54 PM, Gilles Espinasse <g.esp@free.fr> wrote:
> Selon littleHeart <chanemouganandam@gmail.com>:
>
>>
>> Hi all,
>>
>> I have a problem with PPP connection timeout in my 3 nodes mesh networki=
ng
>> system. =A0Node 1 is wirelessly bridged to ADSL line and wireless mesh
>> networked to Node 2 and Node 3. Node 1 always stays up connected and ppp,
>> internet works fine. But node 2 and node 3 has problem with =A0ppp conne=
ction
>> timeout. Sometimes node 2 or node 3 has ppp vpn connection but lasts for=
 few
>> minutes and then gets disconnected. Following is the log message when tr=
ying
>> to connect after disconnection.
>>
>
> wich ppp configuration on the client side, on server side?
> wich version (ppdp, kernel)?
>
> Gilles
>
