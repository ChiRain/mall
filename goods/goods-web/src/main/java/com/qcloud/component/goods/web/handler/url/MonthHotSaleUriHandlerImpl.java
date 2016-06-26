package com.qcloud.component.goods.web.handler.url;

import java.util.ArrayList;
import java.util.List;

import com.qcloud.pirates.web.filter.AbstractUriHandler;

public class MonthHotSaleUriHandlerImpl extends AbstractUriHandler {

	@Override
	public List<String> adminUris() {
		List<String> list = new ArrayList<String>();
		list.add("/admin/monthHotSale/list.do");
		list.add("/admin/monthHotSale/toAdd.do");
		list.add("/admin/monthHotSale/toEdit.do");
		list.add("/admin/monthHotSale/add.do");
		list.add("/admin/monthHotSale/edit.do");
		
		return list;
	}

	@Override
	public List<String> permissionUris() {
		List<String> list = new ArrayList<String>();
		list.add("/admin/monthHotSale/list.do");
		return list;
	}
}
