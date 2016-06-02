package com.qcloud.component.warehouse.web.vo.admin;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import com.qcloud.component.commoditycenter.QUnifiedMerchandise;

public class AdminMerchandiseStockStateVO {

    // ID
    private long                id;

    // 商品库存出入货id
    private long                stockStateId;

    // 唯一商品id
    private long                unifiedMerchandiseId;

    // 数量
    private int                 number;

    // 状态: 1-申请 2-确定 3-签收
    private int                 state;

    // 申请时间
    private Date                applyTime;

    // 确认时间
    private Date                confirmTime;

    // 签收时间
    private Date                signTime;

    private AdminStockStateVO   adminStockStateVO;

    private QUnifiedMerchandise qUnifiedMerchandise;

    private List<Long>          unifiedMerchandiseIds = new ArrayList<Long>();

    private List<Integer>       numbers               = new ArrayList<Integer>();

    public AdminMerchandiseStockStateVO() {

    }

    public AdminMerchandiseStockStateVO(long id, long stockStateId, long unifiedMerchandiseId, int number, int state, Date applyTime, Date confirmTime, Date signTime) {

        this.id = id;
        this.stockStateId = stockStateId;
        this.unifiedMerchandiseId = unifiedMerchandiseId;
        this.number = number;
        this.state = state;
        this.applyTime = applyTime;
        this.confirmTime = confirmTime;
        this.signTime = signTime;
    }

    public void setId(long id) {

        this.id = id;
    }

    public long getId() {

        return id;
    }

    public void setStockStateId(long stockStateId) {

        this.stockStateId = stockStateId;
    }

    public long getStockStateId() {

        return stockStateId;
    }

    public void setUnifiedMerchandiseId(long unifiedMerchandiseId) {

        this.unifiedMerchandiseId = unifiedMerchandiseId;
    }

    public long getUnifiedMerchandiseId() {

        return unifiedMerchandiseId;
    }

    public void setNumber(int number) {

        this.number = number;
    }

    public int getNumber() {

        return number;
    }

    public void setState(int state) {

        this.state = state;
    }

    public int getState() {

        return state;
    }

    public void setApplyTime(Date applyTime) {

        this.applyTime = applyTime;
    }

    public Date getApplyTime() {

        return applyTime;
    }

    public void setConfirmTime(Date confirmTime) {

        this.confirmTime = confirmTime;
    }

    public Date getConfirmTime() {

        return confirmTime;
    }

    public void setSignTime(Date signTime) {

        this.signTime = signTime;
    }

    public Date getSignTime() {

        return signTime;
    }

    public List<Long> getUnifiedMerchandiseIds() {

        return unifiedMerchandiseIds;
    }

    public void setUnifiedMerchandiseIds(List<Long> unifiedMerchandiseIds) {

        this.unifiedMerchandiseIds = unifiedMerchandiseIds;
    }

    public List<Integer> getNumbers() {

        return numbers;
    }

    public void setNumbers(List<Integer> numbers) {

        this.numbers = numbers;
    }

    public AdminStockStateVO getAdminStockStateVO() {

        return adminStockStateVO;
    }

    public void setAdminStockStateVO(AdminStockStateVO adminStockStateVO) {

        this.adminStockStateVO = adminStockStateVO;
    }

    public QUnifiedMerchandise getqUnifiedMerchandise() {

        return qUnifiedMerchandise;
    }

    public void setqUnifiedMerchandise(QUnifiedMerchandise qUnifiedMerchandise) {

        this.qUnifiedMerchandise = qUnifiedMerchandise;
    }
}
