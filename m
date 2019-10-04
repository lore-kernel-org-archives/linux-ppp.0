From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Fri, 04 Oct 2019 10:49:58 +0000
Subject: Re: [PATCH 4/9] pppd: include time.h before using time_t
Message-Id: <20191004104958.GD881@x1.vandijck-laurijssen.be>
List-Id: <linux-ppp.vger.kernel.org>
References: <1569482466-9551-5-git-send-email-dev.kurt@vandijck-laurijssen.be>
In-Reply-To: <1569482466-9551-5-git-send-email-dev.kurt@vandijck-laurijssen.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

> IMHO time_t is defined in sys/types.h

http://www.open-std.org/JTC1/SC22/WG14/www/docs/n1256.pdf
chapter 7.23.1.3
