Return-Path: <linux-ppp-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D386EC433EF
	for <linux-ppp@archiver.kernel.org>; Sun, 17 Apr 2022 01:41:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233184AbiDQBnc (ORCPT <rfc822;linux-ppp@archiver.kernel.org>);
        Sat, 16 Apr 2022 21:43:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232729AbiDQBnb (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Sat, 16 Apr 2022 21:43:31 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34BB11EC66
        for <linux-ppp@vger.kernel.org>; Sat, 16 Apr 2022 18:40:58 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id 12so9882062pll.12
        for <linux-ppp@vger.kernel.org>; Sat, 16 Apr 2022 18:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:subject:mime-version
         :content-transfer-encoding;
        bh=iYw8m6UcpLeQWrcfWcsD9C3f3LbzzVjBBnGezDBOqSE=;
        b=MBuEGKFq3ny2anVTCeO6TGU0n6dx2tJa+GD7OcPZgX3ei0iYySiGfGWcHPWTH7xdNu
         Xmce+Mbd8InoVQrdL0rrU0m8/vycvYBpw9vLuMS7tKo8/3PNSl/zJTqJqPrIPvX6zVow
         INuf5SBfLTRwlooQgkLQdD35wLAGRoYvBqEECEn+psAXQ0SLF1umeJMNOuELkLXmaR0k
         SLzuRpD40qXAqPpECsJpJ75etlRjdWfkPy0eJvDp7gNGZmFYw36znSM4gQ3ltbd5dqzC
         /krhdqSN5tOK5ZavnaCKb3PeKrmFS9UbUK6/iMTRT9M4vp6/R/6xHm5ZZWeW1wgtPqCY
         /nYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :content-transfer-encoding;
        bh=iYw8m6UcpLeQWrcfWcsD9C3f3LbzzVjBBnGezDBOqSE=;
        b=i2ehOBWdWr4xMxj7UxgmdWTUguvW0Vse+H2pY75hvqIAeLKPIYzZj0UJVg2otzNkhn
         aCtGSGYPDQdCgSHfh/2GbFcfK+fd3ZnDL5R9PWM3h+FA/5yaB/iteAlIbLIbYslw/dSy
         wds5hlif4rr9PD4Nikin6FyFPlfK7HXBXRylIDqc+jiKLDKpXRkQz3Bt4eEdCzmupunh
         jcoKCHTEh3jm+zD+dnPbkPIrtzh1so9YsTDhm4jckVv2KmV9E2eZJRrqJPop3DTHmUvS
         8+Le8MKf6eHOzi4q361xbM1FY4zja4uErhSG623qypeUQx1vc81q8RDuKkVPlZ/s3QKo
         HAKg==
X-Gm-Message-State: AOAM532v9LoUU7hXINY+/foAUvwVH57U3FswWXwGeiKdOFfy1VZz+pmk
        xWHLnAyfXq18zG83vM2/Dy3G9S2LcJ4=
X-Google-Smtp-Source: ABdhPJy1cZ9ojcu4Y4IBiDjFdW1TL1LPkzbyY01W90G8T/mO5/zJhYPLyx1FaUnWpF4Uhtx7TBeRmQ==
X-Received: by 2002:a17:902:ead4:b0:158:f6ff:86a9 with SMTP id p20-20020a170902ead400b00158f6ff86a9mr1315145pld.28.1650159657507;
        Sat, 16 Apr 2022 18:40:57 -0700 (PDT)
Received: from localhost ([2409:4052:2e0e:f258::a04b:1707])
        by smtp.gmail.com with ESMTPSA id s7-20020aa78bc7000000b005082ddeb6f8sm7242766pfd.199.2022.04.16.18.40.55
        for <linux-ppp@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Apr 2022 18:40:56 -0700 (PDT)
Date:   Sun, 17 Apr 2022 07:10:53 +0530 (GMT+05:30)
From:   manju6kanwar10@gmail.com
To:     linux-ppp@vger.kernel.org
Message-ID: <89800172.10.1650159653162@localhost>
Subject: Market research shows
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

Greetings, hopefully 2022 is treating you well so far.
Some organizations plan to stick with staffers working from their homes as opposed to large offices through the rest of this year and possibly beyond. Are you planning to increase your investment in collaboration as a result?
