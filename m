From: Jack Stone <jwjstone@fastmail.fm>
Date: Mon, 21 Mar 2011 17:40:32 +0000
Subject: Re: 'scheduling while atomic' during ppp connection on 2.6.37.1 and
Message-Id: <4D878D90.6070100@fastmail.fm>
List-Id: <linux-ppp.vger.kernel.org>
References: <fuopaigyaypsqveewtjx@pwmq>	<4D864A82.4090104@fastmail.fm>	<20110320215826.79cadfe2@lxorguk.ukuu.org.uk>	<6627fbdd-cce6-4717-8920-3a0d7526274b@email.android.com> <20110321112723.248e7a52@lxorguk.ukuu.org.uk>
In-Reply-To: <20110321112723.248e7a52@lxorguk.ukuu.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Mac <kmac@poczta.fm>, linux-kernel@vger.kernel.org, linux-ppp@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>

On 21/03/2011 11:27, Alan Cox wrote:
> It's quite likely that was as broken before your change as after. The
> locking in the code makes no sense so I flagged it up. The
> nozomi ntty_write also has lots of oddness in it that really needs
> sorting out.
> 
> I suspect that the chunk
> 
>         if (!dc || !port)
>                 return -ENODEV;
> 
>         mutex_lock(&port->tty_sem);
> 
>         if (unlikely(!port->port.count)) {
>                 DBG1(" ");
>                 goto exit;
>         }
> 
> and
> 
>       /* notify card */
>         if (unlikely(dc = NULL)) {
>                 DBG1("No device context?");
>                 goto exit;
>         }
> 
> and the mutex unlock are actually not doing anything
> 
> On the write_room case I think that as the code already uses tty_port
> helpers it needs to simply just return the correct value and not do all
> the other checks. chars_in_buffer() likewise
> 
> So in fact I don't think at this point the tty_sem needs replacing with
> anything, but the various bogus port.count checks want ripping out.
> 
> 

Thank you very much for the explanation. I will do my best to respin the
patch with appropriate changes.

Jack
