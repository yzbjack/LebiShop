﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.P_ShopIndex" validateRequest="false"%>


<%@ Import Namespace="Shop.Bussiness" %>
<%@ Import Namespace="Shop.Model" %>
<%@ Import Namespace="System.Collections.Generic" %>
<% LoadPage("ljq@lebi.cn_49",1,"CN","P_ShopIndex"); %>

<!DOCTYPE html PUBliC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>


<title><%=ThemePageMeta("P_ShopIndex","title")%></title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Language" content="utf-8" />
<meta name="keywords" content="<%=ThemePageMeta("P_ShopIndex","keywords")%>" />
<meta name="description" content="<%=ThemePageMeta("P_ShopIndex","description")%>" />
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
 

<script type="text/javascript">
    function AddFavorite(sURL, sTitle) {
        try {
            window.external.addFavorite(sURL, sTitle);
        }
        catch (e) {
            try {
                window.sidebar.addPanel(sTitle, sURL, "");
            }
            catch (e) {
                alert("加入收藏失败，请使用Ctrl+D进行添加");
            }
        }
    }
</script>

</head>
<body id="shop">

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
            <%List<Shop.Model.Lebi_Language> AkMLs=Languages();RecordCount=AkMLs.Count;int AkML_index=1;
foreach (Shop.Model.Lebi_Language AkML in AkMLs){%>
            <dd <%if (AkML_index==RecordCount){%>class="last" <%} %>>
                <a href="javascript:SetLanguage(<%=AkML.id%>,'<%=AkML.Code%>','<%=AkML.Path%>');"><%if (AkML.ImageUrl!=""){%><img src="<%=Image(AkML.ImageUrl) %>" /><%}%><%=AkML.Name%></a></dd>
            <%AkML_index++;}%>
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
        blurInput('#keyword', '<%if (Rstring("Keyword")!=""){ %><%=Rstring("Keyword")%><%}else{%><%Table="Lebi_Searchkey";Where="Type=1";Order="Sort desc,id desc";PageSize=1;pageindex=1;RecordCount=B_Lebi_Searchkey.Counts(Where);int bkGg_index=1;
List<Lebi_Searchkey> bkGgs = B_Lebi_Searchkey.GetList(Where, Order,PageSize ,pageindex);foreach (Lebi_Searchkey bkGg in bkGgs){%><%=Lang(bkGg.Name)%><%bkGg_index++;}%><%} %>');
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
<%Table="Lebi_Searchkey";Where="";Order="Sort desc,id desc";PageSize=5;pageindex=1;RecordCount=B_Lebi_Searchkey.Counts(Where);int jxTy_index=1;
List<Lebi_Searchkey> jxTys = B_Lebi_Searchkey.GetList(Where, Order,PageSize ,pageindex);foreach (Lebi_Searchkey jxTy in jxTys){%>
<%if (jxTy.Type==1){ %><a href="<%=URL("P_Search",""+Lang(jxTy.Name)+"") %>"><%}else{ %><a href="<%=jxTy.URL%>" target="_blank"><%} %><span><%=Lang(jxTy.Name)%></span></a>
<%jxTy_index++;}%>
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
                                        <%Table="Lebi_Brand";Where="Type_id_BrandStatus = 452 and ','+Pro_Type_id+',' like '%,"+c0.id+",%'";Order="Sort desc";PageSize=16;pageindex=1;RecordCount=B_Lebi_Brand.Counts(Where);int tzeN_index=1;
List<Lebi_Brand> tzeNs = B_Lebi_Brand.GetList(Where, Order,PageSize ,pageindex);foreach (Lebi_Brand tzeN in tzeNs){%>
                                            <li class="brand-box first"><a target="_blank" href="<%=URL("P_Brand",tzeN.id)%>"><img alt="<%=Lang(tzeN.Name) %>" src="<%=Image(tzeN.ImageUrl) %>"><span><%=Lang(tzeN.Name) %></span></a></li>
                                        <%tzeN_index++;}%> 
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
		

<%Table="Lebi_Page";Where="Node_id="+Node("HeadMenu").id+" and ','+Language_ids+',' like '%," + CurrentLanguage.id + ",%'";Order="Sort desc";PageSize=10;pageindex=1;RecordCount=B_Lebi_Page.Counts(Where);int NkvH_index=1;
List<Lebi_Page> NkvHs = B_Lebi_Page.GetList(Where, Order,PageSize ,pageindex);foreach (Lebi_Page NkvH in NkvHs){%>
<a class="menu" href="<%=URL("","",NkvH.url)%>"><span><%=NkvH.Name%></span></a>
<%NkvH_index++;}%>

        
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
    
<div class="mainbanner clearfix">

