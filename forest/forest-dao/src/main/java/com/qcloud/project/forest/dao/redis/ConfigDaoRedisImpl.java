package com.qcloud.project.forest.dao.redis;

import java.util.List;
import java.util.Map;
import java.util.Set;
import org.apache.commons.lang.NotImplementedException;
import org.springframework.stereotype.Repository;
import com.qcloud.pirates.data.Page;
import com.qcloud.project.forest.dao.ConfigDao;
import com.qcloud.project.forest.model.Config;
import com.qcloud.project.forest.model.query.ConfigQuery;

@Repository
public class ConfigDaoRedisImpl implements ConfigDao {

    // @Resource(name = "redis-forest")
    // private Redis redis;
    @Override
    public boolean add(Config config) {

        throw new NotImplementedException();
    }

    @Override
    public Config get(Long id) {

        throw new NotImplementedException();
    }

    @Override
    public boolean delete(Long id) {

        throw new NotImplementedException();
    }

    @Override
    public boolean update(Config config) {

        throw new NotImplementedException();
    }

    @Override
    public List<Config> list(List<Long> idList) {

        throw new NotImplementedException();
    }

    @Override
    public Map<Long, Config> map(Set<Long> idSet) {

        throw new NotImplementedException();
    }

    public List<Config> listByType(Integer type) {

        throw new NotImplementedException();
    }

    @Override
    public Page<Config> page(int start, int count) {

        throw new NotImplementedException();
    }

    @Override
    public Page<Config> page(ConfigQuery query, int start, int count) {

        throw new NotImplementedException();
    }

    @Override
    public List<Config> listAll() {

        throw new NotImplementedException();
    }

    @Override
    public Config getByCode(String code) {

        throw new NotImplementedException();
    }
}
