From: Jim Barber <jim.barber@ddihealth.com>
Date: Tue, 06 Sep 2005 00:15:19 +0000
Subject: Re: Windows IPSec/L2TP VPN client and Linux server with RADIUS, and
Message-Id: <431CDF97.2070306@ddihealth.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <431C13DD.9080600@ddihealth.com>
In-Reply-To: <431C13DD.9080600@ddihealth.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

First of all, thanks for taking the time to reply to my post.
Okay. I'll post the log this time. :)

But first I'll address your points.

1. radtest works perfectly:

	root@research:~# radtest user1 password1 10.10.0.218 1812 radius_secret
	Sending Access-Request of id 30 to 10.10.0.218:1812
		User-Name = "user1"
		User-Password = "password1"
		NAS-IP-Address = research
		NAS-Port = 1812
	rad_recv: Access-Accept packet from host 10.10.0.218:1812, id0, length 

    Also authenticating the Windows VPN client works against radius if I
    just use PAP authentication in the security settings.
    Therefore I believe the radius server to be working correctly
    (except perhaps MSCHAPv2)

3. My client is definately setup to use MSCHAPv2.
    For the VPN connection, under:
    Properties -> Security -> Advanced (custom settings) -> Settings...
    I have the following settings:

	Data encryption (dropdown box): "Require encryption (disconnect if server declines)"
	I've chosen the "Allow these protocols" radio button, and the
         only check-boxes that are ticked are:
		"Microsoft CHAP (MS-CHAP)" and "Microsoft CHAP Version 2 (MS-CHAP v2)"

    But with these options I am not seeing the MS-CHAP-Challenge and
    MS-CHAP2-Response in the Radius output.
    Note though as per my original email that you see the MSCHAPv2
    traffic in the PPP logs (auth chap MS-v2).
    eg.
	sent [LCP ConfReq id=0x2 <mru 1400> <asyncmap 0x0> <auth chap MS-v2> <magic> 0x9d821c9a> <pcomp> <accomp>]
	rcvd [LCP ConfAck id=0x2 <mru 1400> <asyncmap 0x0> <auth chap MS-v2> <magic> 0x9d821c9a> <pcomp> <accomp>]

4. Do you mean setting the "Data encryption:" drop down box to be
    "Optional encryption (connect even if no encryption)"?
    I just tried that but it still fails.
    But it was something that I didn't think of trying. Thanks.
    I've also tried with the MPPE patches and it makes no difference.

5. Radius is using the sql backend with a mysql database.
    It has the bare-minimum in it to operate
    (one test user called "user1" with a password of "password1"):

	mysql> select * from radcheck;
	+----+----------+---------------+----+-----------+
	| id | UserName | Attribute     | op | Value     |
	+----+----------+---------------+----+-----------+
	|  1 | user1    | User-Password | = | password1 |
	+----+----------+---------------+----+-----------+

	mysql> select * from usergroup;
	+----+----------+-----------+
	| id | UserName | GroupName |
	+----+----------+-----------+
	|  1 | user1    | dynamic   |
	+----+----------+-----------+

	mysql> select * from radgroupcheck;
	+----+-----------+-----------+----+-------+
	| id | GroupName | Attribute | op | Value |
	+----+-----------+-----------+----+-------+
	|  1 | dynamic   | Auth-Type | := | Local |
	+----+-----------+-----------+----+-------+

I've also tried without any entries in the usergroup and radgroupcheck
tables since if the mschapv2 module detects an incoming MS-CHAPv2
connection, then it should set 'Auth-Type := MS-CHAP' anyway.
Note that setting it to MS-CHAP manually doesn't work due to the missing
incoming MS-CHAP-Challenge and MS-CHAP2-Response strings.
I know that you shouldn't override it at all, and I think that when
I get MS-CHAPv2 authorisation working against the radius server that I
can probably truncate the usergroup and radgroupcheck tables again.
Again note that the above setup works fine when authentication the user
via PAP.

6. Okay here is the log of the RADIUS server starting up and then trying
    to accept an incoming MS-CHAPv2 connection.
    Sorry for flooding everyone's email inboxes.

