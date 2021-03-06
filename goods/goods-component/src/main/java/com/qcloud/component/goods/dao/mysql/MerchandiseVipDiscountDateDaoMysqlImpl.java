package com.qcloud.component.goods.dao.mysql;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;
import org.apache.commons.lang.NotImplementedException;

import com.qcloud.pirates.data.Page;
import com.qcloud.pirates.data.sql.mybatis.SqlOperator;
import com.qcloud.component.goods.dao.MerchandiseVipDiscountDateDao;
import com.qcloud.component.goods.model.MerchandiseVipDiscountDate;
import com.qcloud.component.goods.model.query.MerchandiseVipDiscountDateQuery;
		
@Repository
public class MerchandiseVipDiscountDateDaoMysqlImpl implements MerchandiseVipDiscountDateDao {

	@Resource(name = "sqlOperator-goods")
	private SqlOperator sqlOperator;

	@Override
	public boolean add(MerchandiseVipDiscountDate merchandiseVipDiscountDate) {
		return sqlOperator.insert("com.qcloud.component.goods.dao.mysql.mapper.MerchandiseVipDiscountDateMapper.insert", merchandiseVipDiscountDate) == 1;
	}	
	
	@Override
	public MerchandiseVipDiscountDate get(Long id) {
		return sqlOperator.selectOne("com.qcloud.component.goods.dao.mysql.mapper.MerchandiseVipDiscountDateMapper.get", id);
	}	
	
	@Override
	public boolean delete(Long id){
		return sqlOperator.delete("com.qcloud.component.goods.dao.mysql.mapper.MerchandiseVipDiscountDateMapper.delete", id) > 0;
	}	
		
	@Override
	public boolean update(MerchandiseVipDiscountDate merchandiseVipDiscountDate){
		return sqlOperator.update("com.qcloud.component.goods.dao.mysql.mapper.MerchandiseVipDiscountDateMapper.update", merchandiseVipDiscountDate) > 0;
	}
	
	@Override
	public List<MerchandiseVipDiscountDate> list(List<Long> idList) {
		throw new NotImplementedException();
	}

	@Override
	public Map<Long, MerchandiseVipDiscountDate> map(Set<Long> idSet){
		throw new NotImplementedException();
	}
		
	@Override
	public Page<MerchandiseVipDiscountDate> page(int start, int count){
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("start", start);
		param.put("count", count);

		List<MerchandiseVipDiscountDate> list = sqlOperator.selectList(
				"com.qcloud.component.goods.dao.mysql.mapper.MerchandiseVipDiscountDateMapper.list4page",
				param);
		int total = sqlOperator.selectOne(
				"com.qcloud.component.goods.dao.mysql.mapper.MerchandiseVipDiscountDateMapper.count4page",
				param);
		Page<MerchandiseVipDiscountDate> page = new Page<MerchandiseVipDiscountDate>();
		page.setCount(total);
		page.setData(list);
		return page;
	}
	
	@Override
	public Page<MerchandiseVipDiscountDate> page(MerchandiseVipDiscountDateQuery query, int start, int count){
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("start", start);
		param.put("count", count);

		List<MerchandiseVipDiscountDate> list = sqlOperator.selectList(
				"com.qcloud.component.goods.dao.mysql.mapper.MerchandiseVipDiscountDateMapper.list4query",
				param);
		int total = sqlOperator.selectOne(
				"com.qcloud.component.goods.dao.mysql.mapper.MerchandiseVipDiscountDateMapper.count4query",
				param);
		Page<MerchandiseVipDiscountDate> page = new Page<MerchandiseVipDiscountDate>();
		page.setCount(total);
		page.setData(list);
		return page;
	}
	
	@Override
	public List<MerchandiseVipDiscountDate> listAll(){	
		List<MerchandiseVipDiscountDate> list = sqlOperator.selectList(
				"com.qcloud.component.goods.dao.mysql.mapper.MerchandiseVipDiscountDateMapper.listAll");
		return list;
	}

    @Override
    public MerchandiseVipDiscountDate getByUser(Long userId, int year, int month, int day) {
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("userId", userId);
        param.put("year", year);
        param.put("month", month);
        param.put("day", day);
        return sqlOperator.selectOne("com.qcloud.component.goods.dao.mysql.mapper.MerchandiseVipDiscountDateMapper.getByUser", param);

    }

    @Override
    public MerchandiseVipDiscountDate getLastByUser(Long userId) {
        return sqlOperator.selectOne("com.qcloud.component.goods.dao.mysql.mapper.MerchandiseVipDiscountDateMapper.getLastByUser", userId);
    }
}

