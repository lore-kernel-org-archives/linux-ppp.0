From: "Jason St. John" <jstjohn@purdue.edu>
Date: Fri, 14 Oct 2011 04:08:14 +0000
Subject: Patch Submission: Enable 'poff' to properly end a 'pppd' process when
Message-Id: <CAEjxke-aNC7keOTesp7hawU6gdUtU5W9sC1Xet5uzmLX-57nLQ@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="90e6ba1efd3a2e819704af3a694f"
List-Id: <linux-ppp.vger.kernel.org>
To: linux-ppp@vger.kernel.org

--90e6ba1efd3a2e819704af3a694f
Content-Type: text/plain; charset=UTF-8

The patch (with context) is attached to this email, and it will allow
/usr/bin/poff to properly end a /usr/sbin/pppd process that was
started with additional arguments.

The patch (without context) is found below (see line 93 of /usr/bin/poff):
-PID=`ps axw | grep "[ /]pppd call $1 *\$" | awk '{print $1}'`
+PID=`ps axw | grep "[ /]pppd call $1" | awk '{print $1}'`

The problem with the current poff script is on line 93 where the
output of `ps axw` is piped into grep. The current regular expression
that grep searches for prevents the PID of the specified pppd process
from being found, which results in the script failing to terminate the
pppd process. The output of poff in that case would be the following:

/usr/bin/poff: I could not find a pppd process for provider 'cit-vpn'.
None stopped.

The reason for this is that the " *\$" at the end of the regular
expression does not match the output of the following example from `ps
axw`:

11846 ?        Ss     0:00 /usr/sbin/pppd call cit-vpn updetach persist

To resolve this issue, I removed the troublesome part of the regular
expression (" *\$") and now grep can properly match the example output
provided above.

I have tested this using ppp 2.4.5-2 in conjunction with
pptpclient-1.7.2-3 on Arch Linux x86_64.
______________________________________________
Jason St. John
Graduate Research Assistant,
Department of Computer and Information Technology,
Purdue University

--90e6ba1efd3a2e819704af3a694f
Content-Type: text/x-patch; charset=US-ASCII; name="poff.patch"
Content-Disposition: attachment; filename="poff.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gtqnjxxm0

LS0tIHBvZmYJMjAxMS0xMC0wMSAxOTo0OTo1Mi4yNjIzMTg4NjQgLTA0MDAKKysrIHBvZmZfcGF0
Y2hlZAkyMDExLTEwLTAxIDE5OjUxOjI5LjE3OTEyNTkwOCAtMDQwMApAQCAtODMsMjEgKzgzLDIx
IEBACiAjIHBwcGQncy4KIGlmIHRlc3QgIiQjIiAtZXEgMCAtbyAiJE1PREUiID0gImFsbCIgOyB0
aGVuCiAgICAgJEtJTEwgLSRTSUcgJFBJRFMgfHwgewogICAgICAgICBlY2hvICIkMDogJEtJTEwg
ZmFpbGVkLiAgTm9uZSAke0RPTkV9LiIKICAgICAgICAgZXhpdCAxCiAgICAgfQogICAgIGV4aXQg
MAogZmkKIAogIyBUaGVyZSBpcyBhbiBhcmd1bWVudCwgc28ga2lsbCB0aGUgcHBwZCBzdGFydGVk
IG9uIHRoYXQgcHJvdmlkZXIuCi1QSUQ9YHBzIGF4dyB8IGdyZXAgIlsgL11wcHBkIGNhbGwgJDEg
KlwkIiB8IGF3ayAne3ByaW50ICQxfSdgCitQSUQ9YHBzIGF4dyB8IGdyZXAgIlsgL11wcHBkIGNh
bGwgJDEiIHwgYXdrICd7cHJpbnQgJDF9J2AKIGlmIHRlc3QgLW4gIiRQSUQiIDsgdGhlbgogICAg
ICRLSUxMIC0kU0lHICRQSUQgfHwgewogICAgICAgICBlY2hvICIkMDogJEtJTEwgZmFpbGVkLiAg
Tm9uZSAke0RPTkV9LiIKICAgICAgICAgZXhpdCAxCiAgICAgfQogZWxzZQogICAgZWNobyAiJDA6
IEkgY291bGQgbm90IGZpbmQgYSBwcHBkIHByb2Nlc3MgZm9yIHByb3ZpZGVyICckMScuIE5vbmUg
JHtET05FfS4iCiAgICBleGl0IDEKIGZpCiBleGl0IDAK
--90e6ba1efd3a2e819704af3a694f--