root@research:~# freeradius -X
Starting - reading configuration files ...
reread_config:  reading radiusd.conf
Config:   including file: /etc/freeradius/proxy.conf
Config:   including file: /etc/freeradius/clients.conf
Config:   including file: /etc/freeradius/snmp.conf
Config:   including file: /etc/freeradius/eap.conf
Config:   including file: /etc/freeradius/sql.conf
  main: prefix = "/usr"
  main: localstatedir = "/var"
  main: logdir = "/var/log/freeradius"
  main: libdir = "/usr/lib/freeradius"
  main: radacctdir = "/var/log/freeradius/radacct"
  main: hostname_lookups = no
  main: max_request_time = 30
  main: cleanup_delay = 5
  main: max_requests = 1024
  main: delete_blocked_requests = 0
  main: port = 1812
  main: allow_core_dumps = no
  main: log_stripped_names = no
  main: log_file = "/var/log/freeradius/radius.log"
  main: log_auth = no
  main: log_auth_badpass = no
  main: log_auth_goodpass = no
  main: pidfile = "/var/run/freeradius/freeradius.pid"
  main: user = "freerad"
  main: group = "freerad"
  main: usercollide = no
  main: lower_user = "no"
  main: lower_pass = "no"
  main: nospace_user = "no"
  main: nospace_pass = "no"
  main: checkrad = "/usr/sbin/checkrad"
  main: proxy_requests = yes
  proxy: retry_delay = 5
  proxy: retry_count = 3
  proxy: synchronous = no
  proxy: default_fallback = yes
  proxy: dead_time = 120
  proxy: post_proxy_authorize = yes
  proxy: wake_all_if_all_dead = no
  security: max_attributes = 200
  security: reject_delay = 1
  security: status_server = no
  main: debug_level = 0
read_config_files:  reading dictionary
read_config_files:  reading naslist
Using deprecated naslist file.  Support for this will go away soon.
read_config_files:  reading clients
read_config_files:  reading realms
  listen: ipaddr = 127.0.0.1 IP address [127.0.0.1]
  listen: port = 0
  listen: type = "auth"
  listen: ipaddr = 127.0.0.1 IP address [127.0.0.1]
  listen: port = 0
  listen: type = "acct"
  listen: ipaddr = 10.10.0.218 IP address [10.10.0.218]
  listen: port = 0
  listen: type = "auth"
  listen: ipaddr = 10.10.0.218 IP address [10.10.0.218]
  listen: port = 0
  listen: type = "acct"
radiusd:  entering modules setup
Module: Library search path is /usr/lib/freeradius
Module: Loaded exec
  exec: wait = yes
  exec: program = "(null)"
  exec: input_pairs = "request"
  exec: output_pairs = "(null)"
  exec: packet_type = "(null)"
rlm_exec: Wait=yes but no output defined. Did you mean output=none?
Module: Instantiated exec (exec)
Module: Loaded expr
Module: Instantiated expr (expr)
Module: Loaded PAP
  pap: encryption_scheme = "crypt"
Module: Instantiated pap (pap)
Module: Loaded CHAP
Module: Instantiated chap (chap)
Module: Loaded MS-CHAP
  mschap: use_mppe = no
  mschap: require_encryption = yes
  mschap: require_strong = yes
  mschap: with_ntdomain_hack = no
  mschap: passwd = "(null)"
  mschap: authtype = "MS-CHAP"
  mschap: ntlm_auth = "(null)"
Module: Instantiated mschap (mschap)
Module: Loaded System
  unix: cache = no
  unix: passwd = "(null)"
  unix: shadow = "/etc/shadow"
  unix: group = "(null)"
  unix: radwtmp = "/var/log/freeradius/radwtmp"
  unix: usegroup = no
  unix: cache_reload = 600
Module: Instantiated unix (unix)
Module: Loaded eap
  eap: default_eap_type = "md5"
  eap: timer_expire = 60
  eap: ignore_unknown_eap_types = no
  eap: cisco_accounting_username_bug = no
