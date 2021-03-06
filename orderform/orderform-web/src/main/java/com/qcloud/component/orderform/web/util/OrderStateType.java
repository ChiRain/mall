package com.qcloud.component.orderform.web.util;

public enum OrderStateType {
    //
    NORMAL_TOPAY(10, "待付款"),
    //
    NORMAL_TO_PACKING(20, "待配货"),
    //
    NORMAL_SHIPPED(30, "待发货"),
    //
    NORMAL_SIGN(40, "待签收"),
    //
    NORMAL_FINISHED(50, "已完成"),
    //
    NORMAL_CANCEL_ORDER(60, "已关闭"),
    //
    NORMAL_AFTER_SALE(70, "退款中"),
    //
    NORMAL_INVALID(80, "已取消"),
    //
    NORMAL_TRADE_SUCCESS(90, "交易成功"),
    //
    NORMAL_FINISHED_DELETE(100, "已删除");

    //
    private final int    key;

    //
    private final String name;

    private OrderStateType(int key, String name) {

        this.key = key;
        this.name = name;
    }

    public int getKey() {

        return key;
    }

    public String getName() {

        return name;
    }
}