<%if (Getindeximages(5).Count>0){ %>
<style>
    #ShopBanner{float:left; overflow:hidden;width:100%;height:280px;position:relative;clear:both;}
    #ShopBanner #TabID{ position:absolute; bottom:10px; right:10px;}
    #ShopBanner #TabID li{list-style:none;float:left;width:16px;height:16px;line-height:16px;FILTER:alpha(opacity=80);opacity:0.8;border:1px solid #CD2A2C;background-color:#ECF4EC;color:#CD2A2C;list-style:none;text-align:center;cursor:pointer;padding:2px 5px;margin:0 2px}
    #ShopBanner #TabID li:hover,#ShopBanner #TabID li.active{border:1px solid #CD2A2C;background-color:#E43C3E;color:#FFFFFF;}
</style>
<div id="ShopBanner">
<div id="ShopBannerBox" style="margin:0 auto;">
<ul id="ContentID">
<%foreach(shopindeximage img in Getindeximages(5)){ %>
<li><a href="<%=img.url %>" title="<%=img.title %>"><img src="<%=img.image %>" width="100%" height="280" /></a></li>
<%} %>
</ul>
</div>
<ul id="TabID">
<%int i = 1;foreach(shopindeximage img in Getindeximages(5)){ %>
<li class=""><%=i %></li>
<%i++;} %>
</ul>
</div>
<script type="text/javascript">
    $(function () {
        new Marquee({ MSClassID: "ShopBannerBox", ContentID: "ContentID", TabID: "TabID", Direction: 2, Step: 0.3, Width: "100%", Height: 280, Timer: 20, DelayTime: 4000, WaitTime: 0, ScrollStep: 1, SwitchType: 2, AutoStart: 1 });
    });
</script>
<%} %>
</div>

    <div class="bodyside clearfix">
        


<div class="mbox clearfix">
<div class="brandsearch">
<div class="mt">
    <h2>店内搜索</h2>
</div>
<div class="mc">
    <input id="shop_keyword" value="" type="text" name="shop_keyword" onkeydown="if(event.keyCode==13){shopsearch();}" /><input type="button" value="搜索" class="button" onclick="shopsearch();" />
</div>
</div>
</div>
<script type="text/javascript" >
    function shopsearch() {
        var url = "<%=URL("P_ShopProductCategory",""+ id +",0,1,1,1,[key]")%>";
        location.href = url.replace("[key]",escape($("#shop_keyword").val()));
    }
</script>



<div id="shopcategory">
<h4>商品分类</h4>
<div class="categories">
    <%Table="Lebi_Supplier_ProductType";Where="parentid = 0 and Supplier_id = "+id+"";Order="Sort desc,id desc";PageSize=20;pageindex=1;RecordCount=B_Lebi_Supplier_ProductType.Counts(Where);int bIju_index=1;
List<Lebi_Supplier_ProductType> bIjus = B_Lebi_Supplier_ProductType.GetList(Where, Order,PageSize ,pageindex);foreach (Lebi_Supplier_ProductType bIju in bIjus){%>
    <dl <%if ((parentcid == 0 && bIju_index == 1) || parentcid == bIju.id){ %>class="current" <%} %>>
    <dt class="double">
        <label class="pic"></label>
        <a href="<%=URL("P_ShopProductCategory",""+id+","+bIju.id+"") %>"><%=Lang(bIju.Name) %></a>
    </dt>
    <dd>
        <ul>
            <%Table="Lebi_Supplier_ProductType";Where="parentid = "+bIju.id+" and Supplier_id = "+id+"";Order="Sort desc,id desc";PageSize=20;pageindex=1;RecordCount=B_Lebi_Supplier_ProductType.Counts(Where);int QwtY_index=1;
List<Lebi_Supplier_ProductType> QwtYs = B_Lebi_Supplier_ProductType.GetList(Where, Order,PageSize ,pageindex);foreach (Lebi_Supplier_ProductType QwtY in QwtYs){%>
            <li class="<%=cid==QwtY.id?"currentlink":"" %>"><a href="<%=URL("P_ShopProductCategory",""+id+","+QwtY.id+"") %>">
                <%=Lang(QwtY.Name) %></a></li>
            <%QwtY_index++;}%>
        </ul>
    </dd>
    </dl>
    <%bIju_index++;}%>
</div>
</div>
<script type="text/javascript" src="/Theme/system/js/shoplist.js"></script>