rlm_eap: Loaded and initialized type md5
rlm_eap: Loaded and initialized type leap
  gtc: challenge = "Password: "
  gtc: auth_type = "PAP"
rlm_eap: Loaded and initialized type gtc
  mschapv2: with_ntdomain_hack = no
rlm_eap: Loaded and initialized type mschapv2
Module: Instantiated eap (eap)
Module: Loaded preprocess
  preprocess: huntgroups = "/etc/freeradius/huntgroups"
  preprocess: hints = "/etc/freeradius/hints"
  preprocess: with_ascend_hack = no
  preprocess: ascend_channels_per_line = 23
  preprocess: with_ntdomain_hack = no
  preprocess: with_specialix_jetstream_hack = no
  preprocess: with_cisco_vsa_hack = no
Module: Instantiated preprocess (preprocess)
Module: Loaded realm
  realm: format = "suffix"
  realm: delimiter = "@"
  realm: ignore_default = no
  realm: ignore_null = no
Module: Instantiated realm (suffix)
Module: Loaded files
  files: usersfile = "/etc/freeradius/users"
  files: acctusersfile = "/etc/freeradius/acct_users"
  files: preproxy_usersfile = "/etc/freeradius/preproxy_users"
  files: compat = "no"
Module: Instantiated files (files)
Module: Loaded SQL
  sql: driver = "rlm_sql_mysql"
  sql: server = "mysql1.ddihealth.com"
  sql: port = ""
  sql: login = "radius"
  sql: password = "radius_password"
  sql: radius_db = "radius"
  sql: acct_table = "radacct"
  sql: acct_table2 = "radacct"
  sql: authcheck_table = "radcheck"
  sql: authreply_table = "radreply"
  sql: groupcheck_table = "radgroupcheck"
  sql: groupreply_table = "radgroupreply"
  sql: usergroup_table = "usergroup"
  sql: nas_table = "nas"
  sql: dict_table = "dictionary"
  sql: sqltrace = no
  sql: sqltracefile = "/var/log/freeradius/sqltrace.sql"
  sql: readclients = no
  sql: deletestalesessions = yes
  sql: num_sql_socks = 5
  sql: sql_user_name = "%{User-Name}"
  sql: default_user_profile = ""
  sql: query_on_not_found = no
  sql: authorize_check_query = "SELECT id,UserName,Attribute,Value,op FROM radcheck WHERE Username = '%{SQL-User-Name}' ORDER BY id"
  sql: authorize_reply_query = "SELECT id,UserName,Attribute,Value,op FROM radreply WHERE Username = '%{SQL-User-Name}' ORDER BY id"
  sql: authorize_group_check_query = "SELECT 
radgroupcheck.id,radgroupcheck.GroupName,radgroupcheck.Attribute,radgroupcheck.Value,radgroupcheck.op  FROM radgroupcheck,usergroup 
WHERE usergroup.Username = '%{SQL-User-Name}' AND usergroup.GroupName = radgroupcheck.GroupName ORDER BY radgroupcheck.id"
  sql: authorize_group_reply_query = "SELECT 
radgroupreply.id,radgroupreply.GroupName,radgroupreply.Attribute,radgroupreply.Value,radgroupreply.op  FROM radgroupreply,usergroup 
WHERE usergroup.Username = '%{SQL-User-Name}' AND usergroup.GroupName = radgroupreply.GroupName ORDER BY radgroupreply.id"
  sql: accounting_onoff_query = "UPDATE radacct SET AcctStopTime='%S', AcctSessionTime=unix_timestamp('%S') - 
unix_timestamp(AcctStartTime), AcctTerminateCause='%{Acct-Terminate-Cause}', AcctStopDelay = '%{Acct-Delay-Time}' WHERE 
AcctSessionTime=0 AND AcctStopTime=0 AND NASIPAddress= '%{NAS-IP-Address}' AND AcctStartTime <= '%S'"
  sql: accounting_update_query = "UPDATE radacct ? SET FramedIPAddress = '%{Framed-IP-Address}', ? AcctSessionTime = 
