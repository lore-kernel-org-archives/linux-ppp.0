From: James Carlson <carlsonj@workingcode.com>
Date: Wed, 28 May 2014 11:59:21 +0000
Subject: Re: How can one supply username & password combination on command line?
Message-Id: <5385CF99.40807@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAJZVxRnUo7RtXmGNBE1xChQ4sqA+vrZKUpY7fr9ucbuo3JjAqQ@mail.gmail.com>
In-Reply-To: <CAJZVxRnUo7RtXmGNBE1xChQ4sqA+vrZKUpY7fr9ucbuo3JjAqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 05/28/14 07:04, Aaron Lewis wrote:
> Is it possible to supply credentials on command line? So far the only
> way seems to be *-secrets file
> 
> I need to find a way to launch PPTP & L2TP connections on command
> line, without modifying these files
> 
> Any ideas?

Here's an idea from the fine manual:

  password password-string
    Specifies the password to use for authenticating to the peer.  Use
    of this option is discouraged, as the password is likely to be
    visible to other users on the system (for example, by using ps(1)).

  user name
    Sets the name used for authenticating the local system to the peer
    to name.

There are, of course, other ways to do this.  Perhaps the most
straightforward way is to put the two options (and the respective
values) into a temporary file (or even a named pipe), and then use the
"file" option to read the options from that file.  That way, the values
are not visible to other users, though the name of the file containing
them will be.

Another solution is to use the "passwordfd" plug-in that comes with
pppd.  It allows you to supply the PAP password or CHAP passphrase via a
separate file descriptor (a pipe) that you pass to pppd.  That's easy
and secure.

Still another solution is to write your own plug-in that gets the
required information from any source you like.  Both passprompt.c and
passwordfd.c provide decent starting points, and are located in the
pppd/plugins/ directory in the source distribution.

As for LT2P itself, I'm not currently using it, and I don't know what
options there may be for the implementation you're using.  (Note that
PPP is one thing that can be carried over L2TP, and that L2TP is a
substantial protocol of its own.)

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
