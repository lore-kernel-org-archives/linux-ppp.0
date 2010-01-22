From: "Leslie Rhorer" <lrhorer@satx.rr.com>
Date: Fri, 22 Jan 2010 01:50:22 +0000
Subject: RE: pppd hangs on SIGHUP
Message-Id: <F6.B2.02205.654095B4@cdptpa-omtalb.mail.rr.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <8D.DA.01403.892965B4@cdptpa-omtalb.mail.rr.com>
In-Reply-To: <8D.DA.01403.892965B4@cdptpa-omtalb.mail.rr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

> Leslie Rhorer wrote:
> > 2875: /usr/sbin/pppd call cricket
> > (No symbols found)
> > 0xb7f14424: ???? (8, 2, 808e580, bff2eaa8, 97aeea0, 97aeeb8)
> > 0x08069654: ???? (8, ffffffff)
> > 0x0806d751: ???? (807bee4, 0, 0, bff2eaf8, 808b884, ffffffff)
> > 0x08062ca9: ???? (0, 0, 0, 806656f, 80813ae, 807c098) + 10
> > 0x0805164b: ???? (80905e0, 80905e4, c, b3b, 0, c) + b0
> > 0x0805226f: ???? (807bc70, 804f930, bff2ec38, b7d50455, 3, bff2ec64) +
> 50
> > 0xb7d50455: ???? (8051890, 3, bff2ec64, 807bc70, 807bc60, b7f23250) +
> > 400d13a8
> 
> Compiling pppd first with "-g" would probably have been a good idea.

	OK, pardon my inexperience with C again, but I thought the compiler
options would be fairly obvious.  They aren't, at least not to me.  I looked
in the Makefile to see if there were any obvious compiler directives, but
there aren't.  Nothing jumped out at me in the rules file, either.
Evidently, make is choosing the compile parameters, and I don't really know
where to insert a directive to force gcc to produce native debugging
symbols.  Into which file (and what place, if it matters) do I insert the
directive and what syntax do I use?

	The contents of the Makefile are just:

#!/usr/bin/make -f
all: sh.vars mk.vars

clean:
        rm -f sh.vars mk.vars

mk.vars: vars.build vars
        $(SHELL) vars.build vars make > $@
sh.vars: vars.build vars
        $(SHELL) vars.build vars shell > $@


	The rules file is:

#!/usr/bin/make -f
SHELL=/bin/bash -e

BUILD_UDEB := 1

include debian/scripts/vars

BUILD_DIR := $(SOURCE_DIR)/$(TAR_DIR)
B := $(BUILD_DIR)
D := $(CURDIR)/debian/ppp

PPPDDIR := 2.4.4

# Various collections of files for use with dh_* tools.
DOCS  := FAQ README SETUP PLUGINS README.MPPE README.MSCHAP8? README.cbcp \
        README.pppoe README.pwfd
DOCS2 := README.STATIC-IP README.win9x defaultroute

all: build

unpack: $(STAMP_DIR)/unpack
$(STAMP_DIR)/unpack:
        $(MAKE) -f debian/sys-build.mk source.make
        touch $@

# used by the maintainer
unpack.nopatch:
        $(MAKE) -f debian/sys-build.mk source.build

# used by the maintainer
diff:
        $(MAKE) -f debian/sys-build.mk make-diff

clean:
        $(MAKE) -f debian/sys-build.mk source.clean
        dh_clean


configure: $(STAMP_DIR)/configure
$(STAMP_DIR)/configure: $(STAMP_DIR)/unpack
        dh_testdir
        -$(MAKE) clean
        NOISY=1 \
        $(MAKE) -f debian/sys-build.mk source.command SOURCE_CMD=" \
                ./configure --prefix=/usr \
        "
ifdef BUILD_UDEB
        cd $B && if [ ! -d pppd-udeb/ ]; then \
                mkdir pppd-udeb/ && \
                cd pppd-udeb/ && \
                sh $(CURDIR)/extra/lndir.sh ../pppd; \
        fi
endif
        touch $@


build: $(STAMP_DIR)/build
$(STAMP_DIR)/build: $(STAMP_DIR)/configure
        dh_testdir
        NOISY=1 \
        $(MAKE) -f debian/sys-build.mk source.command SOURCE_CMD=" \
                $(MAKE) \
        "
        touch $@

udeb: build-udeb
build-udeb: $(STAMP_DIR)/build-udeb
$(STAMP_DIR)/build-udeb: $(STAMP_DIR)/configure
ifdef BUILD_UDEB
        dh_testdir
        NOISY=1 \
        $(MAKE) -f debian/sys-build.mk source.command SOURCE_CMD=" \
                cd pppd-udeb/ && \
                $(MAKE) COPTS=\"-Os -fomit-frame-pointer\" \
                        CHAPMS= USE_CRYPT= NO_CRYPT_HACK=1 MPPE= \
                        FILTER= HAVE_MULTILINK= USE_TDB= \
                        HAS_SHADOW= USE_PAM= HAVE_INET6= \
                        CBCP= USE_SRP= MAXOCTETS= USE_BUILTIN_CRYPTO=1 \
                && \
                cd plugins/ && \
                $(MAKE) COPTS=\"-Os -fomit-frame-pointer\" \
                        SUBDIRS='rp-pppoe pppoatm' PLUGINS= \
        "