'%{Acct-Session-Time}', ? AcctInputOctets = '%{Acct-Input-Octets}', ? AcctOutputOctets = '%{Acct-Output-Octets}' ? WHERE 
AcctSessionId = '%{Acct-Session-Id}' ? AND UserName = '%{SQL-User-Name}' ? AND NASIPAddress= '%{NAS-IP-Address}'"
  sql: accounting_update_query_alt = "INSERT into radacct (AcctSessionId, AcctUniqueId, UserName, Realm, NASIPAddress, NASPortId, 
NASPortType, AcctStartTime, AcctSessionTime, AcctAuthentic, ConnectInfo_start, AcctInputOctets, AcctOutputOctets, CalledStationId, 
CallingStationId, ServiceType, FramedProtocol, FramedIPAddress, AcctStartDelay) values('%{Acct-Session-Id}', 
'%{Acct-Unique-Session-Id}', '%{SQL-User-Name}', '%{Realm}', '%{NAS-IP-Address}', '%{NAS-Port}', '%{NAS-Port-Type}', 
DATE_SUB('%S',INTERVAL (%{Acct-Session-Time:-0} + %{Acct-Delay-Time:-0}) SECOND), '%{Acct-Session-Time}', '%{Acct-Authentic}', '', 
'%{Acct-Input-Octets}', '%{Acct-Output-Octets}', '%{Called-Station-Id}', '%{Calling-Station-Id}', '%{Service-Type}', 
'%{Framed-Protocol}', '%{Framed-IP-Address}', '0')"
  sql: accounting_start_query = "INSERT into radacct (AcctSessionId, AcctUniqueId, UserName, Realm, NASIPAddress, NASPortId, 
NASPortType, AcctStartTime, AcctStopTime, AcctSessionTime, AcctAuthentic, ConnectInfo_start, ConnectInfo_stop, AcctInputOctets, 
AcctOutputOctets, CalledStationId, CallingStationId, AcctTerminateCause, ServiceType, FramedProtocol, FramedIPAddress, 
AcctStartDelay, AcctStopDelay) values('%{Acct-Session-Id}', '%{Acct-Unique-Session-Id}', '%{SQL-User-Name}', '%{Realm}', 
'%{NAS-IP-Address}', '%{NAS-Port}','%{NAS-Port-Type}', '%S', '0', '0', '%{Acct-Authentic}', '%{Connect-Info}', '', '0', '0', 
'%{Called-Station-Id}', '%{Calling-Station-Id}', '', '%{Service-Type}', '%{Framed-Protocol}', '%{Framed-IP-Address}', 
'%{Acct-Delay-Time}', '0')"
  sql: accounting_start_query_alt = "UPDATE radacct SET AcctStartTime = '%S', AcctStartDelay = '%{Acct-Delay-Time}', 
ConnectInfo_start = '%{Connect-Info}' WHERE AcctSessionId = '%{Acct-Session-Id}' AND UserName = '%{SQL-User-Name}' AND NASIPAddress 
= '%{NAS-IP-Address}'"
  sql: accounting_stop_query = "UPDATE radacct SET AcctStopTime = '%S', AcctSessionTime = '%{Acct-Session-Time}', AcctInputOctets = 
'%{Acct-Input-Octets}', AcctOutputOctets = '%{Acct-Output-Octets}', AcctTerminateCause = '%{Acct-Terminate-Cause}', AcctStopDelay = 
'%{Acct-Delay-Time}', ConnectInfo_stop = '%{Connect-Info}' WHERE AcctSessionId = '%{Acct-Session-Id}' AND UserName = 
'%{SQL-User-Name}' AND NASIPAddress = '%{NAS-IP-Address}'"
  sql: accounting_stop_query_alt = "INSERT into radacct (AcctSessionId, AcctUniqueId, UserName, Realm, NASIPAddress, NASPortId, 
