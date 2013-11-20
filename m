From: Lorenzo Milesi <maxxer@ufficyo.com>
Date: Wed, 20 Nov 2013 22:15:31 +0000
Subject: Re: Double radius accounting
Message-Id: <1998004623.142136.1384985731564.JavaMail.zimbra@yetopen.it>
List-Id: <linux-ppp.vger.kernel.org>
References: <1683678123.142102.1384983923718.JavaMail.zimbra@yetopen.it>
In-Reply-To: <1683678123.142102.1384983923718.JavaMail.zimbra@yetopen.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

> What happens if you remove 'option /etc/ppp/options' from pptpd.conf?

IT WORKS!

Damn, it was so easy! You saved me a lot of hair (at least the one I didn't pull yet!) ;)

So my fault was to use /etc/ppp/options as options file and leave the "option" directive in config?

Thank you very much!
-- 
Lorenzo Milesi - lorenzo.milesi@yetopen.it

YetOpen S.r.l. - http://www.yetopen.it/

