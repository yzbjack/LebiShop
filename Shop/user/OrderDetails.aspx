﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.P_UserOrderDetails" validateRequest="false"%>


<%@ Import Namespace="Shop.Bussiness" %>
<%@ Import Namespace="Shop.Model" %>
<%@ Import Namespace="System.Collections.Generic" %>
<% LoadPage("ljq@lebi.cn_49",1,"CN","P_UserOrderDetails"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">


<title><%=ThemePageMeta("P_UserOrderDetails","title")%></title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Language" content="utf-8" />
<meta name="keywords" content="<%=ThemePageMeta("P_UserOrderDetails","keywords")%>" />
<meta name="description" content="<%=ThemePageMeta("P_UserOrderDetails","description")%>" />
<meta name="CurrenctCurrency" content="<%=CurrentCurrency.Code %>" />
<meta name="CurrenctCurrencyMsige" content="<%=CurrentCurrency.Msige %>" />
<meta name="CurrentExchangeRate" content="<%=CurrentCurrency.ExchangeRate %>" />
<meta name="CurrentLanguage" content="<%=CurrentLanguage.Code %>" />
<meta name="generator" content="LebiShop V<%=SYS.Version+"."+SYS.Version_Son %>" />
<meta name="copyright" content="2003-<%=DateTime.Now.Year %> lebi.cn" />
<link rel="shortcut icon" href="/theme/fashion_wewins/images/favicon.ico"/>
<link rel="bookmark" href="/theme/fashion_wewins/images/favicon.ico"/> 
<script type="text/javascript">
    var path = "<%=WebPath %>";
    var sitepath = "/";
    var langpath = "/";
</script>
<script src="/Theme/system/js/jquery-1.7.2.min.js" type="text/javascript"></script>

<script src="/theme/fashion_wewins/js/common.js" type="text/javascript"></script>
<script type="text/javascript" src="/theme/fashion_wewins/js/quick_links.js"></script>

<script src="/Theme/system/js/jquery-ui.min.js" type="text/javascript"></script>
<script src="/Theme/system/js/main.js" type="text/javascript"></script>
<script src="<%=WebPath %>/ajax/js.aspx" type="text/javascript"></script>
<script src="/Theme/system/js/my97DatePicker/WdatePicker.js" type="text/javascript"></script>
<script src="/Theme/system/js/msclass.js" type="text/javascript"></script>
<script src="/Theme/system/js/prettyphoto/jquery.prettyphoto.js" type="text/javascript"></script>
<script src="/theme/fashion_wewins/js/<%=CurrentLanguage.Code %>.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="/Theme/system/css/system.css" />
<link rel="stylesheet" type="text/css" href="/Theme/system/js/jqueryuicss/redmond/jquery-ui.css" />
<link rel="stylesheet" type="text/css" href="/Theme/system/js/prettyphoto/css/prettyPhoto.css" />
<link rel="stylesheet" type="text/css" href="/theme/fashion_wewins/css/css.css" />
<link rel="stylesheet" type="text/css" href="/theme/fashion_wewins/css/<%=CurrentLanguage.Code %>.css" />
<link rel="stylesheet" type="text/css" href="/theme/fashion_wewins/css/fashion.css" />
<script src="/theme/fashion_wewins/js/all-jquery.js" type="text/javascript"></script>
<script type="text/javascript">
    var bForcepc = fGetQuery("dv") == "pc";
    function fBrowserRedirect() {
        var sUserAgent = navigator.userAgent.toLowerCase();
        var bIsIphoneOs = sUserAgent.match(/iphone os/i) == "iphone os";
        var bIsMidp = sUserAgent.match(/midp/i) == "midp";
        var bIsUc7 = sUserAgent.match(/rv:1.2.3.4/i) == "rv:1.2.3.4";
        var bIsUc = sUserAgent.match(/ucweb/i) == "ucweb";
        var bIsAndroid = sUserAgent.match(/android/i) == "android";
        var bIsCE = sUserAgent.match(/windows ce/i) == "windows ce";
        var bIsWM = sUserAgent.match(/windows mobile/i) == "windows mobile";
        if (bIsIphoneOs || bIsAndroid) {
            var sUrl = location.href;
            if (!bForcepc) {
                window.location.href = "/wap/";
            }
        }
        if (bIsMidp || bIsUc7 || bIsUc || bIsCE || bIsWM) {
            var sUrl = location.href;
            if (!bForcepc) {
                window.location.href = "/wap/";
            }
        }
    }
    function fGetQuery(name) {//获取参数值
        var sUrl = window.location.search.substr(1);
        var r = sUrl.match(new RegExp("(^|&)" + name + "=([^&]*)(&|$)"));
        return (r == null ? null : unescape(r[2]));
    }
    fBrowserRedirect();
</script>


</head>
<body>

<div class="head">
    <div class="top">
        <div class="center clearfix">
            <ul class="sns">
                <span class="userstatus" id="userstatus"><a href="<%=URL("P_Register", "") %>"><%=Tag("免费注册")%></a> ┊ <a href="<%=URL("P_Login", "") %>"><%=Tag("登录")%></a></span>
            </ul>
            <div class="UserInfo">
                <a href="<%=URL("P_UserCenter","") %>">我的账号</a><span class="line"></span><a href="<%=URL("P_Basket","") %>">购物车</a><span class="line"></span>

<div class="language">
    <ul class="droplanguage">
        <li class="language_li"><a class="noclick"><span>网站语言：</span><s><%if (CurrentLanguage.ImageUrl!=""){%><img src="<%=Image(CurrentLanguage.ImageUrl) %>" /><%}%><%=CurrentLanguage.Name %></s></a><dl
            class="language_li_content">
            <%List<Shop.Model.Lebi_Language> WsDns=Languages();RecordCount=WsDns.Count;int WsDn_index=1;
foreach (Shop.Model.Lebi_Language WsDn in WsDns){%>
            <dd <%if (WsDn_index==RecordCount){%>class="last" <%} %>>
                <a href="javascript:SetLanguage(<%=WsDn.id%>,'<%=WsDn.Code%>','<%=WsDn.Path%>');"><%if (WsDn.ImageUrl!=""){%><img src="<%=Image(WsDn.ImageUrl) %>" /><%}%><%=WsDn.Name%></a></dd>
            <%WsDn_index++;}%>
        </dl>
        </li>
    </ul>
</div>

            </div>
        </div>
    </div>
    <script type="text/javascript">        LoadPage(path + '/inc/userstatus.aspx', 'userstatus');</script>
    <div class="head-main">
        <h1 class="logo">

<a href="/"><img src="<%=Image(Lang(SYS.Logoimg)) %>" alt="<%=Lang(SYS.Name)%>" title="<%=Lang(SYS.Name)%>" /></a>
</h1>
        <div class="search">
            

<script type="text/javascript">
    $(function () {
        blurInput('#keyword', '<%if (Rstring("Keyword")!=""){ %><%=Rstring("Keyword")%><%}else{%><%Table="Lebi_Searchkey";Where="Type=1";Order="Sort desc,id desc";PageSize=1;pageindex=1;RecordCount=B_Lebi_Searchkey.Counts(Where);int ahEn_index=1;
List<Lebi_Searchkey> ahEns = B_Lebi_Searchkey.GetList(Where, Order,PageSize ,pageindex);foreach (Lebi_Searchkey ahEn in ahEns){%><%=Lang(ahEn.Name)%><%ahEn_index++;}%><%} %>');
        $(".searchform .button").click(function(){
            var typename = $('#searchtype').attr('typename');
            var url = "";
            if (typename=="product")
            {
                var url = "<%=URL("P_Search","[key]") %>";
            }
            if (typename=="shop")
            {
                url = "<%=URL("P_ShopSearch","[key]") %>";
            }
            location.href = url.replace("[key]",escape($("#keyword").val()));
            return false;
        });
        $(".searchform dd a").click(function(){
            $(".searchform dl span").text($(this).text());
            $(".searchform dl span").attr("typename",$(this).attr("typename"));
            $(".searchform dd").hide();
        });
        $(".searchform-type").hover(function () {
            $(".searchform dd").show();
        }, function () {
            $(".searchform dd").hide();
        });
    });		
</script>
<div class="searchform">
<div class="searchform-type">
<dl>
    <dt><span id="searchtype" typename="product">商品</span><em class="ico-jtb"></em></dt>
    <dd>
        <a typename="product" href="javascript:void(0)">商品</a>
        <%if (Shop.LebiAPI.Service.Instanse.Check("plugin_gongyingshang")){ %>
        <a typename="shop" href="javascript:void(0)">店铺</a>
        <%}%>
    </dd>
</dl>
</div>
<input id="keyword" value="" type="text" name="keyword" onfocus="if (this.value != '') {this.value = '';}" />
<input type="button" value="搜索" class="button" />
</div>

            

<div class="searchkeyword">
<%Table="Lebi_Searchkey";Where="";Order="Sort desc,id desc";PageSize=5;pageindex=1;RecordCount=B_Lebi_Searchkey.Counts(Where);int YAOo_index=1;
List<Lebi_Searchkey> YAOos = B_Lebi_Searchkey.GetList(Where, Order,PageSize ,pageindex);foreach (Lebi_Searchkey YAOo in YAOos){%>
<%if (YAOo.Type==1){ %><a href="<%=URL("P_Search",""+Lang(YAOo.Name)+"") %>"><%}else{ %><a href="<%=YAOo.URL%>" target="_blank"><%} %><span><%=Lang(YAOo.Name)%></span></a>
<%YAOo_index++;}%>
</div>

        </div>
    </div>
</div>
  <div class="mainNav">
    <div class="mainNav-con">
      <div class="allnav">
        <h2 class="title">
          <a href="<%=URL("P_AllProductCategories", "")%>">全部商品分类</a><i class="title-icon"></i>
        </h2>
        <div class="allnav-show">
          <ul id="nav">
            <%
                        int ic0=0;
            foreach(Lebi_Pro_Type c0 in EX_Product.ShowTypes(0,CurrentSite.id))
            {
            ic0++;
            if(ic0>11)
            continue;
            %>
            <li id="mainCate-1" class="mainCate">
                <h3>
                    <i class="nav-icon">
                        <%if(c0.ImageSmall!=""){ %>
                        <img src="<%=c0.ImageSmall %>" alt="<%=Lang(c0.Name) %>" style="width:18px;height:18px;" /><%} %>
                    </i><a href="<%=URL(" P_ProductCategory",""+c0.id+"") %>"><%=Lang(c0.Name) %></a>
                </h3>
                <div class="subCate">
                    <div class="menu-brand-lists">
                        <div class="menu-classify">
                            <div class="menu-classify-part">
                                <div class="menu-classify-mode">
                                    <%
                                    int ic1=0;
                                    foreach(Lebi_Pro_Type c1 in EX_Product.ShowTypes(c0.id,CurrentSite.id))
                                    {
                                    %>
                                    <div class="menu-classify-mode-title"><a target="_blank" href="<%=URL(" P_ProductCategory",""+c1.id+"") %>"><%=Lang(c1.Name) %></a></div>
                                    <ul>
                                        <%
                                        int ic2=0;
                                        foreach(Lebi_Pro_Type c2 in EX_Product.ShowTypes(c1.id,CurrentSite.id))
                                        {
                                        %>
                                        <li>
                                            <a target="_blank" href="<%=URL(" P_ProductCategory",""+c2.id+"") %>"><%=Lang(c2.Name) %></a>
                                        </li>
                                        <%} %>
                                    </ul>
                                    <%} %>
                                </div>
                            </div>
                            <div class="menu-classify-part right">
                                <div class="menu-classify-mode">
                                    <div class="menu-classify-mode-title right"><a>热门品牌</a></div>
                                    <ul class="brand-ul">
                                        <%Table="Lebi_Brand";Where="Type_id_BrandStatus = 452 and ','+Pro_Type_id+',' like '%,"+c0.id+",%'";Order="Sort desc";PageSize=16;pageindex=1;RecordCount=B_Lebi_Brand.Counts(Where);int YLte_index=1;
List<Lebi_Brand> YLtes = B_Lebi_Brand.GetList(Where, Order,PageSize ,pageindex);foreach (Lebi_Brand YLte in YLtes){%>
                                            <li class="brand-box first"><a target="_blank" href="<%=URL("P_Brand",YLte.id)%>"><img alt="<%=Lang(YLte.Name) %>" src="<%=Image(YLte.ImageUrl) %>"><span><%=Lang(YLte.Name) %></span></a></li>
                                        <%YLte_index++;}%> 
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
</li>
            <%} %>
          </ul>
        </div>
      </div>
      
      <div class="other-menu">
		

<%Table="Lebi_Page";Where="Node_id="+Node("HeadMenu").id+" and ','+Language_ids+',' like '%," + CurrentLanguage.id + ",%'";Order="Sort desc";PageSize=10;pageindex=1;RecordCount=B_Lebi_Page.Counts(Where);int JLvO_index=1;
List<Lebi_Page> JLvOs = B_Lebi_Page.GetList(Where, Order,PageSize ,pageindex);foreach (Lebi_Page JLvO in JLvOs){%>
<a class="menu" href="<%=URL("","",JLvO.url)%>"><span><%=JLvO.Name%></span></a>
<%JLvO_index++;}%>

        
      </div>
    </div>
  </div>
<script type="text/javascript">
$(document).ready(function(){
$('.allnav').mousemove(function(){
$(this).find('.allnav-show').slideDown("1000");//you can give it a speed
});
$('.allnav').mouseleave(function(){
$(this).find('.allnav-show').slideUp("fast");
});
});
jQuery("#nav").slide({
type:"menu", //效果类型
titCell:".mainCate", // 鼠标触发对象
targetCell:".subCate", // 效果对象，必须被titCell包含
delayTime:0, // 效果时间
triggerTime:0, //鼠标延迟触发时间
defaultPlay:false,//默认执行
returnDefault:true//返回默认
});
$(document).ready(function(){
$('.allnav').mousemove(function(){
$(this).find('.allnav-show').slideDown("1000");//you can give it a speed
});
$('.allnav').mouseleave(function(){
$(this).find('.allnav-show').slideUp("fast");
});
});
</script>

<div class="body clearfix">
  <div class="location"><div class="path"><%=path%></div></div>
  
    

<div id="orderstate">
    <div class="mt">
        <div class="left">
            <strong>订单编号：<%=order.Code %>&nbsp;&nbsp;&nbsp;&nbsp;状态：<span class="ftx14"><%=Shop.Bussiness.Order.OrderStatus(order, CurrentLanguage.Code) %></span></strong>
        </div>
        <div class="right">
            <div class="toolbar">
                <%if(Shop.Bussiness.Order.CancelOrder(order)){ %><a href="javascript:void(0)" onclick="OrderCancal(<%=order.id %>);" class="btn btn-11"><s></s>取消</a><%} %>
                <%if(order.OnlinePay_id>0 && order.IsPaid!=1 && pay.Code=="OnlinePay" && order.IsInvalid==0){ %><a href="javascript:void(0)" onclick="window.open('<%=URL("P_Pay",order.id)%>');" class="btn btn-7"><s></s>立即付款</a><%} %>
            </div>
        </div>
    </div>
    <%if(order.IsCompleted==0){ %>
        <div class="mm">
    <%}else{ %>
        <div class="mc">
    <%} %>
    <%foreach (Shop.Model.Lebi_Comment m in comments){%>
    <div>
        <span style="color: #dddddd"><%=FormatTime(m.Time_Add) %></span> <%=m.User_UserName%><%=m.Admin_UserName%>：<%=m.Content%>
    </div>
    <%} %>
    </div>
    <%if(order.IsCompleted==0){ %>
    <div class="mc">
        <input type="text" id="comment" style="width:400px" class="input" />
        <a href="javascript:void(0)" onclick="submitcomment(<%=order.id %>);" class="btn btn-11"><s></s>留言</a>
    </div>
    <%} %>
</div>
<%foreach (Shop.Model.Lebi_Transport_Order t in transport_orders){%>
<%if (t != null){ %>
<div id="ordertrack" class="clearfix">
    <div class="mt"><strong>订单追踪</strong></div>
    <div class="mc tabcon">
        <table width="100%" cellspacing="0" cellpadding="0">
            <tbody id="tbody_track">
                <tr>
                    <th colspan="2" style="text-align: left; height: 30px;">
                        <%=t.Transport_Name %> 运单号：<%=t.Code %> 状态：<%=TypeName(t.Type_id_TransportOrderStatus) %>
                        <%if(t.Type_id_TransportOrderStatus==220){ %>
                        <a href="javascript:void(0)" onclick="Received(<%=order.id%>,<%=t.id %>);" class="btn btn-11"><s></s>确认收货</a>
                        <%} %>
                    </th>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="p-list">
                            <table width="100%" cellspacing="0" cellpadding="0">
                                <tbody>
                                    <tr>
                                        <th style="width:100px">商品编号</th>
                                        <th>商品名称</th>
                                        <th style="width:100px">规格</th>
                                        <th style="width:100px">发货数量</th>
                                    </tr>
                                    <%foreach (Shop.Model.TransportProduct tp in Shop.Bussiness.EX_Area.GetTransportProduct(t))
                                        { %>
                                    <tr>
                                        <td><%=tp.Product_Number %></td>
                                        <td style="text-align:left"><a href="<%=URL("P_Product",tp.Product_id) %>" target="_blank"><%=Lang(tp.Product_Name) %></a></td>
                                        <td><%=Shop.Bussiness.EX_Product.ProPertyNameStr(Shop.Bussiness.EX_Product.GetProduct(tp.Product_id), CurrentLanguage.Code)%></td>
                                        <td><%=tp.Count %></td>
                                    </tr>
                                    <%} %>
                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
                <%
                    Shop.Model.KuaiDi100 log = Shop.Bussiness.EX_Area.GetKuaiDi100(t);
                    if (log.message == "ok")
                    {
                        foreach (Shop.Model.KuaiDi100.KuaiDi100data d in log.data)
                        { %>
                <tr>
                    <td width="15%"><%=d.time%></td>
                    <td><%=d.context%></td>
                </tr>
                <%}
                    }
                    else
                    { %>
                    <tr>
                    <td colspan="2" align="center">
                    <%if(t.HtmlLog.IndexOf("http://")==0){ %>
                    <iframe name="kuaidi100" src="<%=t.HtmlLog %>" width="650" height="400" marginwidth="0" marginheight="0" frameborder="0"></iframe>
                    <%} %>
                    </td></tr>
                    <%} %>
            </tbody>
        </table>
    </div>
</div>
<%} %>
<%} %>
<div id="orderinfo" class="clearfix">
    <div class="mt"><strong>订单信息</strong></div>
    <div class="mc">
        <dl class="fore clearfix">
            <dd>
                <ul>
                    <li>订购时间：<%=FormatTime(order.Time_Add) %></li>
                </ul>
            </dd>
        </dl>
        <dl>
            <dt>收货人信息</dt>
            <dd>
                <ul>
                    <li>收货人：<%=order.T_Name %></li>
                    <li>地址：<%=Shop.Bussiness.EX_Area.GetAreaName(order.T_Area_id)%> <%=order.T_Address %></li>
                    <li>固定电话：<%=order.T_Phone %></li>
                    <li>手机号码：<%=order.T_MobilePhone %></li>
                    <li>电子邮件：<%=order.T_Email %></li>
                </ul>
            </dd>
        </dl>
        <dl>
            <dt>支付及配送方式</dt>
            <dd>
                <ul>
                    <%if (order.Pay_id > 0){%>
                        <li>支付方式：<%=Lang(order.Pay) %>
                            <%if (order.OnlinePay_id > 0){%>
                                <%=Lang(order.OnlinePay)%>
                            <%}%>
                        </li>
                        <li class="tips"><%=Lang(pay.Description)%></li>
                    <%}else{%>
                        <li>支付方式：<%=Lang(order.Pay) %></li>
                    <%}%>
                    <li>配送方式：<%=order.Transport_Name %></li>
                    <%if(order.PickUp_id>0){ %>
                    <li>自提点：<%=order.PickUp_Name %></li>
                    <li>自提时间：<span id="pickupdateshow"><%=order.PickUp_Date.ToString("yyyy-MM-dd") %></span><input type="hidden" id="pickupdate_<%=order.PickUp_id %>" name="pickupdate_<%=order.PickUp_id %>" value="<%=order.PickUp_Date.ToString("yyyy-MM-dd") %>" order="true" size="12" class="input-calendar" readonly />
                    <a href="javascript:void(0);" onclick="changepickupdate(<%=order.PickUp_id %>);" >修改</a></li>
                    <%} %>
                </ul>
            </dd>
        </dl>
        <%if (SYS.BillFlag == "1"){ %>
        <dl>
            <dt>发票信息</dt>
            <dd>
                <ul>
                    <li>发票类型：<%=Lang(order.BillType_Name) %></li>
                    <%foreach (Shop.Model.Lebi_Bill b in bills){%>
                    <%if(b.Type_id_BillType==151){ %>
                    <li>发票内容：<%=b.Content%></li>
                    <li>发票抬头：<%=b.Title%></li>
                    <%}else{ %>
                    <li>单位名称：<%=b.Company_Name%></li>
                    <li>纳税人识别号：<%=b.Company_Code%></li>
                    <li>注册地址：<%=b.Company_Address%></li>
                    <li>注册电话：<%=b.Company_Phone%></li>
                    <li>开户银行：<%=b.Company_Bank%></li>
                    <li>银行帐户：<%=b.Company_Bank_User%></li>
                    <%} %>
                    <%} %>
                </ul>
            </dd>
        </dl>
       <%} %>
        <%if (Shop.Bussiness.EX_Supplier.GetSupplier(order.Supplier_id).IsSupplierTransport==1){ %>
        <dl>
            <dt>商家名称</dt>
            <dd>
                <ul>
                    <li><a href="<%=URL("P_ShopIndex",order.Supplier_id) %>"><%=Lang(Shop.Bussiness.EX_Supplier.GetSupplier(order.Supplier_id).Name)%></a></li>
                </ul>
            </dd>
        </dl>
        <%} %>
        <%if (order.Refund_VAT > 0){ %>
        <dl>
            <dt>退税信息</dt>
            <dd>
                <ul>
                    <li>所含税额：<%=FormatMoney(order.Refund_VAT)%></li>
                    <li>退税手续费：<%=FormatMoney(order.Refund_Fee)%></li>
                    <li>退税总额：<%=FormatMoney(order.Refund_VAT - order.Refund_Fee)%></li>
                </ul>
            </dd>
        </dl>
       <%} %>
        <dl>
            <dt>订单清单</dt>
            <dd class="p-list">
                <table width="100%" cellspacing="0" cellpadding="0">
                    <tbody>
                        <tr>
                            <th style="width:100px">商品编号</th>
                            <th>商品名称</th>
                            <th style="width:100px">规格</th>
                            <th style="width:100px">价格</th>
                            <th style="width:100px">订购数量</th>
                            <th style="width:100px">发货数量</th>
                            <th style="width:150px">操作</th>
                        </tr>
                        <%foreach (Shop.Model.Lebi_Order_Product o_p in order_products){%>
                        <tr>
                            <td><%=o_p.Product_Number %></td>
                            <td style="text-align:left">
                            <img src="<%=Image(o_p.ImageOriginal,50,50) %>" style="height:30px;padding:3px 0" />
                            <%if(o_p.Type_id_OrderProductType==252){Response.Write("["+Tag("赠品")+"]");} %><a href="<%=URL("P_Product",o_p.Product_id) %>" target="_blank"><%=Lang(o_p.Product_Name) %></a></td>
                            <td><%if (o_p.ProPerty134!=""){ %><%=o_p.ProPerty134%><br /><%} %><%=Shop.Bussiness.EX_Product.ProPertyNameStr(Shop.Bussiness.EX_Product.GetProduct(o_p.Product_id), CurrentLanguage.Code)%></td>
                            <td>
                            <%
                                if(o_p.Type_id_OrderProductType==255)
                                    Response.Write(Tag("积分")+":"+o_p.Point_Buy_one);
                                else if(o_p.Type_id_OrderProductType==252)
                                    Response.Write(FormatMoney(0));
                                else
                                    Response.Write(FormatMoney(o_p.Price));
                            %>
                            
                            </td>
                            <td><%=o_p.Count%></td>
                            <td><%=o_p.Count_Shipped%></td>
                            <td>
                                <%if(order.IsReceived==1 && SYS.IsClosetuihuo=="0"){ %>
                                <a target="_blank" href="<%=URL("P_UserReturnApply",o_p.Order_id)%>">退货</a><br />
                                <%} %>
                                <a href="javascript:void(0);" onclick="AddOftenBuy(<%=o_p.Product_id %>,<%=o_p.Count %>,'<%=o_p.ProPerty134 %>')">加入常购清单</a>
                            </td>
                        </tr>
                        <%} %>
                    </tbody>
                </table>
            </dd>
        </dl>
    </div>
    <div class="total">
        <ul>
            <li><strong>商品总额：</strong><%=FormatMoney(order.Money_Product) %></li>
            <%if(order.Money_Transport!=0){ %><li><strong>+ 运费：</strong><%=FormatMoney(order.Money_Transport) %></li><%} %>
            <%if(order.Money_Bill>0){ %><li><strong>+ 发票税金：</strong><%=FormatMoney(order.Money_Bill) %></li><%} %>
            <%if(order.Money_Tax>0){ %><li><strong>+ 税金：</strong><%=FormatMoney(order.Money_Tax) %></li><%} %>
            <%if(order.Money_Property>0){ %><li><strong>+ 其它费用：</strong><%=FormatMoney(order.Money_Property) %></li><%} %>
            <%if(order.Money_UseCard311>0 || order.Money_UseCard312>0){ %>
                <li><strong>- 卡券支付：</strong><%=FormatMoney(order.Money_UseCard312+order.Money_UseCard311) %></li>
            <%} %>
            <%if(order.Money_Cut>0){ %><li><strong>- 优惠：</strong><%=FormatMoney(order.Money_Cut) %></li><%} %>
            <%if (order.Money_UserCut > 0){ %><li><strong>- 使用余额：</strong><%=FormatMoney(order.Money_UserCut)%></li><%} %>
        </ul>
        <span class="clear"></span>
        <div class="extra">
            应付金额：<span class="red"><b><%=FormatMoney(order.Money_Pay)%></b></span></div>
    </div>
</div>
<script type="text/javascript">
    function Received(id,tid) {
        if (!confirm("请确认操作？"))
            return false;
        var url = path+"/ajax/ajax_order.aspx?__Action=Received&id=" + id+"&tid="+tid;
        RequestAjax(url, "", function () { MsgBox(1, "操作成功", "?") });
    }
    function submitcomment(order_id) {
        var comment = $("#comment").val();
        if (comment == "") {
            MsgBox(2, "请填写留言内容", "");
            return false;
        }
        var postData = { "comment": comment, "order_id": order_id };
        var url = path+"/ajax/ajax_order.aspx?__Action=OrderComment_Edit";
        RequestAjax(url, postData, function () { MsgBox(1, "操作成功", "?") });
    }
    function OrderCancel(id) {
        var url = "<%=URL("P_UserOrderCancel","[id]") %>";
        var title_ = Tag("取消订单");
        var url_ = url.replace("[id]",id);
        var width_ = 400;
        var height_ = 200;
        var modal_ = true;
        var div_ = "div_window";
        EditWindow(title_, url_, width_, height_, modal_, div_);
    }
    function changepickupdate(pickid){
            var title_ = "<%=Tag("选择日期")%>";
            var url_ = "<%=WebPath%>/inc/selectpickupdate.aspx?pickupid=" + pickid+"&selectedday=<%=order.PickUp_Date.ToString("yyyy-MM-dd") %>&callback=changepickupdateOK";
            var width_ = 630;
            var height_ = 700;
            var modal_ = true;
            EditWindow(title_, url_, width_, height_, modal_,'selectdatewindow');
    }
    function changepickupdateOK()
    {
        $('#selectdatewindow').dialog('close');
        var pickupdate=$("#pickupdate_<%=order.PickUp_id %>").val();
        $('#pickupdateshow').html(pickupdate);
        var postData = { "orderid": <%=order.id %>, "pickupdate": pickupdate };
        var url = path+"/ajax/ajax_order.aspx?__Action=OrderPickUpDate_Edit";
        RequestAjax(url, postData, function () { MsgBox(1, "操作成功", "?") });
    }
</script>


</div>

<div class="footer">
    <%=Lang(SYS.FootHtml) %>
</div>
<div class="copyright">
    <%=Lang(SYS.Copyright) %>
    <%=GetCNZZ() %>
</div>




<link rel="stylesheet" type="text/css" href="/Theme/system/js/sidebar/base.css" />
<script type="text/javascript" src="/Theme/system/js/sidebar/sidebar.js"></script>
<div class="mui-mbar-tabs">
	<div class="quick_link_mian">
		<div class="quick_links_panel">
			<div id="quick_links" class="quick_links">
				<li>
					<a href="javascript:void(0);" class="ico_account"><i class="i_ico_account"></i></a>
					<div class="ibar_login_box status_login">
						<div class="avatar_box">
							<p class="avatar_imgbox">
                                <%if(CurrentUser.Face.Trim()!=""){ %>
                                <img src="<%=CurrentUser.Face %>" />
                                <%}else{ %>
                                <img src="/Theme/system/js/sidebar/no-img_mid_.jpg" />
                                <%} %>
                            </p>
							<ul class="user_info">
								<li><%=Tag("用户名") %>：<%=Shop.Bussiness.EX_User.LoginStatus()?CurrentUser.UserName:Tag("未登录") %></li>
								<li><%=Tag("级别") %>：<%=Lang(CurrentUserLevel.Name) %></li>
							</ul>
						</div>
						<div class="login_btnbox">
                            <%if(Shop.Bussiness.EX_User.LoginStatus()){ %>
							<a href="<%=URL("P_UserOrders","") %>" class="login_order"><%=Tag("我的订单") %></a>
							<a href="<%=URL("P_UserLike","")%>" class="login_favorite"><%=Tag("我的收藏") %></a>
                            <%}else{ %>
                            <a href="<%=URL("P_Login","") %>" class="login_order"><%=Tag("登录") %></a>
							<a href="<%=URL("P_Register","")%>" class="login_favorite"><%=Tag("注册") %></a>
                            <%} %>
						</div>
						<i class="icon_arrow_white"></i>
					</div>
				</li>
				<li id="shopCart">
					<a href="<%=URL("P_Basket", "") %>" class="ico_basket" ><i class="i_ico_basket"></i><div class="span"><%=Tag("购物车") %></div><span class="cart_num"><%=Basket_Product_Count() %></span></a>
				</li>
				<li>
					<a class="ico_history"><i class="i_ico_history"></i></a>
					<div class="mp_tooltip"><%=Tag("我的足迹") %><i class="icon_arrow_right_black"></i></div>
				</li>
				<li>
					<a href="<%=URL("P_UserLike", "") %>" class="ico_like"><i class="i_ico_like"></i></a>
					<div class="mp_tooltip"><%=Tag("我的收藏") %><i class="icon_arrow_right_black"></i></div>
				</li>
			</div>
			<div class="quick_toggle">
				<li>
					<a href="<%=URL("P_Help","") %>" class="ico_service"><i class="i_ico_service"></i></a>
					<div class="mp_service" style="display:none;">
                        <div class="servicepannel">
                        <%Table="Lebi_ServicePanel_Group";Where="Supplier_id = 0 and ','+Language_ids+',' like '%,"+ CurrentLanguage.id + ",%'";Order="Sort desc";PageSize=20;pageindex=Rint("page");RecordCount=B_Lebi_ServicePanel_Group.Counts(Where);int siderbargroup_index=1;
List<Lebi_ServicePanel_Group> siderbargroups = B_Lebi_ServicePanel_Group.GetList(Where, Order,PageSize ,pageindex);foreach (Lebi_ServicePanel_Group siderbargroup in siderbargroups){%>
                            <ul class="group clearfix"><li>
                            <h2><%=siderbargroup.Name%></h2>
                            <ul class="group-user clearfix">
                            <%Table="Lebi_ServicePanel";Where="Supplier_id = 0 and ServicePanel_Group_id = "+siderbargroup.id+" and ','+Language_ids+',' like '%,"+ CurrentLanguage.id + ",%'";Order="Sort desc,id desc";PageSize=20;pageindex=Rint("page");RecordCount=B_Lebi_ServicePanel.Counts(Where);int buser_index=1;
List<Lebi_ServicePanel> busers = B_Lebi_ServicePanel.GetList(Where, Order,PageSize ,pageindex);foreach (Lebi_ServicePanel buser in busers){%>
                            <%
                                string url = GetServicePanelType(buser.ServicePanel_Type_id).Url;
                                url = url.Replace("{@uid}",buser.Account);
                                url = url.Replace("{@uname}",buser.Name);
                            %>
                            <li><a target="blank" href="<%=url%>"><img src="<%if (GetServicePanelType(buser.ServicePanel_Type_id).IsOnline == 1){
                                Response.Write(GetServicePanelType(buser.ServicePanel_Type_id).Code.Replace("{@uid}",buser.Account));
                            }else{
                                Response.Write(Image(GetServicePanelType(buser.ServicePanel_Type_id).Face));
                            }%>" border="0" align="absmiddle" />&nbsp;<%=buser.Name%></a></li>
                            <%buser_index++;}%>
                            </ul>
                            </li></ul>
                            <%siderbargroup_index++;}%>
                        </div>
                        <i class="icon_arrow_white"></i>

                    </div>
				</li>
				<li id="mp_qrcode">
					<a href="#none" class="ico_qrcode"><i class="i_ico_qrcode"></i></a>
					<div class="mp_qrcode" style="display:none;"><img src="<%=SYS.platform_weixin_image_qrcode%>" width="150" height="150" /><i class="icon_arrow_white"></i></div>
				</li>
				<li><a href="#top" class="return_top"><i class="top"></i></a></li>
			</div>
		</div>
		<div id="quick_links_pop" class="quick_links_pop hide"></div>
	</div>