NASPortType, AcctStartTime, AcctStopTime, AcctSessionTime, AcctAuthentic, ConnectInfo_start, ConnectInfo_stop, AcctInputOctets, 
AcctOutputOctets, CalledStationId, CallingStationId, AcctTerminateCause, ServiceType, FramedProtocol, FramedIPAddress, 
AcctStartDelay, AcctStopDelay) values('%{Acct-Session-Id}', '%{Acct-Unique-Session-Id}', '%{SQL-User-Name}', '%{Realm}', 
'%{NAS-IP-Address}', '%{NAS-Port}', '%{NAS-Port-Type}', DATE_SUB('%S', INTERVAL (%{Acct-Session-Time:-0} + %{Acct-Delay-Time:-0}) 
SECOND), '%S', '%{Acct-Session-Time}', '%{Acct-Authentic}', '', '%{Connect-Info}', '%{Acct-Input-Octets}', '%{Acct-Output-Octets}', 
'%{Called-Station-Id}', '%{Calling-Station-Id}', '%{Acct-Terminate-Cause}', '%{Service-Type}', '%{Framed-Protocol}', 
'%{Framed-IP-Address}', '0', '%{Acct-Delay-Time}')"
  sql: group_membership_query = "SELECT GroupName FROM usergroup WHERE UserName='%{SQL-User-Name}'"
  sql: connect_failure_retry_delay = 60
  sql: simul_count_query = ""
  sql: simul_verify_query = "SELECT RadAcctId, AcctSessionId, UserName, NASIPAddress, NASPortId, FramedIPAddress, CallingStationId, 
FramedProtocol FROM radacct WHERE UserName='%{SQL-User-Name}' AND AcctStopTime = 0"
  sql: postauth_table = "radpostauth"
  sql: postauth_query = "INSERT into radpostauth (id, user, pass, reply, date) values ('', '%{User-Name}', 
'%{User-Password:-Chap-Password}', '%{reply:Packet-Type}', NOW())"
  sql: safe-characters = "@abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.-_: /"
rlm_sql (sql): Driver rlm_sql_mysql (module rlm_sql_mysql) loaded and linked
rlm_sql (sql): Attempting to connect to radius@mysql1.ddihealth.com:/radius
rlm_sql (sql): starting 0
rlm_sql (sql): Attempting to connect rlm_sql_mysql #0
rlm_sql_mysql: Starting connect to MySQL server for #0
rlm_sql (sql): Connected new DB handle, #0
rlm_sql (sql): starting 1
rlm_sql (sql): Attempting to connect rlm_sql_mysql #1
rlm_sql_mysql: Starting connect to MySQL server for #1
rlm_sql (sql): Connected new DB handle, #1
rlm_sql (sql): starting 2
rlm_sql (sql): Attempting to connect rlm_sql_mysql #2
rlm_sql_mysql: Starting connect to MySQL server for #2
rlm_sql (sql): Connected new DB handle, #2
rlm_sql (sql): starting 3
rlm_sql (sql): Attempting to connect rlm_sql_mysql #3
rlm_sql_mysql: Starting connect to MySQL server for #3
rlm_sql (sql): Connected new DB handle, #3
rlm_sql (sql): starting 4
rlm_sql (sql): Attempting to connect rlm_sql_mysql #4
rlm_sql_mysql: Starting connect to MySQL server for #4
rlm_sql (sql): Connected new DB handle, #4
Module: Instantiated sql (sql)
Module: Loaded Acct-Unique-Session-Id
  acct_unique: key = "User-Name, Acct-Session-Id, NAS-IP-Address, Client-IP-Address, NAS-Port"
Module: Instantiated acct_unique (acct_unique)
Module: Loaded detail
  detail: detailfile = "/var/log/freeradius/radacct/%{Client-IP-Address}/detail-%Y%m%d"
  detail: detailperm = 384
  detail: dirperm = 493
  detail: locking = no
