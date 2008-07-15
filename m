From: "c4linux" <c4linux@gmail.com>
Date: Tue, 15 Jul 2008 09:22:24 +0000
Subject: a question about script_setenv in main.c for pppd code
Message-Id: <200807151722144210868@gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi,all:

 In main.c:

void
script_setenv(var, value, iskey)
    char *var, *value;
    int iskey;
{
    size_t varl = strlen(var);
    size_t vl = varl + strlen(value) + 2;
    int i;
    char *p, *newstring;

    newstring = (char *) malloc(vl+1);
    if (newstring = 0)
	return;
    *newstring++ = iskey;
    slprintf(newstring, vl, "%s=%s", var, value);

    /* check if this variable is already set */
    if (script_env != 0) {
	for (i = 0; (p = script_env[i]) != 0; ++i) {
	    if (strncmp(p, var, varl) = 0 && p[varl] = '=') {
#ifdef USE_TDB
		if (p[-1] && pppdb != NULL)
		    delete_db_key(p);
#endif
		free(p-1);
  ......
  ......

why not free(p) but free(p-1) ?
	

