package com.qcloud.project.forest.web.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.net.URLEncoder;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import com.qcloud.pirates.data.Page;
import com.qcloud.pirates.mvc.AceAjaxView;
import com.qcloud.pirates.mvc.AcePagingView;
import com.qcloud.pirates.util.AssertUtil;
import com.qcloud.pirates.util.StringUtil;
import com.qcloud.pirates.web.page.PPage;
import com.qcloud.pirates.web.page.PageParameterUtil;
import com.qcloud.pirates.web.page.PiratesParameterKey;
import com.qcloud.pirates.web.security.annotation.NoReferer;
import com.qcloud.project.forest.model.MedicationRemindersTheme;
import com.qcloud.project.forest.service.MedicationRemindersThemeService;
import com.qcloud.project.forest.web.handler.MedicationRemindersThemeHandler;
import com.qcloud.project.forest.model.query.MedicationRemindersThemeQuery;
import com.qcloud.project.forest.web.vo.admin.AdminMedicationRemindersThemeVO;
		
@Controller
@RequestMapping(value = "/" + AdminMedicationRemindersThemeController.DIR)
public class AdminMedicationRemindersThemeController {
	
	public static final String DIR = "admin/medicationRemindersTheme";
	
	@Autowired
	private MedicationRemindersThemeService medicationRemindersThemeService;
	@Autowired
	private MedicationRemindersThemeHandler medicationRemindersThemeHandler;
	
	@RequestMapping
	@NoReferer
	public ModelAndView list(HttpServletRequest request, PPage pPage, MedicationRemindersThemeQuery query) {
	    
		Page<MedicationRemindersTheme> page = medicationRemindersThemeService.page(query, pPage.getPageStart(), pPage.getPageSize());
		List<AdminMedicationRemindersThemeVO> list = medicationRemindersThemeHandler.toVOList4Admin(page.getData());
		
	    String pageQueryStr = StringUtil.nullToEmpty((String)PageParameterUtil.getParameterValues(request, PiratesParameterKey.PAGE_QUERY_STRING));
        String queryStr = StringUtil.nullToEmpty((String)PageParameterUtil.getParameterValues(request, PiratesParameterKey.QUERY_STRING));   
		AcePagingView pagingView = new AcePagingView("/admin/forest-MedicationRemindersTheme-list", DIR
				+ "/list?" + pageQueryStr, pPage.getPageNum(), pPage.getPageSize(), page.getCount());		
		pagingView.addObject("result", list);
		pagingView.addObject("queryStr", URLEncoder.encode(queryStr));
		
		return pagingView;
	}
	
	@RequestMapping
	public ModelAndView toAdd() {
		ModelAndView model = new ModelAndView("/admin/forest-MedicationRemindersTheme-add");
		return model;
	}
	
	@RequestMapping
	public AceAjaxView add(MedicationRemindersTheme medicationRemindersTheme) {
		medicationRemindersThemeService.add(medicationRemindersTheme);
		
		AceAjaxView aceAjaxView = new AceAjaxView();
		aceAjaxView.setMessage("添加成功");
		aceAjaxView.setUrl(DIR + "/list");
		return aceAjaxView;
	}
	
	@RequestMapping
	public ModelAndView toEdit(Long id, String queryStr) {
		AssertUtil.assertNotNull(id, "ID不能为空");
		MedicationRemindersTheme medicationRemindersTheme=medicationRemindersThemeService.get(id);
		AdminMedicationRemindersThemeVO adminMedicationRemindersThemeVO=medicationRemindersThemeHandler.toVO4Admin(medicationRemindersTheme);
		ModelAndView model = new ModelAndView("/admin/forest-MedicationRemindersTheme-edit");
		model.addObject("medicationRemindersTheme", adminMedicationRemindersThemeVO);
		model.addObject("queryStr", StringUtil.nullToEmpty(queryStr));
		return model;
	}
	
	@RequestMapping
	public AceAjaxView edit(MedicationRemindersTheme medicationRemindersTheme, String queryStr) {
		medicationRemindersThemeService.update(medicationRemindersTheme);		
		AceAjaxView aceAjaxView = new AceAjaxView();
		aceAjaxView.setMessage("编辑成功");
		aceAjaxView.setUrl(DIR + "/list?" + StringUtil.nullToEmpty(queryStr));
		return aceAjaxView;
	}
	
	@RequestMapping
	public AceAjaxView delete(Long id) {
		AssertUtil.assertNotNull(id, "ID不能为空");
		medicationRemindersThemeService.delete(id);
		AceAjaxView aceAjaxView = new AceAjaxView();
		aceAjaxView.setMessage("删除成功");
		aceAjaxView.setUrl(DIR + "/list");
		return aceAjaxView;
	}	
}
