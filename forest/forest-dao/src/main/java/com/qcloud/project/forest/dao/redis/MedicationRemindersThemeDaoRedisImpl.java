package com.qcloud.project.forest.dao.redis;

import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.commons.lang.NotImplementedException;
import org.springframework.stereotype.Repository;

import com.qcloud.pirates.core.json.Json;
import com.qcloud.pirates.data.Page;
import com.qcloud.pirates.data.redis.Redis;
import com.qcloud.project.forest.dao.MedicationRemindersThemeDao;
import com.qcloud.project.forest.model.MedicationRemindersTheme;
import com.qcloud.project.forest.model.query.MedicationRemindersThemeQuery;

@Repository
public class MedicationRemindersThemeDaoRedisImpl implements MedicationRemindersThemeDao {

	//@Resource(name = "redis-forest")
	//private Redis redis;

	@Override
	public boolean add(MedicationRemindersTheme medicationRemindersTheme) {			
		throw new NotImplementedException();
	}

	@Override
	public MedicationRemindersTheme get(Long id) {		
		throw new NotImplementedException();
	}
	
	@Override
	public boolean delete(Long id){
		throw new NotImplementedException();
	}
	
	@Override
	public boolean update(MedicationRemindersTheme medicationRemindersTheme){
		throw new NotImplementedException();
	}
	
	@Override
	public List<MedicationRemindersTheme> list(List<Long> idList) {
		throw new NotImplementedException();
	}

	@Override
	public Map<Long, MedicationRemindersTheme> map(Set<Long> idSet){
		throw new NotImplementedException();
	}
			
																					public List<MedicationRemindersTheme> listByUserId(Long userId){
					throw new NotImplementedException();
				}

					
	@Override
	public Page<MedicationRemindersTheme> page(int start, int count){
		throw new NotImplementedException();
	}
	
	@Override
	public Page<MedicationRemindersTheme> page(MedicationRemindersThemeQuery query, int start, int count){
		throw new NotImplementedException();
	}
	
	@Override
	public List<MedicationRemindersTheme> listAll(){	
		throw new NotImplementedException();
	}
}