Module: Instantiated detail (detail)
Listening on authentication 127.0.0.1:1812
Listening on accounting 127.0.0.1:1813
Listening on authentication 10.10.0.218:1812
Listening on accounting 10.10.0.218:1813
Listening on proxy *:1814
Ready to process requests.
rad_recv: Access-Request packet from host 10.10.0.218:1024, id0, lengthQ
         Service-Type = Framed-User
         Framed-Protocol = PPP
         User-Name = "user1"
         NAS-IP-Address = 10.10.0.216
         NAS-Port = 0
   Processing the authorize section of radiusd.conf
modcall: entering group authorize for request 0
   modcall[authorize]: module "preprocess" returns ok for request 0
   modcall[authorize]: module "chap" returns noop for request 0
   modcall[authorize]: module "mschap" returns noop for request 0
     rlm_realm: No '@' in User-Name = "user1", looking up realm NULL
     rlm_realm: No such realm "NULL"
   modcall[authorize]: module "suffix" returns noop for request 0
   rlm_eap: No EAP-Message, not doing EAP
   modcall[authorize]: module "eap" returns noop for request 0
     users: Matched entry DEFAULT at line 152
     users: Matched entry DEFAULT at line 171
     users: Matched entry DEFAULT at line 183
   modcall[authorize]: module "files" returns ok for request 0
radius_xlat:  'user1'
rlm_sql (sql): sql_set_user escaped user --> 'user1'
radius_xlat:  'SELECT id,UserName,Attribute,Value,op FROM radcheck WHERE Username = 'user1' ORDER BY id'
rlm_sql (sql): Reserving sql socket id: 4
radius_xlat:  'SELECT radgroupcheck.id,radgroupcheck.GroupName,radgroupcheck.Attribute,radgroupcheck.Value,radgroupcheck.op  FROM ra
dgroupcheck,usergroup WHERE usergroup.Username = 'user1' AND usergroup.GroupName = radgroupcheck.GroupName ORDER BY radgroupcheck.id
'
radius_xlat:  'SELECT id,UserName,Attribute,Value,op FROM radreply WHERE Username = 'user1' ORDER BY id'
radius_xlat:  'SELECT radgroupreply.id,radgroupreply.GroupName,radgroupreply.Attribute,radgroupreply.Value,radgroupreply.op  FROM ra
dgroupreply,usergroup WHERE usergroup.Username = 'user1' AND usergroup.GroupName = radgroupreply.GroupName ORDER BY radgroupreply.id
'
rlm_sql (sql): Released sql socket id: 4
   modcall[authorize]: module "sql" returns ok for request 0
modcall: group authorize returns ok for request 0
   rad_check_password:  Found Auth-Type Local
auth: type Local
auth: No User-Password or CHAP-Password attribute in the request
auth: Failed to validate the user.
Delaying request 0 for 1 seconds
Finished request 0
Going to the next request
--- Walking the entire request list ---
Waking up in 1 seconds...
--- Walking the entire request list ---
Waking up in 1 seconds...
--- Walking the entire request list ---
Sending Access-Reject of id 110 to 10.10.0.218:1024
Waking up in 4 seconds...
--- Walking the entire request list ---
Cleaning up request 0 ID 110 with timestamp 431cdc94
Nothing to do.  Sleeping until we see a request.

Regards,

----------
Jim Barber
DDI Health


