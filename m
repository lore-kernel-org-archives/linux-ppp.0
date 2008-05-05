From: "cyx_mail@foxmail.com" <cyx_mail@foxmail.com>
Date: Mon, 05 May 2008 07:34:29 +0000
Subject: about option_t
Message-Id: <200805051534292917103@foxmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

typedef struct {
	char	*name;		/* name of the option */
	enum opt_type type;
	void	*addr;
	char	*description;
	unsigned int flags;
	void	*addr2;
	int	upper_limit;
	int	lower_limit;
	const char *source;
	short int priority;
	short int winner;
} option_t;

Which piece of code call the void *addr. some plugins uses this pointer to call functions when the plugin loads. BTW, what is the exactly meaning of each value of enum opt_type struct? Thanks a lot!

2008-05-05 


