From: Charles Williams <chuck@itadmins.net>
Date: Sat, 11 Aug 2012 11:11:05 +0000
Subject: PPTP/PPP/Radius/LDAP and usernames in email format
Message-Id: <50263DC9.4080305@itadmins.net>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-ppp@vger.kernel.org

Hey all,

Heres's one for you. I am currently setting up a new MS-ChapV2/MPPE VPN 
gateway with pptp/ppp to freeradius authing against an LDAP store.

This VPN will be used for multiple client domains and so I would like to 
use usernames in the form of „user@domain.tld <mailto:user@domain.tld>“ 
instead of „user“ (which is the situation atm).

The LDAP store has a branch as follows:

ou=domains,dc=company,dc=com

under ou=domains I have entries for each domain that I will be offering 
VPN access to.

ie. cn=domain.tld,ou=domains,dc=company,dc=com

I would like to get ppp to send the complete user@domain.tld 
<mailto:user@domain.tld> to radius and have radius use the „domain.tld“ 
as part of the filter for the username search to limit the search to the 
sub-branch from the correct domain.

The problem is that I have yet to find a way to get ppp to send the 
username to Freeradius if there is an @ symbol in the username.

Any ideas?

thanks,
chuck

