From: Leonid Lisovskiy <lly.dev@gmail.com>
Date: Fri, 15 Oct 2010 10:32:33 +0000
Subject: Re: [PATCH] pppoe: Missed check for destination addr in PADT frame processing
Message-Id: <AANLkTimSVRrJexyqt0NVYLt4VUc-=utBpjMuV3NhyZjS@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <AANLkTim5m4f-7U4kMghBR0yEQka3-iOaJ9aHwf4sGsxj@mail.gmail.com>
In-Reply-To: <AANLkTim5m4f-7U4kMghBR0yEQka3-iOaJ9aHwf4sGsxj@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 10/15/10, Sujit K M <sjt.kar@gmail.com> wrote:
>> discovered that it happens due to PADT frames being received with
>> destination MAC not matching the client MAC even though they have
>> proper source MAC and session_id. It seems that these ISP use very
>
> This seems to be a wrong way of interpreting the scenario. I think It should
> be proper source MAC and session_id.

In case of ISP has single access point, it has one source MAC for all
network, right? If such AP is buggy and give two(or more) equal
session_id's to several clients, this cause situation I described
above.

Of course, it should be fixed in ISP hardware, but I apologize that
kernel PPPoE driver should have better foolproof.

Regards,
   Leonid