<%if (supplierservicepannel.Status == "1"){%>
<div id="shopservice" class="mbox clearfix">
<div class="shopinfo">
<div class="mt">
    <h2>店铺客服</h2>
</div>
<div class="mc">
<%Table="Lebi_ServicePanel_Group";Where="Supplier_id = "+ id +" and ','+Language_ids+',' like '%,"+ CurrentLanguage.id + ",%'";Order="Sort desc";PageSize=20;pageindex=Rint("page");RecordCount=B_Lebi_ServicePanel_Group.Counts(Where);int shop_group_index=1;
List<Lebi_ServicePanel_Group> shop_groups = B_Lebi_ServicePanel_Group.GetList(Where, Order,PageSize ,pageindex);foreach (Lebi_ServicePanel_Group shop_group in shop_groups){%>
<ul class="group clearfix">
<h2><%=shop_group.Name%></h2>
<ul class="group-user clearfix">
<%Table="Lebi_ServicePanel";Where="Supplier_id = "+ id +" and ServicePanel_Group_id = "+shop_group.id+" and ','+Language_ids+',' like '%,"+ CurrentLanguage.id + ",%'";Order="Sort desc,id desc";PageSize=20;pageindex=Rint("page");RecordCount=B_Lebi_ServicePanel.Counts(Where);int shop_user_index=1;
List<Lebi_ServicePanel> shop_users = B_Lebi_ServicePanel.GetList(Where, Order,PageSize ,pageindex);foreach (Lebi_ServicePanel shop_user in shop_users){%>
<%
    string url = GetServicePanelType(shop_user.ServicePanel_Type_id).Url;
    url = url.Replace("{@uid}",shop_user.Account);
    url = url.Replace("{@uname}",shop_user.Name);
%>
<li><a target="blank" href="<%=url%>"><img src="<%if (GetServicePanelType(shop_user.ServicePanel_Type_id).IsOnline == 1){
    Response.Write(GetServicePanelType(shop_user.ServicePanel_Type_id).Code.Replace("{@uid}",shop_user.Account));
}else{
    Response.Write(Image(GetServicePanelType(shop_user.ServicePanel_Type_id).Face));
}%>" border="0" align="absmiddle" />&nbsp;<%=shop_user.Name%></a></li>
<%shop_user_index++;}%>
</ul>
</li></ul>
<%shop_group_index++;}%>
</div>
</div>
</div>
<%}%>



<div id="shopinfo" class="mbox clearfix">
<div class="shopinfo">
<div class="mt">
    <h2>店铺资料</h2>
</div>
<div class="mc">
    <ul>
    <li>店铺简称：<%=Lang(supplier.Name) %></li>
    <li>公司名称：<%=supplier.Company %></li>
    <li>联系人：<%=supplier.RealName %></li>
    <li>手机号码：<%=supplier.MobilePhone %></li>
    <li>电话号码：<%=supplier.Phone %></li>
    <li>EMAIL：<%=supplier.Email %></li>
    <li>QQ号码：<%=supplier.QQ %></li>
    <li>邮编：<%=supplier.Postalcode %></li>
    <li>地区：<%=Shop.Bussiness.EX_Area.GetAreaName(supplier.Area_id)%></li>
    <li>地址：<%=supplier.Address %></li>
    </ul>
</div>
</div>
</div>

<div class="banner"><a href="javascript:void(0);" onclick="AddFavorite(window.location,document.title)"><img src="/Theme/system/images/shopcollect.jpg" /></a></div>

    </div>
    <div class="bodymain clearfix">
        
<div class="shopdetails"><%=Lang(supplier.Description) %></div>


<%Table="Lebi_Supplier_ProductType";Where="parentid = 0 and Supplier_id = "+id+"";Order="Sort desc,id desc";PageSize=20;pageindex=1;RecordCount=B_Lebi_Supplier_ProductType.Counts(Where);int kjar_index=1;
List<Lebi_Supplier_ProductType> kjars = B_Lebi_Supplier_ProductType.GetList(Where, Order,PageSize ,pageindex);foreach (Lebi_Supplier_ProductType kjar in kjars){%>
<div class="nbbox clearfix">
<div class="categoryproducttop clearfix">
    <div class="mt clearfix">
        <div class="left">
            <h2><%=Lang(kjar.Name) %></h2>
        </div>
        <div class="right"><a href="<%=URL("P_ShopProductCategory",""+id+","+kjar.id+"") %>">更多</a></div>
    </div>
    <div class="mc clearfix">
        <div class="productshow">
            <ul class="image">
                <%Table="Lebi_Product";Where=""+ProductWhere+" and Type_id_ProductType = 320 and "+ ShopCategoryWhere(kjar.id) +"";Order="Sort desc,id desc";PageSize=8;pageindex=1;RecordCount=B_Lebi_Product.Counts(Where);int pro_index=1;
List<Lebi_Product> pros = B_Lebi_Product.GetList(Where, Order,PageSize ,pageindex);foreach (Lebi_Product pro in pros){%>
                <li>
                    <div class="proimg"><p><a href="<%=URL("P_Product",pro.id) %>"><img <%if (CurrentLanguage.IsLazyLoad==1){ %>class="lazy" src="/Theme/system/images/lazy.gif" data-original<%}else{ %>src<%} %>="<%=Image(pro.ImageOriginal,"medium") %>" alt="<%=Lang(pro.Name) %>" title="<%=Lang(pro.Name) %>" /></a></p></div>
                    <div class="proname"><a href="<%=URL("P_Product",pro.id) %>" title="<%=Lang(pro.Name) %>"><%=Lang(pro.Name) %></a></div>
                    <div class="proprice"><%if (pro.Price_Market > 0){ %><div class="marketprice"><i>市场价：</i><strong><%=FormatMoney(pro.Price_Market) %></strong></div><%} %><div class="buyprice"><i><%=Lang(CurrentUserLevel.PriceName) %>：</i><strong><%=FormatMoney(ProductPrice(pro)) %></strong></div></div>                    
                </li>
                <%pro_index++;}%>
            </ul>
            <div class="clear"></div>
        </div>
    </div>
</div>
</div>
<%kjar_index++;}%>


    </div>
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