package com.qcloud.component.commoditycenter.web.handler.impl;

import java.util.ArrayList;
import java.util.List;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.qcloud.component.commoditycenter.model.CombinationMerchandise;
import com.qcloud.component.commoditycenter.model.CombinationMerchandiseItem;
import com.qcloud.component.commoditycenter.service.CombinationMerchandiseItemService;
import com.qcloud.component.commoditycenter.web.handler.CombinationMerchandiseHandler;
import com.qcloud.component.commoditycenter.web.handler.CombinationMerchandiseItemHandler;
import com.qcloud.component.commoditycenter.web.vo.CombinationMerchandiseItemVO;
import com.qcloud.component.commoditycenter.web.vo.CombinationMerchandiseVO;
import com.qcloud.component.commoditycenter.web.vo.admin.AdminCombinationMerchandiseVO;
import com.qcloud.component.filesdk.FileSDKClient;
import com.qcloud.pirates.core.json.Json;
import com.qcloud.pirates.util.StringUtil;

@Component
public class CombinationMerchandiseHandlerImpl implements CombinationMerchandiseHandler {

    @Autowired
    private FileSDKClient                     fileSDKClient;

    @Autowired
    private CombinationMerchandiseItemService combinationMerchandiseItemService;

    @Autowired
    private CombinationMerchandiseItemHandler combinationMerchandiseItemHandler;

    @Override
    public List<CombinationMerchandiseVO> toVOList(List<CombinationMerchandise> list) {

        List<CombinationMerchandiseVO> voList = new ArrayList<CombinationMerchandiseVO>();
        for (CombinationMerchandise combinationMerchandise : list) {
            voList.add(toVO(combinationMerchandise));
        }
        return voList;
    }

    @Override
    public CombinationMerchandiseVO toVO(CombinationMerchandise combinationMerchandise) {

        CombinationMerchandiseVO vo = new CombinationMerchandiseVO();
        vo.setName(combinationMerchandise.getName());
        if (StringUtils.isNotEmpty(combinationMerchandise.getImage())) {
            vo.setImage(fileSDKClient.getFileServerUrl() + combinationMerchandise.getImage());
        } else {
            vo.setImage(StringUtil.nullToEmpty(combinationMerchandise.getImage()));
        }
        vo.setPrice(combinationMerchandise.getPrice());
        vo.setDiscount(combinationMerchandise.getDiscount());
        vo.setMerchantId(combinationMerchandise.getMerchantId());
        vo.setSurplus(combinationMerchandise.getPrice() - combinationMerchandise.getDiscount());
        vo.setUnifiedMerchandiseId(combinationMerchandise.getUnifiedMerchandiseId());
        vo.setStock(combinationMerchandise.getStock());
        List<CombinationMerchandiseItem> itemList = combinationMerchandiseItemService.listByCombinationMerchandise(combinationMerchandise.getId());
        List<CombinationMerchandiseItemVO> voList = combinationMerchandiseItemHandler.toVOList(itemList);
        vo.setItemList(voList);
        return vo;
    }

    @Override
    public List<AdminCombinationMerchandiseVO> toVOList4Admin(List<CombinationMerchandise> list) {

        List<AdminCombinationMerchandiseVO> voList = new ArrayList<AdminCombinationMerchandiseVO>();
        for (CombinationMerchandise adminCombinationMerchandise : list) {
            voList.add(toVO4Admin(adminCombinationMerchandise));
        }
        return voList;
    }

    @Override
    public AdminCombinationMerchandiseVO toVO4Admin(CombinationMerchandise combinationMerchandise) {

        String json = Json.toJson(combinationMerchandise);
        AdminCombinationMerchandiseVO vo = Json.toObject(json, AdminCombinationMerchandiseVO.class, true);
        vo.setImageUID(fileSDKClient.urlToUid(vo.getImage()));
        return vo;
    }
}
