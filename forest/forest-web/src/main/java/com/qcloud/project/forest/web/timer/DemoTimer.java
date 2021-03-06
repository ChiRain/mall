package com.qcloud.project.forest.web.timer;

import java.util.Date;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;
import com.qcloud.pirates.core.timer.AbstractTimer;
import com.qcloud.pirates.core.timer.Period;
import com.qcloud.pirates.core.timer.SecondPeriod;
import com.qcloud.pirates.util.DateUtil;

@Component
public class DemoTimer extends AbstractTimer {

    private Log logger = LogFactory.getLog(getClass());

    @Override
    public boolean isEnabled() {

        return true;
    }

    @Override
    public Period getPeriod() {

        SecondPeriod s = new SecondPeriod(60);
        return s;
    }

    @Override
    public void start() {

        logger.info("定时器例子,当前系统时间" + DateUtil.date2String(new Date()));
    }
}
