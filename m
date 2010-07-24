From: sezginmurat <sezginmurat@gmail.com>
Date: Sat, 24 Jul 2010 01:03:42 +0000
Subject: Re: [PATCH] support no-mmu systems that lack fork()
Message-Id: <29252560.post@talk.nabble.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


Hi Mike,

For which version of ppp package did you do this patch? Is it for 2.4.4 or
it is for the mainline source?
I am using a ppp package (2.4.4) from uClinux distribution, but I just
wondered the difference of your patch.

Regards,
Murat





Mike Frysinger wrote:
> 
> Running Linux on a no-mmu processor requires a few considerations.  In the
> case of ppp, we cannot fork(), nor can the child return from the function
> it forks, nor can the child free up shared memory.
> 
> This patch boils down to:
>  - a new -DNOMMU flag
>  - do not free memory in child
>  - do not return from forked function ... pass in function and its
>    arguments for the child to call itself
>  - call _exit() rather than exit()
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
>  pppd/main.c |  110
> +++++++++++++++++++++++++++++++++++++++-------------------
>  pppd/tdb.c  |    4 ++
>  2 files changed, 78 insertions(+), 36 deletions(-)
> 
> diff --git a/pppd/main.c b/pppd/main.c
> index 4e1952b..565acb2 100644
> --- a/pppd/main.c
> +++ b/pppd/main.c
> @@ -1537,8 +1537,12 @@ bad_signal(sig)
>   * This also arranges for the specified fds to be dup'd to
>   * fds 0, 1, 2 in the child.
>   */
> +struct child_tail {
> +	void (*followup)(void *args);
> +	void *args;
> +};
>  pid_t
> -safe_fork(int infd, int outfd, int errfd)
> +safe_fork_tail(int infd, int outfd, int errfd, struct child_tail *tail)
>  {
>  	pid_t pid;
>  	int fd, pipefd[2];
> @@ -1554,7 +1558,11 @@ safe_fork(int infd, int outfd, int errfd)
>  
>  	if (pipe(pipefd) = -1)
>  		pipefd[0] = pipefd[1] = -1;
> +#ifdef NOMMU
> +	pid = vfork();
> +#else
>  	pid = fork();
> +#endif
>  	if (pid < 0) {
>  		error("fork failed: %m");
>  		return -1;
> @@ -1612,14 +1620,36 @@ safe_fork(int infd, int outfd, int errfd)
>  	/* this close unblocks the read() call above in the parent */
>  	close(pipefd[1]);
>  
> +	if (tail)
> +		tail->followup(tail->args);
>  	return 0;
>  }
> +pid_t
> +safe_fork(int infd, int outfd, int errfd)
> +{
> +	return safe_fork_tail(infd, outfd, errfd, NULL);
> +}
>  
>  /*
>   * device_script - run a program to talk to the specified fds
>   * (e.g. to run the connector or disconnector script).
>   * stderr gets connected to the log fd or to the _PATH_CONNERRS file.
>   */
> +void device_script_tail(void *args)
> +{
> +    char *program = args;
> +    /* here we are executing in the child */
> +
> +    setgid(getgid());
> +    setuid(uid);
> +    if (getuid() != uid) {
> +	fprintf(stderr, "pppd: setuid failed\n");
> +	_exit(1);
> +    }
> +    execl("/bin/sh", "sh", "-c", program, (char *)0);
> +    perror("pppd: could not exec /bin/sh");
> +    _exit(99);
> +}
>  int
>  device_script(program, in, out, dont_wait)
>      char *program;
> @@ -1629,6 +1659,7 @@ device_script(program, in, out, dont_wait)
>      int pid;
>      int status = -1;
>      int errfd;
> +    struct child_tail tail = { device_script_tail, program };
>  
>      if (log_to_fd >= 0)
>  	errfd = log_to_fd;
> @@ -1636,7 +1667,7 @@ device_script(program, in, out, dont_wait)
>  	errfd = open(_PATH_CONNERRS, O_WRONLY | O_APPEND | O_CREAT, 0600);
>  
>      ++conn_running;
> -    pid = safe_fork(in, out, errfd);
> +    pid = safe_fork_tail(in, out, errfd, &tail);
>  
>      if (pid != 0 && log_to_fd < 0)
>  	close(errfd);
> @@ -1662,17 +1693,7 @@ device_script(program, in, out, dont_wait)
>  	return (status = 0 ? 0 : -1);
>      }
>  
> -    /* here we are executing in the child */
> -
> -    setgid(getgid());
> -    setuid(uid);
> -    if (getuid() != uid) {
> -	fprintf(stderr, "pppd: setuid failed\n");
> -	exit(1);
> -    }
> -    execl("/bin/sh", "sh", "-c", program, (char *)0);
> -    perror("pppd: could not exec /bin/sh");
> -    exit(99);
> +    _exit(99);
>      /* NOTREACHED */
>  }
>  
> @@ -1687,6 +1708,43 @@ device_script(program, in, out, dont_wait)
>   * If done != NULL, (*done)(arg) will be called later (within
>   * reap_kids) iff the return value is > 0.
>   */
> +struct run_program_args {
> +    char *prog;
> +    char **args;
> +    int must_exist;
> +};
> +void
> +run_program_tail(void *vargs)
> +{
> +    struct run_program_args *rpargs = vargs;
> +    char *prog = rpargs->prog;
> +    char **args = rpargs->args;
> +    int must_exist = rpargs->must_exist;
> +
> +    /* Leave the current location */
> +    (void) setsid();	/* No controlling tty. */
> +    (void) umask (S_IRWXG|S_IRWXO);
> +    (void) chdir ("/");	/* no current directory. */
> +    setuid(0);		/* set real UID = root */
> +    setgid(getegid());
> +
> +#ifdef BSD
> +    /* Force the priority back to zero if pppd is running higher. */
> +    if (setpriority (PRIO_PROCESS, 0, 0) < 0)
> +	warn("can't reset priority to 0: %m");
> +#endif
> +
> +    /* run the program */
> +    execve(prog, args, script_env);
> +    if (must_exist || errno != ENOENT) {
> +	/* have to reopen the log, there's nowhere else
> +	   for the message to go. */
> +	reopen_log();
> +	syslog(LOG_ERR, "Can't execute %s: %m", prog);
> +	closelog();
> +    }
> +    _exit(-1);
> +}
>  pid_t
>  run_program(prog, args, must_exist, done, arg, wait)
>      char *prog;
> @@ -1698,6 +1756,8 @@ run_program(prog, args, must_exist, done, arg, wait)
>  {
>      int pid, status;
>      struct stat sbuf;
> +    struct run_program_args vargs = { prog, args, must_exist };
> +    struct child_tail tail = { run_program_tail, &vargs };
>  
>      /*
>       * First check if the file exists and is executable.
> @@ -1713,7 +1773,7 @@ run_program(prog, args, must_exist, done, arg, wait)
>  	return 0;
>      }
>  
> -    pid = safe_fork(fd_devnull, fd_devnull, fd_devnull);
> +    pid = safe_fork_tail(fd_devnull, fd_devnull, fd_devnull, &tail);
>      if (pid = -1) {
>  	error("Failed to create child process for %s: %m", prog);
>  	return -1;
> @@ -1733,28 +1793,6 @@ run_program(prog, args, must_exist, done, arg,
> wait)
>  	return pid;
>      }
>  
> -    /* Leave the current location */
> -    (void) setsid();	/* No controlling tty. */
> -    (void) umask (S_IRWXG|S_IRWXO);
> -    (void) chdir ("/");	/* no current directory. */
> -    setuid(0);		/* set real UID = root */
> -    setgid(getegid());
> -
> -#ifdef BSD
> -    /* Force the priority back to zero if pppd is running higher. */
> -    if (setpriority (PRIO_PROCESS, 0, 0) < 0)
> -	warn("can't reset priority to 0: %m");
> -#endif
> -
> -    /* run the program */
> -    execve(prog, args, script_env);
> -    if (must_exist || errno != ENOENT) {
> -	/* have to reopen the log, there's nowhere else
> -	   for the message to go. */
> -	reopen_log();
> -	syslog(LOG_ERR, "Can't execute %s: %m", prog);
> -	closelog();
> -    }
>      _exit(-1);
>  }
>  
> diff --git a/pppd/tdb.c b/pppd/tdb.c
> index bdc5828..7ff431e 100644
> --- a/pppd/tdb.c
> +++ b/pppd/tdb.c
> @@ -1866,6 +1866,9 @@ TDB_CONTEXT *tdb_open_ex(const char *name, int
> hash_size, int tdb_flags,
>   **/
>  int tdb_close(TDB_CONTEXT *tdb)
>  {
> +#ifdef NOMMU
> +	return close(tdb->fd);
> +#else
>  	TDB_CONTEXT **i;
>  	int ret = 0;
>  
> @@ -1892,6 +1895,7 @@ int tdb_close(TDB_CONTEXT *tdb)
>  	SAFE_FREE(tdb);
>  
>  	return ret;
> +#endif
>  }
>  
>  /* lock/unlock entire database */
> -- 
> 1.6.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 

-- 
View this message in context: http://old.nabble.com/-PATCH--support-no-mmu-systems-that-lack-fork%28%29-tp25012646p29252560.html
Sent from the linux-ppp mailing list archive at Nabble.com.