</div>

<script type="text/javascript" src="/Theme/system/js/sidebar/parabola.js"></script>
<script type="text/javascript">
    $(".quick_links_panel li").mouseenter(function () {
        $(this).children(".mp_tooltip").animate({ left: -92, queue: true });
        $(this).children(".mp_tooltip").css("visibility", "visible");
        $(this).children(".ibar_login_box").css("display", "block");
    });
    $(".quick_links_panel li").mouseleave(function () {
        $(this).children(".mp_tooltip").css("visibility", "hidden");
        $(this).children(".mp_tooltip").animate({ left: -121, queue: true });
        $(this).children(".ibar_login_box").css("display", "none");
    });
    $(".quick_toggle li:first").mouseover(function () {
        $(".mp_service").show();
    });
    $(".quick_toggle li:first").mouseleave(function () {
        $(".mp_service").hide();
    });
    $(".quick_toggle li#mp_qrcode").mouseover(function () {
        $(".mp_qrcode").show();
    });
    $(".quick_toggle li#mp_qrcode").mouseleave(function () {
        $(".mp_qrcode").hide();
    });
</script>

</body>
</html><div style="width:100%;text-align:center;font-size:12px;color:#999">Powered by <a style="font-size:12px;color:#00497f" href="http://www.lebi.cn/support/license/?url=localhost,,,,,,,,,,,,,,,,,,,,,,,,,,,,," target="_blank" title="LebiShop多语言网店系统">LebiShop</a> V<%=SYS.Version%>.<%=SYS.Version_Son%></div>