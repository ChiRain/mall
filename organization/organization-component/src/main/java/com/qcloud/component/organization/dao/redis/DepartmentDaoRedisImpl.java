package com.qcloud.component.organization.dao.redis;

import java.util.List;
import java.util.Map;
import java.util.Set;
import org.apache.commons.lang.NotImplementedException;
import org.springframework.stereotype.Repository;
import com.qcloud.component.organization.dao.DepartmentDao;
import com.qcloud.component.organization.model.Department;
import com.qcloud.component.organization.model.query.DepartmentQuery;
import com.qcloud.pirates.data.Page;

@Repository
public class DepartmentDaoRedisImpl implements DepartmentDao {

    // @Resource(name = "redis-organization")
    // private Redis redis;
    @Override
    public boolean add(Department department) {

        throw new NotImplementedException();
    }

    @Override
    public Department get(Long id) {

        throw new NotImplementedException();
    }

    @Override
    public boolean delete(Long id) {

        throw new NotImplementedException();
    }

    @Override
    public boolean update(Department department) {

        throw new NotImplementedException();
    }

    @Override
    public List<Department> list(List<Long> idList) {

        throw new NotImplementedException();
    }

    @Override
    public Map<Long, Department> map(Set<Long> idSet) {

        throw new NotImplementedException();
    }

    @Override
    public Page<Department> page(int start, int count) {

        throw new NotImplementedException();
    }

    @Override
    public Page<Department> page(DepartmentQuery query, int start, int count) {

        throw new NotImplementedException();
    }

    @Override
    public List<Department> listAll() {

        throw new NotImplementedException();
    }

    @Override
    public Department getByCode(String code) {

        throw new NotImplementedException();
    }

    @Override
    public List<Department> listByParent(long parentId, String bsid) {

        throw new NotImplementedException();
    }

    @Override
    public Department getByManager(long manager) {

        throw new NotImplementedException();
    }

    @Override
    public List<Department> listChildrenByParent(DepartmentQuery query, String bsid, int start, int count) {

        throw new NotImplementedException();
    }

    @Override
    public int countChildrenByParent(DepartmentQuery query, String bsid) {

        throw new NotImplementedException();
    }

    @Override
    public List<Department> listByAddress(DepartmentQuery query, int start, int count) {

        throw new NotImplementedException();
    }

    @Override
    public int countByAddress(DepartmentQuery query) {

        throw new NotImplementedException();
    }

    @Override
    public List<Department> listNearby(double latitude, double longitude) {

        throw new NotImplementedException();
    }
}
