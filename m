From: James Carlson <carlsonj@workingcode.com>
Date: Fri, 12 Feb 2010 14:32:58 +0000
Subject: Re: Control pppd behaviour
Message-Id: <4B75669A.8010904@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <27543592.post@talk.nabble.com>
In-Reply-To: <27543592.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 02/12/10 09:08, Ashmath Khan wrote:
> Thanks James.
> 
> I am thinking of this:
> maxfail 1
> persist # or demad
> 
> Keeping these two options will make pppd exit and my app can later
> control starting pppd later depending on the exit code and the
> algorithm.
> Sometimes we also use demand instead of persist depending on the user
> configuration from UI.
> 
> What do you think ?

Do what you want, but I recommend omitting both options based on your
previously stated goal of having pppd exit on failure.

If you do use "demand" with your current configuration, I recommend
including "nopersist" in order to get the failure semantics desired.

I'm not sure I see how "demand" really fits in here, but you haven't
revealed enough information to give better advice.  And I'm not going to
continue playing 20 questions to get it.  :-/

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
