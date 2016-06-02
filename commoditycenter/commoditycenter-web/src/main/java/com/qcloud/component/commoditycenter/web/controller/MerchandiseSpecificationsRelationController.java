package com.qcloud.component.commoditycenter.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qcloud.component.commoditycenter.service.MerchandiseSpecificationsRelationService;
import com.qcloud.component.commoditycenter.web.handler.MerchandiseSpecificationsRelationHandler;
		
@Controller
@RequestMapping(value = MerchandiseSpecificationsRelationController.DIR)
public class MerchandiseSpecificationsRelationController {
	
	public static final String DIR = "/merchandiseSpecificationsRelation";
	
	@Autowired
	private MerchandiseSpecificationsRelationService merchandiseSpecificationsRelationService;
	@Autowired
	private MerchandiseSpecificationsRelationHandler merchandiseSpecificationsRelationHandler;

}
