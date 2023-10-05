Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29E77E92723
	for <linux-ppp@archiver.kernel.org>; Thu,  5 Oct 2023 18:11:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229475AbjJESKe (ORCPT <rfc822;linux-ppp@archiver.kernel.org>);
        Thu, 5 Oct 2023 14:10:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232499AbjJESKA (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Thu, 5 Oct 2023 14:10:00 -0400
X-Greylist: delayed 527 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 05 Oct 2023 11:09:42 PDT
Received: from w4.tutanota.de (w4.tutanota.de [81.3.6.165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 312D710DA
        for <linux-ppp@vger.kernel.org>; Thu,  5 Oct 2023 11:09:42 -0700 (PDT)
Received: from tutadb.w10.tutanota.de (unknown [192.168.1.10])
        by w4.tutanota.de (Postfix) with ESMTP id 1ED59106031E
        for <linux-ppp@vger.kernel.org>; Thu,  5 Oct 2023 18:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1696528853;
        s=s1; d=tutanota.com;
        h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Date:Date:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:Sender;
        bh=e/N5L51U8kCfdHaWyBtVQHGNoGZyMEOAdgqa+V1jBro=;
        b=i4aSEisvai1hyeRkF8PKqMhiP0tYLKl03gA83VW7IT/jb43vMyMBnmIxoBIBgwyA
        vV2bQ6erp4oBrdNBKFT/mr2Fhq02upuVLtQANCxEAIvhkOCEYy4eqFmL9c2CPMZD4To
        x2cXWxQcAJVpQ+sfEMqu5QTsg0M4kbraDWNqZvMuj8mulyF6dP8ML6QCPOg7Vs8Aj4R
        nWc/bhlzax3L1jHFtfFnUyUgU/lUGrgkpdEJkiO6bzrhEUfBRalFBpWJ7fSdojsJfSi
        QruXMX+wCnah5+pdyiFQgIemLAz300U1+urX86XX9YcpCzS3KcrDFWbc/bwZyKZJyNp
        Zep50z6XkQ==
Date:   Thu, 5 Oct 2023 20:00:53 +0200 (CEST)
From:   Sagar Acharya <sagaracharya@tutanota.com>
To:     Linux Ppp <linux-ppp@vger.kernel.org>
Message-ID: <Ng-zxyt--3-9@tutanota.com>
Subject: Support for udp
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

Does pppd support udp? I am able to access tcp but not udp with pppd.
Thanking you
Sagar Acharya
https://humaaraartha.in/selfdost/selfdost.html

Kindly cc me as I am not subscribed.
