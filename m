From: Alexey Mahotkin <squadette@gmail.com>
Date: Sat, 29 May 2010 20:27:52 +0000
Subject: Re: [PATCH 6/6] Use Disconnect-Cause=Admin-Reset if SIGTERM received
Message-Id: <AANLkTin3mELEjVlNLTyqPb5qi_iP7YwTAjhNH5GFTftV@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <1274984499-9633-6-git-send-email-squadette@gmail.com>
In-Reply-To: <1274984499-9633-6-git-send-email-squadette@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Sat, May 29, 2010 at 7:00 AM, Paul Mackerras <paulus@samba.org> wrote:
> On the whole, I think it would be better just to make
> EXIT_USER_REQUEST result in PW_ADMIN_RESET and drop the new
> EXIT_SIGTERM.

Ok, I'll agree.

Thank you,

-- 
Alexey Mahotkin
http://squadette.ru/
