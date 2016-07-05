From: Cong Wang <xiyou.wangcong@gmail.com>
Date: Tue, 05 Jul 2016 20:36:53 +0000
Subject: Re: Problem: BUG_ON hit in ppp_pernet() when re-connect after changing shared key on LAC
Message-Id: <CAM_iQpUEKrcuQvcXO_Rembgk_ZKc-v9Pe2ZEuZ5W_QxdcYDDNQ@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="001a113eca18eb582a0536e96a61"
List-Id: <linux-ppp.vger.kernel.org>
References: <7fabf4defe2f468bbcc829247de956c0@svr-chch-ex1.atlnz.lc> <CAM_iQpVyNghNJHES5-npZgYGFXps0-XTwJyJ-9pLDAuYJ_syWw@mail.gmail.com>
In-Reply-To: <CAM_iQpVyNghNJHES5-npZgYGFXps0-XTwJyJ-9pLDAuYJ_syWw@mail.gmail.com>
To: Matt Bennett <Matt.Bennett@alliedtelesis.co.nz>
Cc: "linux-ppp@vger.kernel.org" <linux-ppp@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "g.nault@alphalink.fr" <g.nault@alphalink.fr>

--001a113eca18eb582a0536e96a61
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 5, 2016 at 10:59 AM, Cong Wang <xiyou.wangcong@gmail.com> wrote:
> On Mon, Jul 4, 2016 at 7:50 PM, Matt Bennett
> <Matt.Bennett@alliedtelesis.co.nz> wrote:
>> Using printk I have confirmed that ppp_pernet() is called from
>> ppp_connect_channel() when the BUG occurs (i.e. pch->chan_net is NULL).
>>
>> This behavior appears to have been introduced in commit 1f461dc ("ppp:
>> take reference on channels netns").
>
> We have some race condition here, where a parallel ppp_unregister_channel()
> could happen while we are in ppp_connect_channel().
>
> We need some synchronization for them. I am not sure what is the right lock
> here since ppp locking looks crazy.

Matt, could you try if the attached patch helps?

Thanks!

--001a113eca18eb582a0536e96a61
Content-Type: text/plain; charset=US-ASCII; name="ppp.diff"
Content-Disposition: attachment; filename="ppp.diff"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_iq9x1rnr0

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3BwcC9wcHBfZ2VuZXJpYy5jIGIvZHJpdmVycy9uZXQv
cHBwL3BwcF9nZW5lcmljLmMKaW5kZXggOGRlZGFmYS4uMDdmMGU0OSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9uZXQvcHBwL3BwcF9nZW5lcmljLmMKKysrIGIvZHJpdmVycy9uZXQvcHBwL3BwcF9nZW5l
cmljLmMKQEAgLTI2MDEsOCArMjYwMSw2IEBAIHBwcF91bnJlZ2lzdGVyX2NoYW5uZWwoc3RydWN0
IHBwcF9jaGFubmVsICpjaGFuKQogCXNwaW5fbG9ja19iaCgmcG4tPmFsbF9jaGFubmVsc19sb2Nr
KTsKIAlsaXN0X2RlbCgmcGNoLT5saXN0KTsKIAlzcGluX3VubG9ja19iaCgmcG4tPmFsbF9jaGFu
bmVsc19sb2NrKTsKLQlwdXRfbmV0KHBjaC0+Y2hhbl9uZXQpOwotCXBjaC0+Y2hhbl9uZXQgPSBO
VUxMOwogCiAJcGNoLT5maWxlLmRlYWQgPSAxOwogCXdha2VfdXBfaW50ZXJydXB0aWJsZSgmcGNo
LT5maWxlLnJ3YWl0KTsKQEAgLTMxMzYsNiArMzEzNCwxMSBAQCBwcHBfZGlzY29ubmVjdF9jaGFu
bmVsKHN0cnVjdCBjaGFubmVsICpwY2gpCiAgKi8KIHN0YXRpYyB2b2lkIHBwcF9kZXN0cm95X2No
YW5uZWwoc3RydWN0IGNoYW5uZWwgKnBjaCkKIHsKKwlpZiAocGNoLT5jaGFuX25ldCkgeworCQlw
dXRfbmV0KHBjaC0+Y2hhbl9uZXQpOworCQlwY2gtPmNoYW5fbmV0ID0gTlVMTDsKKwl9CisKIAlh
dG9taWNfZGVjKCZjaGFubmVsX2NvdW50KTsKIAogCWlmICghcGNoLT5maWxlLmRlYWQpIHsK
--001a113eca18eb582a0536e96a61--