Seferovic Edvin wrote:
> Hi,
> 
> this seems like a RADIUS error. 
> 
> 1. try testing your RADIUS configuration with radtest ( see man radtest )
> 
> 2. next time start radius with radiusd -Xxa and copy the main parts of the
> log into the mail.
> 
> 3. it seems that your VPN daemon is not set to use MSCHAPv2 or your client
> isnt configured either... so you are right.. you should see something like
> this:
>  
> rad_recv: Access-Request packet from host xx, id0, length6
>         Service-Type = Framed-User
>         Framed-Protocol = PPP
>         User-Name = "xxxxxxx"
>         MS-CHAP-Challenge = 0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx9
>         MS-CHAP2-Response = xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
>         Calling-Station-Id = "xxxx"
>         NAS-IP-Address = xxxxxxxxxxx
>         NAS-Port = 0
> 
> 4. check the client -> Connection properties -> security -> setting -> check
> the box with MSCHAPv2, and choose NO ENCRYPTION ( you said you dont have
> that module .. sooo.. )
> 
> 5. radius is using which backend ( file/sql/ldap/etc?? ) ? You need
> clear-text passwords for the MSCHAPv2 auth, or LM/NT Hashes !
> 
> 6. post the logs next time ;)
> 
> Regards,
> 
> Edvin Seferovic
> 
> 
> -----Original Message-----
> From: linux-ppp-owner@vger.kernel.org
> [mailto:linux-ppp-owner@vger.kernel.org] On Behalf Of Jim Barber
> Sent: Montag, 05. September 2005 11:46
> To: linux-ppp@vger.kernel.org
> Subject: Windows IPSec/L2TP VPN client and Linux server with RADIUS, and
> PPP.
> 
> I am hoping that someone can help me.
> I have been working on this problem for days now and I've read so much
> online documentation, how-tos, etc that my eyes are ready to fall out of
> my head. :)
> 
> I have been trying to set up a Linux VPN server that will support the
> IPSec/L2TP VPN client that is available with Microsoft Windows 2000
> onwards.
> 
> I first tried the 'testing' distribution of Debian, but after failing to
> get it to work with lt2pns, I moved to the 'unstable' distribution so
> that I had new software available, and so I could use lt2pd with the
> pppd daemon.
> 
> The infrastructure that I've been using to try and support this is:
> 
> - FreeRADIUS 1.0.4 for user authentication.
> - Linux 2.6 kernel for the IPSec tunnel.
> - Racoon 0.6.1 for the IPSec Key exchange.
> - l2tpd 0.7-pre20031121 for the L2TP daemon.
> - pppd 2.4.3-20050321+2 for the PPP daemon.
> - radiusclient 0.3.2 for the PPP radius.so plugin configuration.
> - openssl 0.9.7g for the generation and signing of certificates and keys.
> 
> I have had some limited success...
> 
> If I don't use the radius.so ppp plugin, and define a test user in the
> /etc/ppp/chap-secrets file, then VPNs from my Windows XP client works
> perfectly.
> 
> If I enable the use of the radius.so plugin, then users will no longer
> authenticate.
> However if I change the properties in the client's VPN security settings
> so that all of the CHAP, MSCHAP, MSCHAPv2 options are disabled, and
> only the PAP connection is enabled, then authentication via the radius
> server works perfectly.
> 
> I don't want to post full logs at this stage unless someone requests
> them since they are huge. I will post what I think is relevent at this
> stage...
> 
> I believe that the RADIUS authentication isn't happening with MSCHAPv2
> enabled because it doesn't have enough information passed to it.
> The debugging part of the RADIUS server shows the following incoming
> information:
> 
> rad_recv: Access-Request packet from host 10.10.0.218:1024, id7,
> lengthQ
>          Service-Type = Framed-User
>          Framed-Protocol = PPP
>          User-Name = "user1"
>          NAS-IP-Address = 10.10.0.216
>          NAS-Port = 0
> 
>  From my research I believe that I should also see MS-CHAP-Challenge and
> MS-CHAP2-Response entries in the output above.
> 
> I believe that the MS-CHAPv2 information is reaching the ppp daemon
> because I see entries in it's debugging output like so:
> 
> sent [LCP ConfReq id=0x1 <mru 1400> <asyncmap 0x0> <auth chap MD5> <magic
> 0x9d821c9a> <pcomp> <accomp>]
> rcvd [LCP ConfNak id=0x1 <auth chap MS-v2>]
> sent [LCP ConfReq id=0x2 <mru 1400> <asyncmap 0x0> <auth chap MS-v2> <magic
> 0x9d821c9a> <pcomp> <accomp>]
> rcvd [LCP ConfAck id=0x2 <mru 1400> <asyncmap 0x0> <auth chap MS-v2> <magic
> 0x9d821c9a> <pcomp> <accomp>]
> rcvd [LCP ConfReq id=0x1 <mru 1400> <magic 0x5b52779d> <pcomp> <accomp>
> <callback CBCP>]
> sent [LCP ConfRej id=0x1 <callback CBCP>]
> rcvd [LCP ConfReq id=0x2 <mru 1400> <magic 0x5b52779d> <pcomp> <accomp>]
> sent [LCP ConfAck id=0x2 <mru 1400> <magic 0x5b52779d> <pcomp> <accomp>]
> sent [LCP EchoReq id=0x0 magic=0x9d821c9a]
> sent [CHAP Challenge id=0x29 <0e8e59d6606f7233d9fc0ef7e3e66301>, name > "research"]
> rcvd [LCP Ident id=0x3 magic=0x5b52779d "MSRASV5.10"]
> rcvd [LCP Ident id=0x4 magic=0x5b52779d "MSRAS-0-MICROBEE"]
> rcvd [LCP EchoRep id=0x0 magic=0x5b52779d]
> rcvd [CHAP Response id=0x29
> <2f9bc1d22db3ecd79957616fd713c9080000000000000000b8f4c19d7d7edc1fbecfb562edc
> 55cf3d5c17c8644b03cd500>, 
> name = "user1"]
> sent [CHAP Failure id=0x29 ""]
> sent [LCP TermReq id=0x3 "Authentication failed"]
> 
> So either the ppp radius plugin isn't correctly seeing this MSCHAPv2
> information and so failing to pass it on to the FreeRADIUS server, or it
> is passing the information to the radius server, but the radius server
> is failing to interpret it as MS-CHAP-Challenge and MS-CHAP2-Response
> entries.
> 
> My configuration for the l2tpd daemon is as follows:
> 
>          [global]
>          listen-addr = 10.10.0.219
>          port = 1701
> 
>          [lns default]
>          ip range = 10.10.0.248 - 10.10.0.254
>          local ip = 10.10.0.220
>          require chap = yes
>          refuse pap = yes
>          require authentication = yes
>          hostname = vpn1
>          ppp debug = yes
>          pppoptfile = /etc/ppp/options.l2tpd
>          length bit = yes
> 
> My configuration in the /etc/ppp/options.l2tpd file is as follows:
> 
>          ms-dns 10.10.0.100
>          ms-wins 10.10.0.100
>          auth
>          crtscts
>          lock
>          mru 1400
>          mtu 1400
>          nodetach
>          debug
>          proxyarp
>          ipcp-accept-local
>          ipcp-accept-remote
>          idle 1800
>          connect-delay 5000
>          nodefaultroute
>          refuse-pap
>          refuse-chap
>          refuse-mschap
>          require-mschap-v2
>          nologfd
>          plugin radius.so
> 
> I've configured the /etc/radiusclient/servers file with the correct
> passwords for the radius server.
> I've configured the /etc/radiusclient/radiusclient.conf with IP address
> of the radius server.
> 
> In the modules section of the /etc/freeradius/radiusd.conf file I have
> the following entry:
> 
>          mschap {
>                  authtype = MS-CHAP
>          }
> 
> In the authorize section of the /etc/freeradius/radiusd.conf file I have
> the following entry:
> 
>          mschap
> 
> In the authenticate section of the /etc/freeradius/radiusd.conf file I
> have the following entry:
> 
>          Auth-Type MS-CHAP {
>                  mschap
>          }
> 
> At one stage I was wondering if MPPE support was required, but I
> couldn't see how since that is only for encryption of the PPP layer
> which isn't necessary. But having tried all sorts of different
> configuration combinations, I decided to compile up a kernel with
> the MPPE patches along with enabling the MPPE directives in the
> FreeRADIUS config and the options.l2tp file. This made no difference,
> which I am happy with as that is what I expected.
> 
> I tried rebuilding the ppp Debian Package to see if it is compiled with
> MS-CHAP support out of the box, and it does appear that it is. My custom
> version of ppp didn't fair any better.
> 
> So I'm stuck now.
> Does anyone know where I can go from here?
> 
> If necessary, I can post up complete logs, and even full configuration
> files, but I thought I'd spare you all for the moment.
> 
> Any help is very much appreciated.
> 
> Regards,
