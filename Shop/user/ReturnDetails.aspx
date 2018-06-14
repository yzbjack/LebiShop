﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.P_UserReturnDetails" validateRequest="false"%>


<%@ Import Namespace="Shop.Bussiness" %>
<%@ Import Namespace="Shop.Model" %>
<%@ Import Namespace="System.Collections.Generic" %>
<% LoadPage("ljq@lebi.cn_49",1,"CN","P_UserReturnDetails"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">


<title><%=ThemePageMeta("P_UserReturnDetails","title")%></title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Language" content="utf-8" />
<meta name="keywords" content="<%=ThemePageMeta("P_UserReturnDetails","keywords")%>" />
<meta name="description" content="<%=ThemePageMeta("P_UserReturnDetails","description")%>" />
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
            <%List<Shop.Model.Lebi_Language> hRbgs=Languages();RecordCount=hRbgs.Count;int hRbg_index=1;
foreach (Shop.Model.Lebi_Language hRbg in hRbgs){%>
            <dd <%if (hRbg_index==RecordCount){%>class="last" <%} %>>
                <a href="javascript:SetLanguage(<%=hRbg.id%>,'<%=hRbg.Code%>','<%=hRbg.Path%>');"><%if (hRbg.ImageUrl!=""){%><img src="<%=Image(hRbg.ImageUrl) %>" /><%}%><%=hRbg.Name%></a></dd>
            <%hRbg_index++;}%>
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
        blurInput('#keyword', '<%if (Rstring("Keyword")!=""){ %><%=Rstring("Keyword")%><%}else{%><%Table="Lebi_Searchkey";Where="Type=1";Order="Sort desc,id desc";PageSize=1;pageindex=1;RecordCount=B_Lebi_Searchkey.Counts(Where);int NRlB_index=1;
List<Lebi_Searchkey> NRlBs = B_Lebi_Searchkey.GetList(Where, Order,PageSize ,pageindex);foreach (Lebi_Searchkey NRlB in NRlBs){%><%=Lang(NRlB.Name)%><%NRlB_index++;}%><%} %>');
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
<%Table="Lebi_Searchkey";Where="";Order="Sort desc,id desc";PageSize=5;pageindex=1;RecordCount=B_Lebi_Searchkey.Counts(Where);int QJfw_index=1;
List<Lebi_Searchkey> QJfws = B_Lebi_Searchkey.GetList(Where, Order,PageSize ,pageindex);foreach (Lebi_Searchkey QJfw in QJfws){%>
<%if (QJfw.Type==1){ %><a href="<%=URL("P_Search",""+Lang(QJfw.Name)+"") %>"><%}else{ %><a href="<%=QJfw.URL%>" target="_blank"><%} %><span><%=Lang(QJfw.Name)%></span></a>
<%QJfw_index++;}%>
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
                                        <%Table="Lebi_Brand";Where="Type_id_BrandStatus = 452 and ','+Pro_Type_id+',' like '%,"+c0.id+",%'";Order="Sort desc";PageSize=16;pageindex=1;RecordCount=B_Lebi_Brand.Counts(Where);int CBUz_index=1;
List<Lebi_Brand> CBUzs = B_Lebi_Brand.GetList(Where, Order,PageSize ,pageindex);foreach (Lebi_Brand CBUz in CBUzs){%>
                                            <li class="brand-box first"><a target="_blank" href="<%=URL("P_Brand",CBUz.id)%>"><img alt="<%=Lang(CBUz.Name) %>" src="<%=Image(CBUz.ImageUrl) %>"><span><%=Lang(CBUz.Name) %></span></a></li>
                                        <%CBUz_index++;}%> 
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
		

<%Table="Lebi_Page";Where="Node_id="+Node("HeadMenu").id+" and ','+Language_ids+',' like '%," + CurrentLanguage.id + ",%'";Order="Sort desc";PageSize=10;pageindex=1;RecordCount=B_Lebi_Page.Counts(Where);int AyYf_index=1;
List<Lebi_Page> AyYfs = B_Lebi_Page.GetList(Where, Order,PageSize ,pageindex);foreach (Lebi_Page AyYf in AyYfs){%>
<a class="menu" href="<%=URL("","",AyYf.url)%>"><span><%=AyYf.Name%></span></a>
<%AyYf_index++;}%>

        
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
            <strong>订单编号：<%=order.Code %>&nbsp;&nbsp;&nbsp;&nbsp;状态：<span class="ftx14"><%=ReturnStatus(order)%></span></strong>
        </div>
        <div class="right">
            <div class="toolbar">
            </div>
        </div>
    </div>
    <%if(order.IsCompleted==0){ %>
    <div class="mm">
        <%}else{ %>
        <div class="mc">
            <%} %>
            <%foreach (Shop.Model.Lebi_Comment c in comments){%>
            <div>
                <span style="color: #dddddd"><%=c.Time_Add %></span> <%=c.User_UserName%><%=c.Admin_UserName%> : <%=c.Content%>
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
    <div id="orderinfo" class="clearfix">
        <div class="mt"><strong>订单信息</strong></div>
        <div class="mc">
            <dl class="fore clearfix">
                <dt>货运信息</dt>
                <%foreach (Shop.Model.Lebi_Transport_Order t_o in transport_orders){%>
                <dd>
                    <ul>
                        <li>快递公司：<%=t_o.Transport_Name %></li>
                        <li>运单号：<%=t_o.Code %></li>
                        <li>状态：<%=TypeName(t_o.Type_id_TransportOrderStatus) %></li>
                    </ul>
                </dd>
                <%foreach (Shop.Model.KuaiDi100.KuaiDi100data d in Shop.Bussiness.EX_Area.GetKuaiDi100(t_o).data){ %>
                <dd>
                    <ul>
                    <li><%=d.time %></li>
                    <li><%=d.context %></li>
                    </ul>
                </dd>
                <%} %>
                <%} %>
            </dl>
            <dl class="fore clearfix">
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
                        <li>支付方式：<%=Lang(order.Pay) %></li>
                        <li>配送方式：<%=order.Transport_Name %></li>
                    </ul>
                </dd>
            </dl>
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
            <dl>
                <dt>订单清单</dt>
                <dd class="p-list">
                    <table width="100%" cellspacing="0" cellpadding="0">
                        <tbody>
                            <tr>
                                <th style="width:100px">商品编号</th>
                                <th>商品名称</th>
                                <th style="width:100px">价格</th>
                                <th style="width:100px">数量</th>
                            </tr>
                            <%foreach (Shop.Model.Lebi_Order_Product op in order_products){%>
                            <tr>
                                <td><%=op.Product_Number %></td>
                                <td style="text-align:left"><%if(op.Type_id_OrderProductType==252){Response.Write("["+Tag("赠品")+"]");} %><a href="<%=URL("P_Product",op.Product_id) %>" target="_blank"><%=Lang(op.Product_Name) %></a></td>
                                <td><%=FormatMoney(op.Price) %></td>
                                <td><%=op.Count%></td>
                            </tr>
                            <%} %>
                        </tbody>
                    </table>
                </dd>
            </dl>
        </div>
        <div class="total">
            <ul>
                <li><span>商品总额：</span><%=FormatMoney(order.Money_Product) %></li>
                <li><span>+ 运费：</span><%=FormatMoney(order.Money_Transport) %></li>
                <li><span>+ 税金：</span><%=FormatMoney(order.Money_Bill) %></li>
            </ul>
            <span class="clear"></span>
            <div class="extra">
                退款金额：<span class="red"><b><%=FormatMoney(order.Money_Give) %></b></span></div>
        </div>
    </div>
</div>
<script type="text/javascript">
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