﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.supplier.order.order_view1" validateRequest="false"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="x-ua-compatible" content="ie=7" />
    <meta content="text/html; charset=UTF-8" http-equiv="content-type" />
    <link rel="shortcut icon" type="image/x-icon" href="http://www.lebi.cn/favicon.ico" media="screen" />
    <link rel="stylesheet" type="text/css" href="<%=site.AdminCssPath %>/css.css" />
    <link rel="stylesheet" type="text/css" href="<%=site.AdminCssPath %>/order.css" />
    <script type="text/javascript" language="javascript" src="<%=site.AdminJsPath %>/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" language="javascript" src="<%=site.AdminJsPath %>/main.js"></script>
    <script type="text/javascript" language="javascript" src="<%=site.AdminJsPath %>/messagebox.js"></script>
    <script type="text/javascript" language="javascript" src="<%=site.AdminJsPath %>/Cookies.js"></script>
    <script type="text/javascript" language="javascript" src="<%=site.AdminJsPath %>/jquery-ui.min.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=site.AdminJsPath %>/jqueryuicss/redmond/jquery-ui.css" />
    <script type="text/javascript" language="javascript">
        var AdminPath = "<%=site.AdminPath %>";
        var WebPath ="<%=site.WebPath %>";
        $(document).ready(function () {
            var ul = $("div.mod-tab ul");
            var li = $("div.mod-tab ul li");
            var divShow = $("div.main");
            $(li).each(function (i) {
                var _this = this;
                $(_this).click(function () {
                    ul.find("li").removeClass("current");
                    $(_this).addClass("current");
                    divShow.find("div.cont").hide();
                    var divindex = divShow.find("div.cont")[i];
                    $(divindex).show();
                    SetCookie("OrderDetails-<%=model.id %>", i, 1);
                });
            });
            var i = GetCookie("OrderDetails-<%=model.id %>");
            if (i == "" || i == null)
                i = 0;
            if (i!=""){
                $(li).each(function () {
                    ul.find("li").removeClass("current");
                    divShow.find("div.cont").hide();
                    var divindex = divShow.find("div.cont")[i];
                    $(li[i]).addClass("current");
                    $(divindex).show()
                });
            }
        });
        function SaveOrder(id) {
            var postData = GetFormJsonData("shop");
            var url = "<%=site.AdminPath %>/ajax/ajax_order.aspx?__Action=Order_Edit&id=" + id;
            RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "?")});
        }
        function SaveComment(id) {
            var postData = GetFormJsonData("comment");
            var url = "../ajax/ajax_order.aspx?__Action=Comment_Edit&id=" + id;
            RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "?")});
        }
        //确认订单
        function Order_type(t, id, model) {
            if (!confirm("<%=Tag("确认操作吗？")%>"))
                return false;
            var postData = { "t": t };
            var url = "../ajax/ajax_order.aspx?__Action=Order_type&id=" + id + "&model=" + model;
            RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "?")});
        }
        function EditBillingAddress(id) {
            var title_ = "<%=Tag("编辑收货人")%>";
            var url_ = "billingaddress_edit_window.aspx?id=" + id;
            var width_ = 600;
            var height_ = 370;
            var modal_ = true;
            EditWindow(title_, url_, width_, height_, modal_);
        }
        function EditOrderMoney(id) {
            var title_ = "<%=Tag("修改金额")%>";
            var url_ = "order_money_edit_window.aspx?id=" + id;
            var width_ = 400;
            var height_ = 250;
            var modal_ = true;
            EditWindow(title_, url_, width_, height_, modal_);
        }
        function Order_shipping(id) {
            var title_ = "<%=Tag("发货")%>";
            var url_ = "shipping_window.aspx?id=" + id;
            var width_ = 600;
            var height_ = 500;
            var modal_ = true;
            EditWindow(title_, url_, width_, height_, modal_);
        }
        function Order_shipping_view(id) {
            var title_ = "<%=Tag("运输单据")%>";
            var url_ = "shipping_view_window.aspx?id=" + id;
            var width_ = 600;
            var height_ = 500;
            var modal_ = true;
            EditWindow(title_, url_, width_, height_, modal_, 'shippingview');
        }
        function Order_shipping_log(id) {
            var title_ = "<%=Tag("物流跟踪")%>";
            var url_ = "shipping_log_window.aspx?id=" + id;
            var width_ = 700;
            var height_ = 'auto';
            var modal_ = true;
            EditWindow(title_, url_, width_, height_, modal_, 'shippingview');
        }
        function Pro_Del(id) {
            if (!confirm("<%=Tag("确认要删除吗？")%>"))
                return false;
            var postData = GetFormJsonData("del");
            var url = "../ajax/ajax_order.aspx?__Action=OrderPro_Del&id=" + id;
            RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "?")});
        }
        function Comment_Del(id) {
            if (!confirm("<%=Tag("确认要删除吗？")%>"))
                return false;
            var postData = GetFormJsonData("del");
            var url = "../ajax/ajax_order.aspx?__Action=Comment_Del&id=" + id;
            RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "?")});
        }
        function Pro_Save(id) {
            var postData = GetFormJsonData("pro");
            var url = "../ajax/ajax_order.aspx?__Action=OrderPro_Edit&id=" + id;
            RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "?")});
        }
    </script>
    <style>body{background:#fff;margin:0;padding:0;font-size:12px;text-align:left}input{font-size:12px}.tools .close,.tools .print{float:right;}.tools .name{float:left;margin-right:10px}</style>
    <style media=print>.print-btn,infotab</style>
    <title><%=Tag("订单详情")%>-<%=Shop.Bussiness.EX_Type.TypeName(model.Type_id_OrderType)%>-<%=site.title%></title>
</head>
<body>
<div class="print-btn">
    <div class="tools">
        <%if (CurrentSupplier.Type_id_SupplierUserType == 431)
          { %>
        <ul>
            <li class="ship"><a href="#" class="a-btn" onclick="Order_shipping(<%=model.id %>)"><b></b><span><%=Tag("发货")%></span></a></li>
            <li class="close"><a href="javascript:void(0);" onclick="window.close();"><b></b><span><%=Tag("关闭")%></span></a></li>
            <li class="print"><a href="javascript:void(0);" onclick="window.print();"><b></b><span><%=Tag("打印")%></span></a></li>
        </ul>
        <%}
          else
          { %>
        <ul>
            <%if (model.Type_id_OrderType == 212)
              { %>
            <li class="tip"><a href="#"><b></b><span><%=Shop.Bussiness.EX_Type.TypeName(model.Type_id_OrderType)%></span></a></li><%} %>
            <%if (model.IsInvalid == 1)
              { %>
            <li class="cancel"><a href="#" class="a-btn" onclick="Order_type(0,<%=model.id %>,'IsInvalid');"><b></b><span><%=Tag("有效订单")%></span></a></li>
            <%}
              else
              {
                  if (model.IsVerified == 0)
                  { %>
            <li class="submit"><a href="#" class="a-btn" onclick="Order_type(1,<%=model.id %>,'IsInvalid');"><b></b><span><%=Tag("无效订单")%></span></a></li>
            <li class="submit"><a href="#" class="a-btn" onclick="Order_type(1,<%=model.id %>,'IsVerified');"><b></b><span><%=Tag("审核订单")%></span></a></li>
            <%}
                  else
                  { %>
            <li class="cancel"><span><a href="#" class="a-btn" onclick="Order_type(0,<%=model.id %>,'IsVerified');"><b></b><span><%=Tag("取消审核")%></span></a></li>
            <%if (model.Type_id_OrderType != 212)
              {%>
           
            <%if (model.IsShipped_All != 1)
              { %>
            <li class="ship"><a href="#" class="a-btn" onclick="Order_shipping(<%=model.id %>)"><b></b><span><%=Tag("发货")%></span></a></li>
            <%} %>
            <%} %>
            <%if (model.IsCompleted != 1)
              { %>
            <li class="submit"><a href="#" class="a-btn" onclick="Order_type(1,<%=model.id %>,'IsCompleted')"><b></b><span><%=Tag("已完成")%></span></a></li>
            <%}
              else
              {%>
            <li class="cancel"><a href="#" class="a-btn" onclick="Order_type(0,<%=model.id %>,'IsCompleted')"><b></b><span><%=Tag("未完成")%></span></a></li>
            <%}%>
            <%}
              } %>
            <li class="close"><a href="javascript:void(0);" onclick="window.close();"><b></b><span><%=Tag("关闭")%></span></a></li>
            <li class="print"><a href="javascript:void(0);" onclick="window.print();"><b></b><span><%=Tag("打印")%></span></a></li>
        </ul>
        <%} %>
    </div>
</div>
    <div class="main" id="infotab">
        <div class="mod-tab">
            <div class="con style02">
                <ul>
                    <li class="current"><a><span><%=Tag("基本信息")%></span></a></li>
                    <li><a><span><%=Tag("商品信息")%></span></a></li>
                    <li><a><span><%=Tag("配送记录")%></span></a></li>
          
                    <li><a><span><%=Tag("订单留言")%></span></a></li>
                    <li><a><span><%=Tag("订单日志")%></span></a></li>
                </ul>
            </div>
        </div>
        
        <div style="display: block" class="cont">
            <%if (model.IsInvalid == 1)
                { %>
            <div id="process" class="section2">
		        <div class="node fore ready"><ul><li class="tx1">&nbsp;</li><li class="tx2"><%=Tag("提交订单")%></li><li class="tx3"><%=model.Time_Add %></li></ul></div>
            	<div class="proce ready"><ul><li class="tx1">&nbsp;</li></ul></div>
                <div class="node ready"><ul><li class="tx1">&nbsp;</li><li class="tx2"><%=Tag("无效订单")%></li><li class="tx3"><%=model.Time_Completed%></li></ul></div>
            </div>
            <%}
              else if (model.IsVerified == 0)
                { %>
            <div id="process" class="section2">
		        <div class="node fore ready"><ul><li class="tx1">&nbsp;</li><li class="tx2"><%=Tag("提交订单")%></li><li class="tx3"><%=model.Time_Add %></li></ul></div>
            	<div class="proce wait"><ul><li class="tx1">&nbsp;</li></ul></div>
                <div class="node wait"><ul><li class="tx1">&nbsp;</li><li class="tx2"><%=Tag("审核订单")%></li><li class="tx3"></li></ul></div>
            </div>
            <%}else{ %>
            <%if (model.Type_id_OrderType == 212)
              { %>
            <div id="process" class="section3">
		        <div class="node fore ready"><ul><li class="tx1">&nbsp;</li><li class="tx2"><%=Tag("提交订单")%></li><li class="tx3"><%=model.Time_Add %></li></ul></div>
            	<div class="proce ready"><ul><li class="tx1">&nbsp;</li></ul></div>
                <div class="node ready"><ul><li class="tx1">&nbsp;</li><li class="tx2"><%=Tag("审核订单")%></li><li class="tx3"><%=model.Time_Verified%></li></ul></div>
                <%if (model.IsCompleted != 1)
                  { %>
            	<div class="proce wait"><ul><li class="tx1">&nbsp;</li></ul></div>
            	<div class="node wait"><ul><li class="tx1">&nbsp;</li><li class="tx2"><%=Tag("已完成")%></li><li class="tx3"></li></ul></div>
                <%}
                  else
                  { %>
            	<div class="proce ready"><ul><li class="tx1">&nbsp;</li></ul></div>
                <div class="node ready"><ul><li class="tx1">&nbsp;</li><li class="tx2"><%=Tag("已完成")%></li><li class="tx3"><%=model.Time_Completed%></li></ul></div>
                <%} %>
            </div>
            <%}else{ %>
            <div id="process" class="section5">
		        <div class="node fore ready"><ul><li class="tx1">&nbsp;</li><li class="tx2"><%=Tag("提交订单")%></li><li class="tx3"><%=model.Time_Add %></li></ul></div>
            	<div class="proce ready"><ul><li class="tx1">&nbsp;</li></ul></div>
                <div class="node ready"><ul><li class="tx1">&nbsp;</li><li class="tx2"><%=Tag("审核订单")%></li><li class="tx3"><%=model.Time_Verified%></li></ul></div>
                <%if (model.IsPaid != 1)
                  { %>
            	<div class="proce wait"><ul><li class="tx1">&nbsp;</li></ul></div>
            	<div class="node wait"><ul><li class="tx1">&nbsp;</li><li class="tx2"><%=Tag("未支付")%></li><li class="tx3"></li></ul></div>
                <%}
                  else
                  { %>
            	<div class="proce ready"><ul><li class="tx1">&nbsp;</li></ul></div>
                <div class="node ready"><ul><li class="tx1">&nbsp;</li><li class="tx2"><%=Tag("已支付")%></li><li class="tx3"><%=model.Time_Paid %></li></ul></div>
                <%} %>
                <%if (model.IsShipped != 1)
                  { %>
            	<div class="proce wait"><ul><li class="tx1">&nbsp;</li></ul></div>
            	<div class="node wait"><ul><li class="tx1">&nbsp;</li><li class="tx2"><%=Tag("已发货")%></li><li class="tx3"></li></ul></div>
                <%}
                  else
                  { %>
            	<div class="proce ready"><ul><li class="tx1">&nbsp;</li></ul></div>
                <div class="node ready"><ul><li class="tx1">&nbsp;</li><li class="tx2"><%if (model.IsShipped_All != 1)
                                                                                         { %><%=Tag("部分发货")%><%}
                                                                                         else
                                                                                         { %><%=Tag("已发货")%><%} %></li><li class="tx3"><%=model.Time_Shipped%></li></ul></div>
                <%} %>
                <%if (model.IsReceived != 1)
                  { %>
            	<div class="proce wait"><ul><li class="tx1">&nbsp;</li></ul></div>
            	<div class="node wait"><ul><li class="tx1">&nbsp;</li><li class="tx2"><%=Tag("已收货")%></li><li class="tx3"></li></ul></div>
                <%}
                  else
                  { %>
            	<div class="proce ready"><ul><li class="tx1">&nbsp;</li></ul></div>
                <div class="node ready"><ul><li class="tx1">&nbsp;</li><li class="tx2"><%=Tag("已收货")%></li><li class="tx3"><%=model.Time_Received%></li></ul></div>
                <%} %>
                <%if (model.IsCompleted != 1)
                  { %>
            	<div class="proce wait"><ul><li class="tx1">&nbsp;</li></ul></div>
            	<div class="node wait"><ul><li class="tx1">&nbsp;</li><li class="tx2"><%=Tag("已完成")%></li><li class="tx3"></li></ul></div>
                <%}
                  else
                  { %>
            	<div class="proce ready"><ul><li class="tx1">&nbsp;</li></ul></div>
                <div class="node ready"><ul><li class="tx1">&nbsp;</li><li class="tx2"><%=Tag("已完成")%></li><li class="tx3"><%=model.Time_Completed%></li></ul></div>
                <%} %>
            </div>
            <%} %>
            <%} %>
            <div class="mod-title">
                <div><%=Tag("基本信息")%></div>
            </div>
            <div class="mod-table-main">
                <div class="con style05">
                    <table width="100%" cellspacing="0" cellpadding="0" border="0">
                        <tbody>
                            <tr>
                                <th width="33%" height="30px">
                                    <%=Tag("基本信息")%>
                                </th>
                                <th width="33%" class="x-tab">
                                    <%=Tag("金额")%>
                                    <%if (model.IsPaid == 0)
                                      { %>
                                    <a href="javascript:EditOrderMoney(<%=model.id %>);"><%=Tag("编辑")%></a>
                                    <%} %>
                                </th>
                                <th class="x-tab">
                                    <%=Tag("收货人信息")%> 
                                    <%if (model.IsShipped == 0)
                                      { %>
                                     <a href="javascript:EditBillingAddress(<%=model.id %>);"><%=Tag("编辑")%></a>
                                    <%} %>
                                </th>
                            </tr>
                            <tr>
                                <td valign="top" align="right" height="30px">
                                    <div class="hr10">
                                    </div>
                                    <div class="mod-table-main">
                                        <div class="con style02">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td width="100" align="right">
                                                        <%=Tag("状态")%>：
                                                    </td>
                                                    <td>
                                                        <%=Tag(Shop.Bussiness.Order.OrderStatus(model)) %>
                                                        <%//=model.IsShipped_All==0?"["+Tag("部分发货")+"]":"" %>

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="70" align="right">
                                                        <%=Tag("订单编号")%>：
                                                    </td>
                                                    <td>
                                                        <%=model.Code %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <%=Tag("订购时间")%>：
                                                    </td>
                                                    <td>
                                                        <%=model.Time_Add %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <%=Tag("商品重量")%>：
                                                    </td>
                                                    <td>
                                                        <%=model.Weight %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <%=Tag("配送方式")%>：
                                                    </td>
                                                    <td>
                                                        <%=model.Transport_Name %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <%=Tag("支付方式")%>：
                                                    </td>
                                                    <td>
                                                        <%=Shop.Bussiness.Language.Content(model.Pay,CurrentLanguage)%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <%=Tag("发票状态")%>：
                                                    </td>
                                                    <td>
                                                        <%=billstatus%>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="hr10">
                                    </div>
                                </td>
                                <td valign="top" align="right" height="30px">
                                    <div class="hr10"></div>
                                    <div class="mod-table-main">
                                        <div class="con style02">

                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td align="right">
                                                        <%=Tag("商品总额")%>：
                                                    </td>
                                                    <td align="left">
                                                        <%=FormatMoney(model.Money_Product)%>
                                                        <%=FormatMoney(model.Money_Product, model.Currency_Code)%>
                                                        
                                                    </td>
                                                </tr>
                                                <%if (model.Money_Cut > 0)
                                                  { %>
                                                <tr>
                                                    <td align="right">
                                                        <%=Tag("优惠金额")%>：
                                                    </td>
                                                    <td>
                                                        <%=FormatMoney(model.Money_Cut)%>
                                                        <%=FormatMoney(model.Money_Cut, model.Currency_Code)%>
                                                        
                                                    </td>
                                                </tr>
                                                <%} %>
                                                <%if (model.Money_Give > 0)
                                                  { %>
                                                <tr>
                                                    <td align="right">
                                                        <%=Tag("返还金额")%>：
                                                    </td>
                                                    <td>
                                                        <strong><%=FormatMoney(model.Money_Give)%>
                                                        <%=FormatMoney(model.Money_Give, model.Currency_Code)%></strong>
                                                        
                                                    </td>
                                                </tr>
                                                <%} %>
                                                
                                                 <%if (model.Money_Transport > 0)
                                                   { %>
                                                <tr>
                                                    <td align="right">
                                                        <%=Tag("配送费用")%>：
                                                    </td>
                                                    <td>
                                                        <%=FormatMoney(model.Money_Transport)%>
                                                        <%=FormatMoney(model.Money_Transport, model.Currency_Code)%>
                                                        
                                                    </td>
                                                </tr>
                                                <%} %>
                                                <%if (model.Money_Bill > 0)
                                                  { %>
                                                <tr>
                                                    <td align="right">
                                                        <%=Tag("税金")%>：
                                                    </td>
                                                    <td>
                                                        <%=FormatMoney(model.Money_Bill)%>
                                                        <%=FormatMoney(model.Money_Bill, model.Currency_Code)%>
                                                        
                                                    </td>
                                                </tr>
                                                <%} %>
                                                <tr>
                                                    <td width="100" align="right">
                                                        <%=Tag("订单总额")%>：
                                                    </td>
                                                    <td>
                                                        <%=FormatMoney(model.Money_Order)%>
                                                        <%=FormatMoney(model.Money_Order, model.Currency_Code)%>
                                                    </td>
                                                </tr>
                                                <%if (model.Money_UserCut > 0)
                                                  { %>                                                
                                                <tr>
                                                    <td width="100" align="right"><%=Tag("余额支付")%>：</td>
                                                    <td>
                                                    <%=FormatMoney(model.Money_UserCut)%>
                                                    <%=FormatMoney(model.Money_UserCut, model.Currency_Code)%></td>
                                                </tr>
                                                <%} %>
                                                <%if (model.Money_UseCard311 > 0)
                                                  { %>                                                
                                                <tr>
                                                    <td width="100" align="right"><%=Tag("购物卡支付")%>：</td>
                                                    <td>
                                                    <%=FormatMoney(model.Money_UseCard311)%>
                                                    <%=FormatMoney(model.Money_UseCard311, model.Currency_Code)%></td>
                                                </tr>
                                                <%} %>
                                                <%if (model.Money_UseCard312 > 0)
                                                  { %>                                                
                                                <tr>
                                                    <td width="100" align="right"><%=Tag("代金券支付")%>：</td>
                                                    <td>
                                                    <%=FormatMoney(model.Money_UseCard312)%>
                                                    <%=FormatMoney(model.Money_UseCard312, model.Currency_Code)%></td>
                                                </tr>
                                                <%} %>
                                                <%if (model.Money_Pay > 0)
                                                  { %>
                                                <tr>
                                                    <td align="right">
                                                        <%=Tag("应付金额")%>：
                                                    </td>
                                                    <td>
                                                        <strong><%=FormatMoney(model.Money_Pay)%>
                                                        <%=FormatMoney(model.Money_Pay, model.Currency_Code)%></strong>
                                                        
                                                    </td>
                                                </tr>
                                                <%} %>
                                                <tr>
                                                    <td align="right">
                                                        <%=Tag("可得积分")%>：
                                                    </td>
                                                    <td>
                                                        <%=str + model.Point%>
                                                    </td>
                                                </tr>
                                            </table>
                                          
                                        </div>
                                    </div>
                                    <div class="hr10">
                                    </div>
                                </td>
                                <td valign="top" height="30px">
                                    <div class="hr10">
                                    </div>
                                    <div class="mod-table-main">
                                        <div class="con style02">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                
                                                <tr>
                                                    <td width="70" align="right">
                                                        <%=Tag("姓名")%>：
                                                    </td>
                                                    <td>
                                                        <span id="lblReceivingName"><%=model.T_Name %></span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <%=Tag("电话")%>：
                                                    </td>
                                                    <td>
                                                        <span id="lblReceivingTelePhone"><%=model.T_Phone %></span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <%=Tag("手机")%>：
                                                    </td>
                                                    <td>
                                                        <span id="lblReceivingPhone"><%=model.T_MobilePhone %></span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <%=Tag("地区")%>：
                                                    </td>
                                                    <td>
                                                        <span id="lblReceivingArea"><%=Shop.Bussiness.EX_Area.GetAreaName(model.T_Area_id)%></span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <%=Tag("地址")%>：
                                                    </td>
                                                    <td>
                                                        <span id="lblReceivingAddress"><%=model.T_Address %></span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <%=Tag("邮编")%>：
                                                    </td>
                                                    <td>
                                                        <span id="lblReceivingPostCode"><%=model.T_Postalcode %></span>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="hr10">
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            
            
            <div class="mod-title">
              <div>商品信息</div>
            </div>
            <div class="mod-table-main">
                <div class="con style05">
                    <table width="100%" cellspacing="0" cellpadding="0" border="0">
                        <tr>
                            <th style="width:100px;">
                                <%=Tag("商品编号")%>
                            </th>
                            <th style="width:100px;">
                                <%=Tag("商品货号")%>
                            </th>
                            <th>
                                <%=Tag("商品名称")%>
                            </th>
                            <th style="width:100px;">
                                <%=Tag("规格")%>
                            </th>
                            <th style="width:100px;">
                                <%if (model.Type_id_OrderType == 212) { Response.Write(Tag("数量")); } else { Response.Write(Tag("订购数量")); }%>
                            </th>
                            <th style="width:100px;">
                                <%=Tag("已发数量")%>
                            </th>
                            <th style="width:100px;">
                                <%=Tag("已收数量")%>
                            </th>
                            <th style="width:100px;">
                                <%=Tag("单价")%>
                            </th>
                            <th style="width:100px;">
                                <%=Tag("小计")%>
                            </th>
                        </tr>
                      <%foreach (Shop.Model.Lebi_Order_Product pro in pros)
                        { %>
                        <tr>
                            <td>
                                <%=pro.Product_Number %>
                            </td>
                            <td><%=Shop.Bussiness.EX_Product.GetProduct(pro.Product_id).Code%>&nbsp;</td>
                            <td>
                                <img src="<%=WebPath + pro.ImageSmall %>" style="height:30px;padding:3px 0" />
                                <%=Shop.Bussiness.Language.Content(pro.Product_Name,CurrentLanguage) %>&nbsp;<a target="_blank" href="<%=Shop.Bussiness.ThemeUrl.GetURL("P_Product",pro.Product_id.ToString(),"",CurrentLanguage)%>"><img src="<%=PageImage("icon/newWindow.png")%>" /></a>
                            </td>
                            <td>
                                <%=Shop.Bussiness.EX_Product.ProPertyNameStr(Shop.Bussiness.EX_Product.GetProduct(pro.Product_id).ProPerty131, CurrentLanguage)%>
                            </td>
                            <td>
                                <%=str + pro.Count%>
                            </td>
                            <td>
                                <%=pro.Count_Shipped %>
                            </td>
                             <td>
                                <%=pro.Count_Received %>
                            </td>
                            <td>
                                <%=FormatMoney(pro.Price) %>
                            </td>
                            <td>
                                <%=str + FormatMoney(pro.Money)%>
                            </td>
                        </tr>

                    <%} %>
                    </table>
                </div>
            </div>
            
            <div class="hr40">
            </div>
            

            
        </div>
        
        
        <div style="display: none" class="cont">
            <div class="mod-title">
                <div><%=Tag("商品信息")%></div>
            </div>
            <div class="mod-table-main">
                <div class="con style05">
                    <table width="100%" cellspacing="0" cellpadding="0" border="0">
                        <tr>
                            <%if (model.IsVerified==0)
                                { %>
                           <th style="width: 30px" class="selectAll">
                                <a href="javascript:void(0);" onclick="$('input[name=\'proid\']').attr('checked',!$(this).attr('checked'));$(this).attr('checked',!$(this).attr('checked'));"><%=Tag("全选")%></a>
                            </th>
                            <%} %>
                            <th style="width:100px;">
                                <%=Tag("商品编号")%>
                            </th>
                            <th style="width:100px;">
                                <%=Tag("商品货号")%>
                            </th>
                            <th>
                                <%=Tag("商品名称")%>
                            </th>
                            <th style="width:100px;">
                                <%=Tag("规格")%>
                            </th>
                            <th style="width:100px;">
                                <%if (model.Type_id_OrderType == 212) { Response.Write(Tag("数量")); } else { Response.Write(Tag("订购数量")); }%>
                            </th>
                            <th style="width:100px;">
                                <%=Tag("已发数量")%>
                            </th>
                            <th style="width:100px;">
                                <%=Tag("已收数量")%>
                            </th>
                            <th style="width:100px;">
                                <%=Tag("单价")%>
                            </th>
                            <th style="width:100px;">
                                <%=Tag("小计")%>
                            </th>
                        </tr>
                      <%foreach (Shop.Model.Lebi_Order_Product pro in pros)
                        { %>
                        <tr>
                            <%if (model.IsVerified==0)
                                { %>
                            <td align="center"><input type="checkbox" name="proid" value="<%=pro.id %>" del="true" /><input type="hidden" name="Uproid" value="<%=pro.id %>" pro="true" /></td>
                            <%} %>
                            <td><%=pro.Product_Number %></td>
                            <td><%=Shop.Bussiness.EX_Product.GetProduct(pro.Product_id).Code%>&nbsp;</td>
                            <td>
                                <img src="<%=WebPath + pro.ImageSmall %>" style="height:30px;padding:3px 0" />
                                <%=Shop.Bussiness.Language.Content(pro.Product_Name,CurrentLanguage) %>&nbsp;<a target="_blank" href="<%=Shop.Bussiness.ThemeUrl.GetURL("P_Product",pro.Product_id.ToString(),"",CurrentLanguage)%>"><img src="<%=PageImage("icon/newWindow.png")%>" /></a>
                            </td>
                            <td>
                                <%=Shop.Bussiness.EX_Product.ProPertyNameStr(Shop.Bussiness.EX_Product.GetProduct(pro.Product_id).ProPerty131, CurrentLanguage)%>
                            </td>
                            <td>
                                <%if (model.IsVerified==1)
                                  { %>
                                <%=str + pro.Count%>
                                <%}
                                  else
                                  { %>
                                <input type="text" class="input" pro="true" name="Count<%=pro.id %>"  id="Count<%=pro.id %>" value="<%=pro.Count %>" onkeyup="value=value.replace(/[^\d]/g,'')" style="width: 70px;" />
                                <%} %>
                            </td>
                            <td>
                                <%=pro.Count_Shipped %>
                            </td>
                            <td>
                                <%=pro.Count_Received %>
                            </td>
                            <td>
                                <%if (model.IsVerified==1)
                                  { %>
                                <%=pro.Price %>
                                <%}
                                  else
                                  { %>
                                <input type="text" class="input" pro="true" name="Price<%=pro.id %>" id="Price<%=pro.id %>" value="<%=pro.Price %>" onkeyup="value=value.replace(/[^\d\.]/g,'')" style="width: 70px;" />
                                <%} %>
                            </td>
                            <td>
                                <%=str + FormatMoney(pro.Money)%>
                            </td>
                        </tr>

                    <%} %>
                    </table>
                </div>
                <%if (model.IsVerified == 0)
                  { %>
                <div style="text-align:left;margin-top:10px;">
                    <div class="tools tools-m clear">
                        <ul>
                            <li class="submit"><a href="javascript:void(0);" onclick="Pro_Save(<%=model.id %>);"><b></b><span><%=Tag("保存")%></span></a></li>
                            <li class="del"><a href="javascript:void(0);" onclick="Pro_Del(<%=model.id %>);"><b></b><span><%=Tag("删除")%></span></a></li>
                        </ul>
                    </div>
                </div>
                <%} %>
            </div>
        </div>
        
        
        <div style="display: none" class="cont">
            
            <div class="mod-title">
                <div><%=Tag("配送记录")%></div>
            </div>
            <div class="mod-table-main">
                <div class="con style05">
                    <table width="100%" cellspacing="0" cellpadding="0" border="0">
                        <tr>
                            <th style="width: 150px;">
                                <%=Tag("时间")%>
                            </th>
                            <th style="width: 100px;">
                                <%=Tag("类型")%>
                            </th>
                            <th style="width: 150px;">
                                <%=Tag("配送方式")%>
                            </th>
                            <th style="width: 150px;">
                                <%=Tag("发货单号")%>
                            </th>
                            <th style="width: 100px;">
                                <%=Tag("实际运费")%>
                            </th>
                            <th style="width: 150px;">
                                <%=Tag("状态")%>
                            </th>
                            <th style="width: 150px;">
                                <%=Tag("收/发件人")%>
                            </th>
                            <th>
                                <%=Tag("操作")%>
                            </th>
                            
                        </tr>
                        <%foreach (Shop.Model.Lebi_Transport_Order torder in torders)
                          { %>
                        <tr>
                            <td>
                                <%=torder.Time_Add %>
                            </td>
                            <td>
                                <%=Shop.Bussiness.EX_Type.TypeName(model.Type_id_OrderType) %>
                            </td>
                            <td>
                                <%=torder.Transport_Name %>
                            </td>
                            <td>
                                <%=torder.Code %>
                            </td>
                            <td>
                                <%=DefaultCurrency.Msige %><%=torder.Money %>
                            </td>
                            
                            <td>
                                <%=Shop.Bussiness.EX_Type.TypeName(torder.Type_id_TransportOrderStatus) %>
                            </td>
                            
                            <td>
                                <%=torder.T_Name %>
                            </td>
                            <td>
                                <a href="javascript:Order_shipping_view(<%=torder.id %>);"><%=Tag("查看")%></a> 
                                | <a href="javascript:Order_shipping_log(<%=torder.id %>);"><%=Tag("跟踪")%></a> 
                                | <a href="Express_Print.aspx?Tid=<%=torder.Transport_id %>&id=<%=model.id %>" target="_blank"><%=Tag("打印快递单")%><%if (model.IsPrintExpress == 1){ %>(<font class=red><%=Tag("已打印")%></font>)<%} %></a>
                            </td>
                        </tr>
                        <%} %>
                    </table>
                </div>
            </div>
            
            <div class="hr40">
            </div>

        </div>
        
        
        
        <div style="display: none" class="cont">
            <div class="mod-title">
                <div>订单留言</div>
            </div>
            <div style="text-align:left;margin-top:10px;">
               <textarea name="Comment" id="Comment" Comment="true" class="textarea" style="width:600px;height:60px"></textarea>
                <div class="tools clear">
                    <ul>
                        <li class="plus"><a href="javascript:void(0);" onclick="javascript:resizeEditor('Comment',100);"><b></b><span><%=Tag("展开")%></span></a></li>
                        <li class="minus"><a href="javascript:void(0);" onclick="javascript:resizeEditor('Comment',-100)"><b></b><span><%=Tag("收缩")%></span></a></li>
                    </ul>
                </div>
            </div>
            <div style="text-align:left;margin-top:10px;">
                <div class="tools tools-m clear">
                    <ul>
                        <li class="submit"><a href="javascript:void(0);" onclick="SaveComment(<%=model.id %>);"><b></b><span><%=Tag("保存")%></span></a></li>
                    </ul>
                </div>
            </div>
            <div class="mod-title">
                <div>订单留言</div>
            </div>
            <div class="mod-table-main">
                <div class="con style05">
                    <table width="100%" cellspacing="0" cellpadding="0" border="0">
                        
                        <tr>
                            <th style="width:30px;" class="selectAll">
                <a href="javascript:void(0);" onclick="$('input[name=\'commid\']').attr('checked',!$(this).attr('checked'));$(this).attr('checked',!$(this).attr('checked'));"><%=Tag("全选")%></a></th>
                            <th style="width:150px;">
                                时间
                            </th>
                            <th>
                                内容
                            </th>
                        </tr>
                      <%foreach (Shop.Model.Lebi_Comment comm in comms)
                        { %>
                        <tr>
                            <td align="center">
                                <input type="checkbox" name="commid" value="<%=comm.id %>" del="true" />
                            </td>
                            <td>
                                <%=comm.Time_Add %>
                            </td>
                            
                            <td>
                                <%
                                    if (comm.Admin_id > 0)
                                        Response.Write("[" + Tag("管理员") + "]" + comm.Admin_UserName);
                                    if (comm.User_id > 0)
                                        Response.Write("[" + Tag("会员") + "]" + comm.User_UserName);
                                    if (comm.Supplier_id > 0)
                                        Response.Write("[" + Tag("供应商") + "]" + comm.Supplier_SubName);
                                %>
                                ：
                                <%=comm.Content%>
                            </td>
                        </tr>

                    <%} %>
                    </table>
                </div>
                <div style="text-align:left;margin-top:10px;">
                    <div class="tools tools-m clear">
                        <ul>
                            <li class="del"><a href="javascript:void(0);" onclick="Comment_Del(<%=model.id %>);"><b></b><span><%=Tag("删除")%></span></a></li>
                        </ul>
                    </div>
                </div>
                
            </div>
        </div>
        
        
        <div style="display: none" class="cont">
            <div class="mod-title">
                <div><%=Tag("订单日志")%></div>
            </div>
            <div class="mod-table-main">
                <div class="con style05">
                    <table width="100%" cellspacing="0" cellpadding="0" border="0">
                        <tr>
                            <th width="150px;">
                                <%=Tag("时间")%>
                            </th>
                            <th width="180px;">
                                <%=Tag("操作人")%>
                            </th>
                            <th >
                                <%=Tag("行为")%>
                            </th>
                        </tr>
                        <% 
                            foreach (Shop.Model.Lebi_Log log in Logs)
                            {    
                            
                        %>
                        <tr>
                            <td><%=log.Time_Add %></td>
                            <td>
                                <%
                                if(log.Admin_id>0)
                                    Response.Write("["+Tag("管理员")+"]"+log.AdminName);
                                if(log.User_id>0)
                                    Response.Write("["+Tag("会员")+"]"+log.UserName);
                                if (log.Supplier_id > 0)
                                    Response.Write("["+Tag("供应商")+"]"+log.Supplier_SubName);
                                %>
                            
                            </td>
                            <td><%=log.Content +" "+ log.Description%></td>
                        </tr>
                        <% } %>
                    </table>
                </div>
            </div>
        </div>
        
    </div>
</body>
</html>

  