endif
        touch $@

install: $(STAMP_DIR)/build $(STAMP_DIR)/build-udeb checkroot
        dh_testdir
        dh_clean -k
        dh_installdirs

        NOISY=1 \
        $(MAKE) -f debian/sys-build.mk source.command SOURCE_CMD=" \
                $(MAKE) install DESTDIR=$D/usr/ \
        "

        { echo "Changelog extracted from README file:" ; \
          echo ; \
          sed -e "/^What's new in ppp-/,/package, see the Changes-2.3
file./!d" $B/README ; \
        } > $B/changelog-from-README

binary-arch: install
        rm -rf $D/etc/ppp/*-secrets
        mv $D/usr/include/ $D-dev/usr/

        install -m755 extra/pon extra/plog extra/poff $D/usr/bin/
        cp extra/pon.completion $D/etc/bash_completion.d/pon

        cp extra/options $D/etc/ppp/
        install -m755 extra/ip-up extra/ip-down extra/ipv6-up
extra/ipv6-down \
                $D/etc/ppp/
        install -m755 extra/0000usepeerdns-up
$D/etc/ppp/ip-up.d/0000usepeerdns
        install -m755 extra/0000usepeerdns-down \
                $D/etc/ppp/ip-down.d/0000usepeerdns
        install -m755 extra/apm $D/etc/apm/event.d/ppp

        install -m644 extra/pap-secrets extra/chap-secrets \
                extra/provider.peer extra/provider.chatscript \
                $D/usr/share/ppp/
        install -m644 extra/chatscript.pap $D/etc/chatscripts/pap

        dh_installchangelogs    -p ppp \
                $B/changelog-from-README Changes-2.3
        dh_installdocs          -p ppp \
                $(addprefix $B/,$(DOCS)) $(addprefix extra/,$(DOCS2))
        dh_installexamples $B/scripts/ extra/autopppd extra/userscripts-* \
                extra/popp extra/filters extra/options.ttyXX \
                extra/peers-* extra/interfaces extra/per-linkname
        # use our own version, not the upstream one
        mv $D/usr/share/doc/ppp/examples/autopppd \
                $D/usr/share/doc/ppp/examples/scripts/
        dh_installman extra/pon.1 extra/pppoe-discovery.8
        dh_link
        dh_installlogrotate
        dh_installinit --init-script=pppd-dns --no-start \
                --update-rcd-params='start 38 S .'
        dh_installpam

ifdef BUILD_UDEB
        dh_installdirs -p ppp-udeb etc/ppp/peers/ usr/sbin/ \
                usr/lib/pppd/$(PPPDDIR)/ usr/lib/post-base-installer.d/
        grep '^[a-zA-Z0-9]' extra/options > $D-udeb/etc/ppp/options
#       cp $B/chat/chat $D-udeb/usr/sbin/
        cp $B/pppd-udeb/pppd $D-udeb/usr/sbin/
        cp $B/pppd-udeb/pppd $B/pppd-udeb/plugins/rp-pppoe/pppoe-discovery \
                $D-udeb/usr/sbin/
        cp $B/pppd-udeb/plugins/rp-pppoe/rp-pppoe.so \
                $B/pppd-udeb/plugins/pppoatm/pppoatm.so \
                $D-udeb/usr/lib/pppd/$(PPPDDIR)/
        cp extra/ppp-udeb.ip-up \
                $D-udeb/etc/ppp/ip-up
        chmod 0755 $D-udeb/etc/ppp/ip-up
        install -m755 extra/ppp-udeb-postbaseinst \
                $D-udeb/usr/lib/post-base-installer.d/30ppp
        dh_installdebconf
endif

        dh_strip                -a
        dh_compress             -a
        dh_fixperms             -a

        chown root:dip $D/usr/sbin/pppd \
                $D/etc/ppp/ $D/etc/ppp/peers/ $D/etc/chatscripts/
        chmod 4754 $D/usr/sbin/pppd
        chmod 2750 $D/etc/ppp/peers/ $D/etc/chatscripts/

        dh_md5sums              -a
        dh_shlibdeps            -a
        dh_installdeb           -a

        dh_gencontrol           -a
        dh_builddeb             -a

binary-indep: install
        dh_installchangelogs    -i $B/changelog-from-README Changes-2.3
        dh_installdocs          -i

        dh_compress             -i
        dh_fixperms             -i

        dh_installdeb           -i
        dh_gencontrol           -i
        dh_builddeb             -i


checkroot:
        test root = "`whoami`"

binary: binary-arch binary-indep

.PHONY: binary binary-arch binary-indep unpack configure build clean
checkroot

