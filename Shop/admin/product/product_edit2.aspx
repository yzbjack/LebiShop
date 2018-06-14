﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Admin.product.product_Edit" validateRequest="false"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta content="text/html; charset=UTF-8" http-equiv="content-type" />
<meta name="author" content="LebiShop" />

    <title>
        <%if (model.id > 0) { Response.Write(Shop.Bussiness.Language.Content(model.Name, CurrentLanguage.Code) + "-"); } %><%=Tag("商品管理")%>-<%=site.title%>
    </title>
    <script type="text/javascript" src="<%=site.AdminJsPath %>/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="<%=site.AdminJsPath %>/dialog.js"></script>
    <script type="text/javascript" src="<%=site.AdminJsPath %>/as.js"></script>
    <style >
        .steppricetable{border: 1px solid #cccccc;}
        .steppricetable tr th{text-align:center;}
        .steppricetable tr td{text-align:center;}
    </style>

<script src="<%=site.AdminJsPath %>/jquery-3.1.0.min.js"></script>
<script src="<%=site.AdminJsPath %>/jquery-migrate-1.2.1.js"></script>
<script src="<%=site.AdminJsPath %>/Cookies.js"></script>
<script src="<%=site.AdminJsPath %>/main.js"></script>
<script src="<%=site.AdminJsPath %>/messagebox.js"></script>
<script src="<%=site.AdminJsPath %>/master.js"></script>
<script src="<%=site.AdminJsPath %>/jquery-ui/jquery-ui.min.js"></script>
<%if (CurrentLanguage.Code=="CN"){%><script src="<%=site.AdminJsPath %>/jquery-ui/datepicker-zh-CN.js"></script><%}%>
<link rel="stylesheet" type="text/css" href="<%=site.AdminCssPath %>/css.css" />
<link rel="stylesheet" type="text/css" href="<%=site.AdminJsPath %>/jquery-ui/jquery-ui.min.css" />
<link rel="stylesheet" type="text/css" href="<%=site.AdminJsPath %>/jquery-ui/jquery-ui.theme.min.css" />
<link rel="stylesheet" type="text/css" href="<%=site.AdminJsPath %>/lightbox/lightbox.min.css" />
<%if (Shop.LebiAPI.Service.Instanse.Check("managelicenese")){%>
<style>#body_head #logo {width:112px;height:62px;background:url(<%=site.AdminImagePath %>/2015/logo_oem.gif) center 20px #0669c5 no-repeat;float:left;}</style>
<%}%>
<script>
    var AdminPath = "<%=site.AdminPath %>";var WebPath ="<%=site.WebPath %>";var AdminImagePath = "<%=site.AdminImagePath %>";var requestPage = "<%=Shop.Tools.RequestTool.GetRequestUrl().ToLower() %>";var refPage = "<%=Shop.Tools.RequestTool.GetUrlReferrer().ToLower() %>";
    function quit() { if (confirm("<%=Tag("您确定要退出吗？")%>")) return true; else return false; }
</script>

</head>
<body>
<div id="body_head">
  <div class="admintop">
    <div id="logo">
        <a href="<%=site.AdminPath %>/ajax/ajax_admin.aspx?__Action=MenuJump&pid=0"></a>
        <%=LicenseString %>
    </div>
    <%=Version %>
    <div class="admininfo">
        <div id="NewEvent">
            <span><%=Tag("未确认")%></span><em><a href="<%=site.AdminPath %>/order/default.aspx?t=211&type=1"><span id="NewEvent_Order_IsVerified"><%=SYS.NewEvent_Order_IsVerified%></span></a></em>
            <span><%=Tag("已支付")%></span><em><a href="<%=site.AdminPath %>/order/default.aspx?t=211&type=4"><span id="NewEvent_Order_IsPaid"><%=SYS.NewEvent_Order_IsPaid%></span></a></em>
            <span><%=Tag("未发货")%></span><em class="noborder"><a href="<%=site.AdminPath %>/order/default.aspx?t=211&type=5"><span id="NewEvent_Order_IsShipped"><%=SYS.NewEvent_Order_IsShipped%></span></a></em>
        </div>
    </div>
    <%if (Tips()!=""){ %><div id="tips"><%=Tips() %></div><%} %>
    <div id="service">
        <div class="layout">
          <div class="adminface" onmousehover="">
            <img src="<%=CurrentAdmin.Avatar%>" alt="[<%=Lang(CurrentAdminGroup.Name)%>]<%=CurrentAdmin.UserName%>" />
          </div>
          <div class="adminfacepop">
              <a href="javascript:AdminPWD(0);"><%=Tag("改密")%></a>
              <a href="<%=site.AdminPath %>/Logout.aspx" onclick="return quit()"><%=Tag("注销")%></a>
              <a href="<%=site.WebPath %>/" target="_blank"><%=Tag("网站前台")%></a>
          </div>
        </div>
    </div>
    <div class="clearfix">
    </div>
    <div class="navmenu">
        <ul id="shopmenu" class="menu">
            <%foreach (Shop.Model.Lebi_Menu menu in TopMenus)
                { %>
            <li class="<%=CurrentTopMenu.id==menu.id?"current":"" %>"><a href="<%=site.AdminPath %>/Ajax/ajax_admin.aspx?__Action=MenuJump&pid=<%=menu.id %>"><span><img src="<%if (menu.Image != ""){ %><%=GetImage(site.WebPath + menu.Image) %><%}else{%><%=site.AdminImagePath%>/icon/plugin.png<%} %>" /><%=Tag(menu.Name)%></span></a> </li>
            <%} %>
        </ul>
        <ul class="menu">
            <li class="menuline"></li>
            <li><a href="javascript:void(0);" onclick="updateadmin();"><span><img src="<%=site.AdminImagePath%>/icon/reh.png" /><%=Tag("系统刷新")%></span></a></li>
            <li><a href="javascript:void(0);" onclick="UpdateCache(0);"><span><img src="<%=site.AdminImagePath%>/icon/cache.png" /><%=Tag("更新缓存")%></span></a></li>
            <li><a href="javascript:void(0);" onclick="UpdateCache(1);"><span><img src="<%=site.AdminImagePath%>/icon/data.png" /><%=Tag("数据同步")%></span></a></li>
            <li><a href="<%=site.AdminPath%>/Ajax/ajax_admin.aspx?__Action=MenuJump&pid=0"><span><img src="<%=site.AdminImagePath%>/icon/dasktop.png" /><%=Tag("桌面") %></span></a></li>
            <li><a href="<%=site.WebPath %>/" target="_blank"><span><img src="<%=site.AdminImagePath%>/icon/web.png" /><%=Tag("网站前台")%></span></a></li>
            <li><a href="javascript:void(0);" onclick="Copyright();"><span><img src="<%=site.AdminImagePath%>/icon/about.png" /><%=Tag("关于") %></span></a></li>
        </ul>
        
    </div>
  </div>
</div>
<div id="body_content">
<div id="sidebar">
    <div class="menubar ">
        <%if (desk == 1)
            { 
        %>
        <h2><span><img src="<%=site.AdminImagePath %>/2015/minus.png" id="img1" /> <%=Tag("快捷菜单")%></span></h2>
        <ul class="clear">
            <%foreach (Shop.Model.Lebi_Menu menu in GetIndexMenus()){ %><li><a href="<%=MenuUrl(menu.URL,1) %>"><span><%=Tag(menu.Name)%></span></a></li><%}%>
        </ul>
        <% }else{ %>
        <%foreach (Shop.Model.Lebi_Menu pmenu in GetMenus(CurrentTopMenu.id)){ %>
        <h2><span><img mid="<%=pmenu.id %>" src="<%=site.AdminImagePath %>/2015/<%=MenuShow(pmenu.id)==true?"minus":"plus" %>.png" id="imgStatis" /> <%=Tag(pmenu.Name)%></span></h2>
        <ul class="clear" <%=MenuShow(pmenu.id)==true?"":"style=\"display:none;\"" %>>
            <%foreach (Shop.Model.Lebi_Menu menu in GetMenus(pmenu.Code)){ %><li><a href="<%=MenuUrl(menu.URL,0) %>"><span><%=Tag(menu.Name)%></span></a></li><%}%>
        </ul>
        <%} } %>
    </div>
</div>
<div id="sideplus">
    <a href="javascript:void()" onclick="switchSysBar()"><span class="navPoint" id="switchPoint" title="<%=Tag("关闭/打开左栏")%>"><img src="<%=site.AdminImagePath%>/2015/left.png" alt="<%=Tag("关闭/打开左栏")%>" /></span></a>
</div>
<div id="sidecontent" class="clear">
    <div class="mainbody_path" id="body_path">
      
    <div class="tools">
        <ul>
            <%if (t == "copy"){ %><li class="tip"><a href="javascript:void(0);"><b></b><span><%=Tag("复制")%></span></a></li><%} %>
            <li class="submit"><a href="javascript:void(0);" onclick="SaveObj(0);"><b></b><span><%=Tag("保存")%></span></a></li>
            <li class="submit"><a href="javascript:void(0);" onclick="SaveObj(1);"><b></b><span><%=Tag("保存并继续编辑")%></span></a></li>
            <li class="rotate"><a href="javascript:void(0);" onclick="javascript:history.back();"><b></b><span><%=Tag("返回")%></span></a></li>
            <li class="name"><span id="navIgation">
                <%=Tag("当前位置")%>：<a href="<%=site.AdminPath %>/Ajax/ajax_admin.aspx?__Action=MenuJump&pid=0"><%=Tag("管理首页")%></a> > <a href="<%=site.AdminPath %>/product/default.aspx"><%=Tag("商品管理")%></a> > <%=Shop.Tools.Utils.CutString(Shop.Bussiness.Language.Content(model.Name, CurrentLanguage.Code),30,true) %><%if (t == "copy"){ %>（<%=Tag("复制")%>）<%} %></span></li>
        </ul>
    </div>

    </div>
    <%if (PageReturnMsg == ""){%>
        
        
    <div class="mainbody_top">
        <ul class="tablist">
            <li onclick="Edit(1)" id="p1" class="selected"><a><span><%=Tag("基本信息")%></span></a></li>
            <li onclick="Edit(2)" id="p2"><a><span><%=Tag("通用信息")%></span></a></li>
            <li onclick="Edit(3);" id="p3"><a><span><%=Tag("商品属性")%></span></a></li>
            <li onclick="Edit(5);" id="p5"><a><span><%=Tag("商品价格")%></span></a></li>
            <%if (model.id>0){ %><li onclick="Edit(4);" id="p4"><a><span><%=Tag("商品规格")%></span></a></li><%} %>
        </ul>
    </div>

    <%}%>
    <div class="mainbody" id="body_main">
        <div id="body_main_form">
          <%if (PageReturnMsg == ""){%>
            
    <table class="table">
        <tr>
            <td colspan="2">
                <%=Shop.Bussiness.Language.AdminLanguageTab("") %>
            </td>
        </tr>
        <%int i = 0;foreach (Shop.Model.Lebi_Language_Code lang in Shop.Bussiness.Language.Languages())
          {%>
        <tbody id="lang_<%=lang.Code %>" class="lang_table" style="display: none">
            <tr>
                <th>
                    <%=Tag("商品名称")%>：
                </th>
                <td>
                    <input type="text" id="Name<%=lang.Code %>" shop="true" style="width: 500px;" name="Name<%=lang.Code %>"
                        value="<%=Shop.Bussiness.Language.Content(model.Name, lang.Code) %>" class="input" />
                </td>
            </tr>
            <%if (model.id == 0 || (model.id > 0 && model.Product_id == 0))
              {%>
            <tr>
                <th style="vertical-align:top">
                    <%=Tag("商品简介")%>：
                </th>
                <td>
                    <textarea id="Introduction<%=lang.Code %>" shop="true" name="Introduction<%=lang.Code %>"
                        class="textarea" style="height: 55px; width: 500px;"><%=Shop.Bussiness.Language.Content(model.Introduction, lang.Code)%></textarea>
                    <div class="tools clear">
                        <ul>
                            <li class="plus"><a href="javascript:void(0);" onclick="javascript:resizeEditor('Introduction<%=lang.Code %>',100);">
                                <b></b><span>
                                    <%=Tag("展开")%></span></a></li>
                            <li class="minus"><a href="javascript:void(0);" onclick="javascript:resizeEditor('Introduction<%=lang.Code %>',-100)">
                                <b></b><span>
                                    <%=Tag("收缩")%></span></a></li>
                        </ul>
                    </div>
                </td>
            </tr>
            <%} %>
            <tr>
                <th style="vertical-align:top">
                    <%=Tag("详细介绍")%>：
                </th>
                <td>
                    <textarea name="Description<%=lang.Code %>" shop="true" id="Description<%=lang.Code %>"
                        class="text"><%=Shop.Bussiness.Language.Content(model.Description, lang.Code)%></textarea><%if (CountSon(model.id) > 0 && i == 0)
                                                                                                                    { %><label
                            title="<%=Tag("同步更新子商品")%>"><input type="checkbox" name="UpdateDescription" shop="true"
                                id="UpdateDescription" value="1" /><em><%=Tag("同步")%></em></label><%} %>
                    <script type="text/javascript">
                        CKEDITOR.replace('Description<%=lang.Code %>', {
                            height: '200',
                            width: '98%',
                            language: '<%=Tag("CKEditor语言")%>'
                        });
                    </script>
                </td>
            </tr>
            <%-- 
            <tr>
                <th style="vertical-align:top">
                    <%=Tag("规格参数")%>：
                </th>
                <td>
                    <textarea style="height: 60px; width: 500px;" shop="true" name="Specification<%=lang.Code %>" id="Specification<%=lang.Code %>" class="input"><%=Shop.Bussiness.Language.Content(model.Specification, lang.Code)%></textarea>
                    <script type="text/javascript">
                        CKEDITOR.replace('Specification<%=lang.Code %>', {
                            height: '150',
                            width: '98%',
                            language: '<%=Tag("CKEditor语言")%>'
                        });
                    </script>
                </td>
            </tr>
            <tr>
                <th style="vertical-align:top">
                    <%=Tag("包装清单")%>：
                </th>
                <td>
                    <textarea style="height: 60px; width: 500px;" shop="true" name="Packing<%=lang.Code %>" id="Packing<%=lang.Code %>" class="input"><%=Shop.Bussiness.Language.Content(model.Packing, lang.Code)%></textarea>
                    <script type="text/javascript">
                        CKEDITOR.replace('Packing<%=lang.Code %>', {
                            height: '150',
                            width: '98%',
                            language: '<%=Tag("CKEditor语言")%>'
                        });
                    </script>
                </td>
            </tr>
            <tr>
                <th style="vertical-align:top">
                    <%=Tag("售后服务")%>：
                </th>
                <td>
                    <textarea style="height: 60px; width: 500px;" shop="true" name="Service<%=lang.Code %>" id="Service<%=lang.Code %>" class="input"><%=Shop.Bussiness.Language.Content(model.Service, lang.Code)%></textarea>
                    <script type="text/javascript">
                        CKEDITOR.replace('Service<%=lang.Code %>', {
                            height: '150',
                            width: '98%',
                            language: '<%=Tag("CKEditor语言")%>'
                        });
                    </script>
                </td>
            </tr>
            --%>
            <%if (wap)
              { %>
            <tr>
                <th style="vertical-align:top">
                    <%=Tag("WAP端描述")%>：
                </th>
                <td>
                    <textarea style="height: 60px; width: 500px;" shop="true" name="MobileDescription<%=lang.Code %>"
                        id="MobileDescription<%=lang.Code %>" class="input"><%=Shop.Bussiness.Language.Content(model.MobileDescription, lang.Code)%></textarea><%if (CountSon(model.id) > 0 && i == 0)
                                                                                                                                                                 { %><label
                            title="<%=Tag("同步更新子商品")%>"><input type="checkbox" name="UpdateMobileDescription"
                                shop="true" id="UpdateMobileDescription" value="1" /><em><%=Tag("同步")%></em></label><%} %>
                    <script type="text/javascript">
                        CKEDITOR.replace('MobileDescription<%=lang.Code %>', {
                            height: '150',
                            width: '98%',
                            language: '<%=Tag("CKEditor语言")%>'
                        });
                    </script>
                </td>
            </tr>
            <%} %>
            <tr>
                <th class="head" colspan="2" onclick="ShowChild('0<%=lang.Code%>,1<%=lang.Code%>,2<%=lang.Code%>','seo')">
                    <img src="<%=PageImage("plus.gif")%>" name="imgseo" id="imgseo" style="cursor: pointer; text-align: center" />
                    <%=Tag("SEO优化")%>
                    <%if (CountSon(model.id) > 0 && i == 0)
                      { %><label title="<%=Tag("同步更新子商品")%>"><input type="checkbox"
                        name="UpdateSEO" shop="true" id="UpdateSEO" value="1" /><em><%=Tag("同步")%></em></label><%} %>
                </th>
            </tr>
            <tr style="display: none;" name="trseo" id="tr0<%=lang.Code%>">
                <th>
                    <%=Tag("网页标题")%>：
                </th>
                <td>
                    <input type="text" style="width: 600px;" shop="true" class="input" id="SEO_Title<%=lang.Code %>"
                        name="SEO_Title<%=lang.Code %>" value="<%=Shop.Bussiness.Language.Content(model.SEO_Title, lang.Code)%>" />
                </td>
            </tr>
            <tr style="display: none;" name="trseo" id="tr1<%=lang.Code%>">
                <th>
                    <%=Tag("关键词")%>：
                </th>
                <td>
                    <input type="text" style="width: 600px;" shop="true" id="SEO_Keywords<%=lang.Code %>"
                        name="SEO_Keywords<%=lang.Code %>" value="<%=Shop.Bussiness.Language.Content(model.SEO_Keywords, lang.Code)%>"
                        class="input" />
                </td>
            </tr>
            <tr style="display: none;" name="trseo" id="tr2<%=lang.Code%>">
                <th>
                    <%=Tag("网页描述")%>：
                </th>
                <td>
                    <input type="text" style="width: 600px;" shop="true" id="SEO_Description<%=lang.Code %>"
                        name="SEO_Description<%=lang.Code %>" value="<%=Shop.Bussiness.Language.Content(model.SEO_Description, lang.Code)%> "
                        class="input" />
                </td>
            </tr>
        </tbody>
        <%i++;} %>
    </table>
    <table id="table2" cellpadding="0" cellspacing="0" width="100%" class="table" style="display: none">
        <%if (Shop.LebiAPI.Service.Instanse.Check("plugin_gongyingshang"))
          { %>
        <tr>
            <th>
                <%=Tag("商家")%>：
            </th>
            <td>
                <select id="Supplier_id" name="Supplier_id" shop="true">
                    <option value="0">
                        <%=Tag("请选择")%></option>
                    <%=Shop.Bussiness.EX_Supplier.SupplierOption(model.Supplier_id, CurrentLanguage.Code)%>
                </select>
            </td>
        </tr>
        <%--        <tr>
            <th>
                <%=Tag("发货方")%>：
            </th>
            <td>
                <input type="radio" name="IsSupplierTransport" value="0" shop="true" <%=model.IsSupplierTransport==0?"checked":"" %> /><%=Tag("商城")%>
                <input type="radio" name="IsSupplierTransport" value="1" shop="true" <%=model.IsSupplierTransport==1?"checked":"" %> /><%=Tag("供应商")%>
            </td>
        </tr>--%>
        <tr>
            <th style="vertical-align:top">
                <%=Tag("自定义类别")%>：
            </th>
            <td>
                <select name="Supplier_ProductType_ids" id="Supplier_ProductType_ids" shop="true"
                    multiple="multiple" size="8">
                    <%=Shop.Bussiness.EX_Product.SupplierTypeOption(model.Supplier_id, 0, model.Supplier_ProductType_ids, 0, CurrentLanguage.Code)%>
                </select>
            </td>
        </tr>
        <%} %>
        <%if (model.id == 0 || (model.id > 0 && model.Product_id == 0))
          {%>
        <tr>
            <th>
                <%=Tag("商品类别")%>：
            </th>
            <td>
                
                <div id="ProductType_div"></div>
            </td>
        </tr>
        <tr>
            <th style="vertical-align:top">
                <%=Tag("扩展类别")%>：
            </th>
            <td>
                <select name="Pro_Type_id_other" id="Pro_Type_id_other" shop="true" multiple="multiple"
                    size="8">
                    <%=Shop.Bussiness.EX_Product.TypeOption(0, model.Pro_Type_id_other, 0, CurrentLanguage.Code)%>
                </select>
            </td>
        </tr>
        <%}
          else
          {%>
        <input type="hidden" name="Pro_Type_id" shop="true" id="Pro_Type_id" value="<%=model.Pro_Type_id %>" />
        <%} %>
        <tr>
            <th>
                <%=Tag("商品编号")%>：
            </th>
            <td>
                <input type="text" id="Number" shop="true" name="Number" class="input" value="<%=model.Number %>" />
            </td>
        </tr>
        <tr>
            <th>
                <%=Tag("规格")%>：
            </th>
            <td>
                <input type="text" id="Code" shop="true" name="Code" class="input" value="<%=model.Code %>" />
            </td>
        </tr>
        <tr>
            <th>
                <%=Tag("商品单位")%>：
            </th>
            <td>
                <select id="Units_id" shop="true" name="Units_id">
                    <option value="0"><%=Tag("请选择")%></option>
                    <%=Shop.Bussiness.EX_Product.UnitOption(model.Units_id, CurrentLanguage.Code)%>
                </select>
                <%if (CountSon(model.id) > 0)
                  { %><label title="<%=Tag("同步更新子商品")%>"><input type="checkbox"
                    name="UpdateUnits_id" shop="true" id="UpdateUnits_id" value="1" /><em><%=Tag("同步")%></em></label><%} %>
            </td>
        </tr>
        <%if (model.id == 0 || (model.id > 0 && model.Product_id == 0))
          {%>
        <tr>
            <th>
                <%=Tag("分组商品标签")%>：
            </th>
            <td>
                <input type="text" class="input" shop="true" name="Tags" id="Tags" value="<%=model.Tags %>"
                    style="width: 300px;" />
                <em>
                    <%=Tag("标签通过匹配商品名称来识别相关商品，多个标签用，隔开")%></em>
                <%if (CountSon(model.id) > 0)
                  { %><label title="<%=Tag("同步更新子商品")%>"><input type="checkbox"
                    name="UpdateTags" shop="true" id="UpdateTags" value="1" /><em><%=Tag("同步")%></em></label><%} %>
            </td>
        </tr>
        <tr>
            <th>
                <%=Tag("商品品牌")%>：
            </th>
            <td>
                <div style="float: left;" id="divBrnad">
                    <select id="Brand_id" shop="true" name="Brand_id">
                        <option value="0">
                            <%=Tag("请选择")%></option>
                        <%=Shop.Bussiness.EX_Product.BrandOption(model.Brand_id,CurrentLanguage.Code)%>
                    </select>
                    <%if (CountSon(model.id) > 0)
                      { %><label title="<%=Tag("同步更新子商品")%>"><input type="checkbox"
                        name="UpdateBrand_id" shop="true" id="UpdateBrand_id" value="1" /><em><%=Tag("同步")%></em></label><%} %>
                </div>
            </td>
        </tr>
        <%} %>
        
        <%if (!Shop.Bussiness.EX_Product.IsHaveSon(model.id))
          { %>
        <tr>
            <th>
                <%=Tag("库存数量")%>：
            </th>
            <td>
                <%if (IsEditStock){ %>
                <input type="text" id="Count_Stock" shop="true" min="notnull" onkeyup="value=value.replace(/[^\d]/g,'')"
                    name="Count_Stock" class="input" style="width: 70px;" value="<%=model.Count_Stock %>" />
                <%}else{ %>
                <%=model.Count_Stock %>
                <%} %>
                <%=Tag("冻结库存")%>：<input type="text" id="Count_Freeze" shop="true" onkeyup="value=value.replace(/[^\d]/g,'')"
                    name="Count_Freeze" class="input" style="width: 70px;" value="<%=model.Count_Freeze %>" />
            </td>
        </tr>
        <%} %>
        <%if (model.id == 0 || (model.id > 0 && model.Product_id == 0))
          {%>
        <tr>
            <th>
                <%=Tag("警戒库存")%>：
            </th>
            <td>
                <input type="text" shop="true" min="notnull" onkeyup="value=value.replace(/[^\d]/g,'')"
                    id="Count_StockCaution" name="Count_StockCaution" class="input" style="width: 70px;"
                    value="<%=model.Count_StockCaution %>" />
                <%if (CountSon(model.id) > 0)
                  { %><label title="<%=Tag("同步更新子商品")%>"><input type="checkbox"
                    name="UpdateCount_StockCaution" shop="true" id="UpdateCount_StockCaution" value="1" /><em><%=Tag("同步")%></em></label><%} %>
            </td>
        </tr>
        <%} %>
        <tr>
            <th>
                <%=Tag("销量")%>：
            </th>
            <td>
                <%=Tag("真实")%>：<input type="text" id="Count_Sales" shop="true" min="notnull" onkeyup="value=value.replace(/[^\d]/g,'')"
                    name="Count_Sales" class="input" style="width: 70px;" value="<%=model.Count_Sales %>" />
                <%=Tag("虚拟")%>：<input type="text" id="Count_Sales_Show" shop="true" onkeyup="value=value.replace(/[^\d]/g,'')"
                    name="Count_Sales_Show" class="input" style="width: 70px;" value="<%=model.Count_Sales_Show %>" />
                <%if (CountSon(model.id) > 0)
                  { %><label title="<%=Tag("同步更新子商品")%>"><input type="checkbox"
                    name="UpdateCount_Sales" shop="true" id="UpdateCount_Sales" value="1" /><em><%=Tag("同步")%></em></label><%} %>
            </td>
        </tr>
        <tr>
            <th>
                <%=Tag("浏览量")%>：
            </th>
            <td>
                <%=Tag("真实")%>：<input type="text" id="Count_Views" shop="true" min="notnull" onkeyup="value=value.replace(/[^\d]/g,'')"
                    name="Count_Views" class="input" style="width: 70px;" value="<%=model.Count_Views %>" />
                <%=Tag("虚拟")%>：<input type="text" id="Count_Views_Show" shop="true" onkeyup="value=value.replace(/[^\d]/g,'')"
                    name="Count_Views_Show" class="input" style="width: 70px;" value="<%=model.Count_Views_Show %>" />
                <%if (CountSon(model.id) > 0)
                  { %><label title="<%=Tag("同步更新子商品")%>"><input type="checkbox"
                    name="UpdateCount_Views" shop="true" id="UpdateCount_Views" value="1" /><em><%=Tag("同步")%></em></label><%} %>
            </td>
        </tr>
        <tr>
            <th>
                <%=Tag("包装率")%>：
            </th>
            <td>
                <input type="text" shop="true" name="PackageRate" value="<%=model.PackageRate %>"
                    onkeyup="value=value.replace(/[^\d]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
                    id="PackageRate" class="input" style="width: 70px;" />
                <%if (CountSon(model.id) > 0)
                  { %><label title="<%=Tag("同步更新子商品")%>"><input type="checkbox"
                    name="UpdatePackageRate" shop="true" id="UpdatePackageRate" value="1" /><em><%=Tag("同步")%></em></label><%} %>
            </td>
        </tr>
        <tr>
            <th>
                <%=Tag("商品毛重")%>：
            </th>
            <td>
                <input type="text" shop="true" min="notnull" value="<%=model.Weight %>" class="input"
                    onkeyup="value=value.replace(/[^\d\.]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d\.]/g,''))"
                    id="Weight" name="Weight" style="width: 70px;" />
                <%=Tag("KG")%>
                <em>
                    <%=Tag("用来计算订单配送费用")%></em>
                <%if (CountSon(model.id) > 0)
                  { %><label title="<%=Tag("同步更新子商品")%>"><input type="checkbox"
                    name="UpdateWeight" shop="true" id="UpdateWeight" value="1" /><em><%=Tag("同步")%></em></label><%} %>
            </td>
        </tr>
        <tr>
            <th>
                <%=Tag("商品净重")%>：
            </th>
            <td>
                <input type="text" shop="true" min="notnull" value="<%=model.NetWeight %>" class="input"
                    onkeyup="value=value.replace(/[^\d\.]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d\.]/g,''))"
                    id="NetWeight" name="NetWeight" style="width: 70px;" />
                <%=Tag("KG")%>
                <%if (CountSon(model.id) > 0)
                  { %><label title="<%=Tag("同步更新子商品")%>"><input type="checkbox"
                    name="UpdateNetWeight" shop="true" id="UpdateNetWeight" value="1" /><em><%=Tag("同步")%></em></label><%} %>
            </td>
        </tr>
        <tr>
            <th>
                <%=Tag("包装尺寸")%>：
            </th>
            <td>
                <%=Tag("L")%>：<input type="text" shop="true" name="VolumeL" value="<%=model.VolumeL %>"
                    onkeyup="value=value.replace(/[^.\d]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^.\d]/g,''))"
                    id="VolumeL" class="input" style="width: 70px;" />
                <%=Tag("W")%>：<input type="text" shop="true" name="VolumeW" value="<%=model.VolumeW %>"
                    onkeyup="value=value.replace(/[^.\d]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^.\d]/g,''))"
                    id="VolumeW" class="input" style="width: 70px;" />
                <%=Tag("H")%>：<input type="text" shop="true" name="VolumeH" value="<%=model.VolumeH %>"
                    onkeyup="value=value.replace(/[^.\d]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^.\d]/g,''))"
                    id="VolumeH" class="input" style="width: 70px;" />
                <em>
                    <%=Tag("单位CM")%></em>
                <%if (CountSon(model.id) > 0)
                  { %><label title="<%=Tag("同步更新子商品")%>"><input type="checkbox"
                    name="UpdateVolume" shop="true" id="UpdateVolume" value="1" /><em><%=Tag("同步")%></em></label><%} %>
            </td>
        </tr>
        <%if (model.id == 0 || (model.id > 0 && model.Product_id == 0))
          {%>
        <tr>
            <th>
                <%=Tag("排序序号")%>：
            </th>
            <td>
                <input type="text" shop="true" name="Sort" value="<%=model.Sort %>" onkeyup="value=value.replace(/[^\d]/g,'')"
                    onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
                    id="Sort" class="input" style="width: 70px;" />
            </td>
        </tr>
        <%} %>
       <tr>
            <th style="vertical-align:top">
                <%=Tag("商品主图")%>：
            </th>
            <td>
                <div id="image_ImageOriginal">
                    <%if (model.ImageOriginal != "")
                      {%>
                    <img height="30" src="<%=Image(model.ImageOriginal,"small")%>" />
                    <%} %>
                </div>
                <input type="hidden" shop="true" id="ImageOriginal" name="ImageOriginal" value="<%=model.ImageOriginal%>" />
                <input id="file_ImageOriginal" name="file_ImageOriginal" class="input" type="file" onchange="uploadImage('ImageOriginal')" />
                
                <em>
                    <%=Tag("如果含有子商品，将使用自动提取首个子商品图片")%></em>
            </td>
        </tr>
        <%if (!Shop.Bussiness.EX_Product.IsHaveSon(model.id))
          { %>
        <tr>
            <th style="vertical-align:top">
                <%=Tag("展示图")%>：
            </th>
            <td>
                <textarea id="Images" name="Images" shop="true" class="textarea" style="height: 60px;
                    width: 450px; display: none"><%=model.Images%></textarea>
                <div id="imagesdiv">
                </div>
            </td>
        </tr>
        <%} %>
        <%if (model.id == 0 || (model.id > 0 && model.Product_id == 0))
          {%>
        <tr>
            <th>
                <%=Tag("商品标签")%>：
            </th>
            <td>
                <% foreach (Shop.Model.Lebi_Pro_Tag pt in Shop.Bussiness.B_Lebi_Pro_Tag.GetList("", ""))
                   { %>
                <label>
                    <input shop="true" type="checkbox" id="Pro_Tag_id" value="<%=pt.id %>" name="Pro_Tag_id"
                        <%=(","+model.Pro_Tag_id+",").Contains(","+pt.id+",")?"checked":"" %> /><%=Shop.Bussiness.Language.Content(pt.Name,CurrentLanguage.Code) %></label>
                <%} %>
            </td>
        </tr>
        <%} %>
        <tr>
            <th>
                <%=Tag("商品类型")%>：
            </th>
            <td style="text-align: left;">
                <%=Shop.Bussiness.EX_Type.TypeRadio("ProductType", "Type_id_ProductType", model.Type_id_ProductType, "shop=\"true\" onclick=\"ChangeProductType();\"",CurrentLanguage.Code)%>
                <%if (CountSon(model.id) > 0)
                  { %><label title="<%=Tag("同步更新子商品")%>"><input type="checkbox"
                    name="UpdateType_id_ProductType" shop="true" id="UpdateType_id_ProductType" value="1" /><em><%=Tag("同步")%></em></label><%} %>
            </td>
        </tr>
        <tbody id="qianggoubody">
            <tr>
                <th>
                    <span id="pricename">
                        <%if (model.Type_id_ProductType == 321)
                          { %><%=Tag("抢购价")%>(<%=DefaultCurrency.Msige%>)<%}
                          else if (model.Type_id_ProductType == 322)
                          { %>
                        %><%=Tag("团购价")%>(<%=DefaultCurrency.Msige%>)<%}
                          else if (model.Type_id_ProductType == 323)
                          { %>
                        %><%=Tag("换购积分")%><%} %></span>：
                </th>
                <td>
                    <input type="text" class="input" id="Price_Sale" shop="true" min="notnull" name="Price_Sale"
                        style="width: 70px;" value="<%=model.Price_Sale %>" onkeyup="value=value.replace(/[^.\d]/g,'')"
                        onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^.\d]/g,''))" />
                </td>
            </tr>
            <tr>
                <th>
                    <%=Tag("限购数量")%>：
                </th>
                <td>
                    <input type="text" shop="true" name="Count_Limit" value="<%=model.Count_Limit %>"
                        onkeyup="value=value.replace(/[^\d]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
                        id="Count_Limit" class="input" style="width: 70px;" />
                </td>
            </tr>
            <tr>
                <th>
                    <%=Tag("开始日期")%>：
                </th>
                <td>
                    <input type="text" shop="true" name="Time_Start" value="<%=FormatTime(model.Time_Start) %>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"
                        id="Time_Start" class="input-calendar" style="width: 200px" />
                    <em></em>
                </td>
            </tr>
            <tr>
                <th>
                    <%=Tag("截止日期")%>：
                </th>
                <td>
                    <input type="text" shop="true" name="Time_Expired" value="<%=FormatTime(model.Time_Expired) %>"
                        onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" id="Time_Expired" class="input-calendar"
                        style="width: 200px" />
                    <em></em>
                </td>
            </tr>
        </tbody>
        <tr>
            <th>
                <%=Tag("商品状态")%>：
            </th>
            <td style="text-align: left;">
                <%=Shop.Bussiness.EX_Type.TypeRadio("ProductStatus", "Type_id_ProductStatus", model.Type_id_ProductStatus, "shop=\"true\" onclick=\"ChangeProductStatus();\"", CurrentLanguage.Code)%>
            </td>
        </tr>
        <tr id="FreezeRemarkbody">
            <th style="vertical-align:top">
                <%=Tag("冻结原因")%>：
            </th>
            <td>
                <textarea id="FreezeRemark" shop="true" name="FreezeRemark" class="textarea" style="height: 60px;width: 500px;"><%=model.FreezeRemark%></textarea>
                <div class="tools clear">
                    <ul>
                        <li class="plus"><a href="javascript:void(0);" onclick="javascript:resizeEditor('FreezeRemark',100);"><b></b><span><%=Tag("展开")%></span></a></li>
                        <li class="minus"><a href="javascript:void(0);" onclick="javascript:resizeEditor('FreezeRemark',-100)"><b></b><span><%=Tag("收缩")%></span></a></li>
                    </ul>
                </div>
            </td>
        </tr>
        <tr>
            <th>
                <%=Tag("上架日期")%>：
            </th>
            <td>
                <input type="text" shop="true" name="Time_OnSale" value="<%=FormatTime(model.Time_OnSale) %>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" id="Time_OnSale" class="input-calendar" style="width: 200px" />
            </td>
        </tr>
        <tr>
            <th>
                浏览权限：
            </th>
            <td>
                <%=userlevels_checkbox("UserLevel_ids_show",model.UserLevel_ids_show,"shop=\"true\"")%>
            </td>
        </tr>
        <tr>
            <th>
                看价权限：
            </th>
            <td>
                <%=userlevels_checkbox("UserLevel_ids_priceshow",model.UserLevel_ids_priceshow,"shop=\"true\"")%>
            </td>
        </tr>
        <tr>
            <th>
                购买权限：
            </th>
            <td>
                <%=userlevels_checkbox("UserLevel_ids_buy",model.UserLevel_ids_buy,"shop=\"true\"")%>
            </td>
        </tr>
        <tr>
            <th>
                购买权限：
            </th>
            <td>
                <input type="text" shop="true" name="Time_OnSale" value="<%=FormatTime(model.Time_OnSale) %>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" id="Text3" class="input-calendar" style="width: 200px" />
            </td>
        </tr>
        <tr>
            <th style="vertical-align:top">
                <%=Tag("内部备注")%>：
            </th>
            <td>
                <textarea id="Remarks" shop="true" name="Remarks" class="textarea" style="height: 60px;width: 500px;"><%=model.Remarks %></textarea>
                <div class="tools clear">
                    <ul>
                        <li class="plus"><a href="javascript:void(0);" onclick="javascript:resizeEditor('Remarks',100);"><b></b><span><%=Tag("展开")%></span></a></li>
                        <li class="minus"><a href="javascript:void(0);" onclick="javascript:resizeEditor('Remarks',-100)"><b></b><span><%=Tag("收缩")%></span></a></li>
                    </ul>
                </div>
            </td>
        </tr>
        <tr>
            <th>
                <%=Tag("站点")%>：
            </th>
            <td>
                <%=site.SiteCheckbox("Site_ids",model.Site_ids,CurrentLanguage.Code)%>
            </td>
        </tr>
    </table>
    <table id="table3" cellpadding="0" cellspacing="0" width="100%" class="table" style="display: none">
        <tbody id="shuxing">
        </tbody>
        <%if (CountSon(model.id) > 0)
          { %><tr>
            <th>
                &nbsp;
            </th>
            <td>
                <label title="<%=Tag("同步更新子商品")%>">
                    <input type="checkbox" name="UpdateProPerty133" shop="true" id="UpdateProPerty133" value="1" /><em><%=Tag("同步")%></em></label><%} %>
            </td>
        </tr>
    </table>
    <table id="table5" cellpadding="0" cellspacing="0" width="100%" class="table">
        <tr>
            <th>
                <%=Tag("市场价")%>(<%=DefaultCurrency.Msige%>)：
            </th>
            <td>
                <input type="text" id="Price_Market" shop="true" min="notnull" name="Price_Market"
                    class="input" style="width: 70px;" value="<%=model.Price_Market %>" onkeyup="value=value.replace(/[^.\d]/g,'')"
                    onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^.\d]/g,''))" />
                <%if (CountSon(model.id) > 0)
                  { %><label title="<%=Tag("同步更新子商品")%>"><input type="checkbox"
                    name="UpdatePrice_Market" shop="true" id="UpdatePrice_Market" value="1" /><em><%=Tag("同步")%></em></label><%} %>
            </td>
        </tr>
        <%if (Shop.Bussiness.EX_Admin.CheckPower("product_price_cost")){ %>
        <tr>
            <th>
                <%=Tag("成本价")%>(<%=DefaultCurrency.Msige%>)：
            </th>
            <td>
                <input type="text" class="input" shop="true" min="notnull" id="Price_Cost" name="Price_Cost"
                    style="width: 70px;" value="<%=model.Price_Cost %>" onkeyup="value=value.replace(/[^.\d]/g,'')"
                    onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^.\d]/g,''))" />
                <%if (CountSon(model.id) > 0)
                  { %><label title="<%=Tag("同步更新子商品")%>"><input type="checkbox"
                    name="UpdatePrice_Cost" shop="true" id="UpdatePrice_Cost" value="1" /><em><%=Tag("同步")%></em></label><%} %>
            </td>
        </tr>
        <%}%>
        <tr>
            <th>
                <%=Tag("销售价")%>(<%=DefaultCurrency.Msige%>)：
            </th>
            <td>
                <input type="text" class="input" id="Price" shop="true" min="notnull" name="Price"
                    style="width: 70px;" value="<%=model.Price %>" onkeyup="value=value.replace(/[^.\d]/g,'')"
                    onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^.\d]/g,''))" />
                <%if (CountSon(model.id) > 0)
                  { %><label title="<%=Tag("同步更新子商品")%>"><input type="checkbox"
                    name="UpdatePrice" shop="true" id="UpdatePrice" value="1" /><em><%=Tag("同步")%></em></label><%} %>
            </td>
        </tr>
        <tr>
            <th>
                <%=Tag("阶梯价格")%>：
            </th>
            <td align="left">
                 <table cellpadding="0" cellspacing="0" style="width:350px" class="steppricetable" align="left" id="steppricetable">
                    <tr>
                        <th style="width:150px;text-align:center;">
                            <%=Tag("购买数量")%> >
                        </th>
                        <th style="width:150px;text-align:center;">
                            <%=Tag("价格")%>
                        </th>
                        <th style="width:100px;text-align:center;">
                            <%=Tag("操作")%> [<a href="javascript:addsteppricerow();"><%=Tag("增加")%></a>]
                        </th>
                    </tr>
                    <%foreach(Shop.Model.ProductStepPrice stepprice in StepPrices){ %>
                    <tr>
                        <td>
                            <input type="text" class="input"  shop="true"  name="step_count" style="width: 70px;" value="<%=stepprice.Count %>" onkeyup="value=value.replace(/[^\d]/g,'')" />
                        </td>
                        <td>
                            <input type="text" class="input"  shop="true"  name="step_price" style="width: 70px;" value="<%=stepprice.Price %>" onkeyup="value=value.replace(/[^.\d]/g,'')" />
                        </td>
                        <td>
                            <a href="javascript:void(0);" onclick="$(this).parent().parent().remove();"><%=Tag("删除")%></a>
                        </td>
                    </tr>
                    <%} %>
                 </table>
                 <%if (CountSon(model.id) > 0)
                  { %><label title="<%=Tag("同步更新子商品")%>"><input type="checkbox"
                    name="UpdateStepPrice" shop="true" id="UpdateStepPrice" value="1" /><em><%=Tag("同步")%></em></label><%} %>
            </td>
        </tr>
    </table>
    <div id="table4">
    </div>

          <%}else{%>
            <%=PageReturnMsg%>
          <%}%>
        </div>
    </div>
    
    <div class="bottom" id="body_bottom">
    </div>
    <input type="hidden" value="<%=action %>" id="action" />
    <script type="text/javascript">
        LanguageTab_EditPage('<%=CurrentLanguage.Code %>'); //加载默认语言
        function SaveObj(type) {
            <%foreach (Shop.Model.Lebi_Language_Code lang in Shop.Bussiness.Language.Languages()){%>
            var editor<%=lang.Code %> = CKEDITOR.instances.Description<%=lang.Code %>;
            $("#Description<%=lang.Code %>").val(editor<%=lang.Code %>.getData());
            <%-- 
            var editor1<%=lang.Code %> = CKEDITOR.instances.Specification<%=lang.Code %>;
            $("#Specification<%=lang.Code %>").val(editor1<%=lang.Code %>.getData());
            var editor2<%=lang.Code %> = CKEDITOR.instances.Packing<%=lang.Code %>;
            $("#Packing<%=lang.Code %>").val(editor2<%=lang.Code %>.getData());
            var editor3<%=lang.Code %> = CKEDITOR.instances.Service<%=lang.Code %>;
            $("#Service<%=lang.Code %>").val(editor3<%=lang.Code %>.getData());
            --%>
            <%if (wap){ %>
            var editor4<%=lang.Code %> = CKEDITOR.instances.MobileDescription<%=lang.Code %>;
            $("#MobileDescription<%=lang.Code %>").val(editor4<%=lang.Code %>.getData());
            <%} %>
            <%} %>
            if (!CheckForm("shop", "span"))
                return false;
            var postData = GetFormJsonData("shop");
            var action = $("#action").val();
            var url = "<%=site.AdminPath %>/ajax/ajax_product.aspx?__Action=Product_Edit&id=<%=model.id %>";
            RequestAjax(url,postData,function(res){
                if (type == 1 || '<%=t %>'=='copy'){
                    MsgBox(1, "<%=Tag("操作成功")%>", "?id="+res.id);
                }else{
                    MsgBox(1, "<%=Tag("操作成功")%>", refPage);
                }
            });
        }
            function uploadImage(id) {
                $.ajaxFileUpload
            (
                {
                    url: WebPath + '/ajax/imageupload.aspx',
                    secureuri: false,
                    fileElementId: 'file_' + id,
                    dataType: 'json',
                    success: function (data, status) {
                        if (data.msg != 'OK') {
                            MsgBox(2, data.msg, "");
                        }
                        else {
                            var imageUrl = data.img;
                            if (imageUrl.length > 0) {
                                $("#image_" + id + "").html('<img height="30" src="<%=webconfig.ImageURL%>'+ imageUrl + '">');
                                $("#" + id + "").val(imageUrl);
                            }
                        }
                    }
                }
            )
            }
        function ChangePro_Type() {
            var id = $("#Pro_Type_id").val();
            $.ajax({
                type: "POST",
                url: "product_edit_part.aspx?tid=" + id + "&pid=<%=model.id %>",
                data: '',
                success: function (res) {
                    $("#shuxing").html(res);
                }
            });
        }
        function Edit(id1) {
            $("#p"+id1+"").addClass("selected");
            $("#table" + id1).show();
            $("#action").val(id1);
            var id2 = 2;
            var id3 = 3;
            var id4 = 4;
            var id5 = 5;
            switch (id1) {
                case 1:
                    id2 = 2;id3 = 3;id4 = 4;id5 = 5;break;
                case 2:
                    getImages();ChangeProductType();ChangeProductStatus();
                    GetProductType(<%=model.Pro_Type_id %>);
                    id2 = 1;id3 = 3;id4 = 4;id5 = 5;break;
                case 3:
                    ChangePro_Type();
                    id2 = 2;id3 = 1;id4 = 4;id5 = 5;break;
                case 4:
                    getproducts();
                    id2 = 2;id3 = 3;id4 = 1;id5 = 5;break;
                case 5:
                    id2 = 2;id3 = 3;id4 = 1;id5 = 4;break;
            }
            $("#p" + id2).removeClass("selected");
            $("#p" + id3).removeClass("selected");
            $("#p" + id4).removeClass("selected");
            $("#p" + id5).removeClass("selected");
            $("#table" + id2).hide();
            $("#table" + id3).hide();
            $("#table" + id4).hide();
            $("#table" + id5).hide();
        }
        function CreateProduct(){
            if (!confirm("<%=Tag("确认要生成同款的商品数据吗？")%>"))
                return false;
            var ggs=GetChkCheckedValues("Property131");
            var pid=<%=model.id %>;
            var tid=$("#Pro_Type_id").val();
            var postData={ "ggs": ggs,"pid":pid,"tid":tid};
            var url = "<%=site.AdminPath %>/ajax/ajax_product.aspx?__Action=CreateProductGuiGe";
            RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "");getsubproducts();});
        }
        function Product_Del() {
            if (!confirm("<%=Tag("确认要删除吗？")%>"))
                return false;
            var postData = GetFormJsonData("ShopKeyID");
            var action = $("#action").val();
            var url = "<%=site.AdminPath %>/ajax/ajax_product.aspx?__Action=Product_Del";
            RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "");getsubproducts();});
        }
        function Product_Edit_muti() {
            var postData = GetFormJsonData("sonproduct");
            var action = $("#action").val();
            var url = "<%=site.AdminPath %>/ajax/ajax_product.aspx?__Action=Product_Edit_muti_price_store&pid=<%=id %>";
            RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "")});
        }
        function Product_Status_Edit_muti(status) {
            var postData = GetFormJsonData("ShopKeyID");
            var action = $("#action").val();
            var url = "<%=site.AdminPath %>/ajax/ajax_product.aspx?__Action=Product_Status_Edit_muti&status="+status;
            RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "");getsubproducts();});
        }
        function Product_Name_Edit(id) {
            var title_ = "<%=Tag("编辑商品名称")%>";
            var url_ = "product_name_edit_window.aspx?pid=<%=id %>&id=" + id;
            var width_ = 560;
            var height_ = 200;
            var modal_ = true;
            EditWindow(title_, url_, width_, height_, modal_);
        }
        function Product_Remark_Edit(id) {
            var title_ = "<%=Tag("内部备注")%>";
            var url_ = "product_remark_edit_window.aspx?pid=<%=id %>&id=" + id;
            var width_ = 560;
            var height_ = 250;
            var modal_ = true;
            EditWindow(title_, url_, width_, height_, modal_);
        }
        function Product_Image_Edit() {
            var ids = GetChkCheckedValues("sonproductid");
            if (ids == "") {
                MsgBox(2, "<%=Tag("请选择要修改的商品")%>", "");
                return;
            }
            var title_ = "<%=Tag("批量编辑商品图片")%>";
            var url_ = "product_image_edit_window.aspx?id=<%=id %>&ids=" + ids;
            var width_ = 600;
            var height_ = 300;
            var modal_ = true;
            EditWindow(title_, url_, width_, height_, modal_);
        }
        function getproducts() {
            <%if (model.id > 0 && model.Product_id != 0) {%>
               return false;
            <%} %>
            var id = $("#Pro_Type_id").val();
            var Property131=GetChkCheckedValues("Property131");
            var ProPertyMain=$("#ProPertyMain").val();
            $.ajax({
                type: "POST",
                url: "product_edit_list.aspx?tid="+ id +"&pid=<%=model.id %>&Property131="+ Property131 +"&ProPertyMain="+ProPertyMain,
                data: '',
                success: function (res) {
                    $("#div_error").dialog('close'); 
                    $("#table4").html(res);
                }
            });
        }
        function getImages() {
            var images = $("#Images").val();
            $.ajax({
                type: "POST",
                url: "<%=site.AdminPath %>/product/imagesupload.aspx?input=Images&pid=<%=model.id %>",
                data: { "images": images },
                success: function (res) {
                    $("#imagesdiv").html(res);
                }
            });
        }
        function ChangeProductType(){
            var Type_id_ProductType=$("input[name='Type_id_ProductType']:checked").val();
            if(Type_id_ProductType==321){
                $("#qianggoubody").show();
                $("#pricename").html("<%=Tag("抢购价") %>(<%=DefaultCurrency.Msige%>)");
            }else if(Type_id_ProductType==322){
                $("#qianggoubody").show();
                $("#pricename").html("<%=Tag("团购价") %>(<%=DefaultCurrency.Msige%>)");
            }else if(Type_id_ProductType==323){
                $("#qianggoubody").show();
                $("#pricename").html("<%=Tag("换购积分") %>");
            }else{
                $("#qianggoubody").hide();
            }
        }
        function ChangeProductStatus(){
            var Type_id_ProductStatus=$("input[name='Type_id_ProductStatus']:checked").val();
            if(Type_id_ProductStatus==103){
                $("#FreezeRemarkbody").show();
            }else{
                $("#FreezeRemarkbody").hide();
            }
        }
        function addsteppricerow()
        {
            var row='<tr><td><input type="text" class="input"  shop="true"  name="step_count" style="width: 70px;" value="" onkeyup="value=value.replace(/[^\\d]/g,\'\')" /></td>';
            row+='<td><input type="text" class="input"  shop="true"  name="step_price" style="width: 70px;" value="" onkeyup="value=value.replace(/[^.\\d]/g,\'\')" /></td>';
            row+='<td><a href="javascript:void(0);" onclick="$(this).parent().parent().remove();"><%=Tag("删除")%></a></td></tr>';
            $("#steppricetable").append(row);
        }
        $(function () {
            Edit(<%=action %>);
            $("#Pro_Type_id_other").multiselect2side({
                selectedPosition: "right",
                moveOptions: false,
                //search: "<img src='img/search.gif' align=\"absmiddle\" /> ",
                labelsx: "",
                labeldx: "",
                autoSort: false,
                autoSortAvailable: false
            });
            $("#Supplier_ProductType_ids").multiselect2side({
                selectedPosition: "right",
                moveOptions: false,
                //search: "<img src='img/search.gif' align=\"absmiddle\" /> ",
                labelsx: "",
                labeldx: "",
                autoSort: false,
                autoSortAvailable: false
            });
        }); 
    </script>

    <div id="body_foot">
        <div class="foot">
            <div class="copy" id="lebicopy">
                <asp:Label ID="LBLicense" runat="server"></asp:Label>
            </div>
            <div class="lang">
                <ul class="droplang">
                    <li class="lang_li"><a class="noclick">
                        <%int langi = 0;
                          if (CurrentAdminLanguage.Name == "")
                            {%><%=Tag("语言选择")%><%}else{%><%=CurrentAdminLanguage.Name%><%} %></a>
                        <dl class="lang_li_content">
                            <%foreach (Shop.Model.Lebi_Language_Code langc in langs)
                              {
                                  langi++; if (langi== langs.Count)
                                  {%>
                            <dd class="last"><%}
                                  else
                                  {%><dd><%} %>
                            <a href="javascript:SetLanguage('<%=langc.Code %>','<%=langc.Name %>');"><%=langc.Name %></a></dd>
                                  <%} %>
                        </dl>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
</div>
<div id="sound"></div>
<script src="<%=site.AdminJsPath %>/lightbox/lightbox.min.js"></script>
<script>
    function Copyright() {
        var title_ = "<%=Tag("关于")%>";
        var url_ = "<%=site.AdminPath %>/Config/Copyright_window.aspx";
        var width_ = 500;
        var height_ = 'auto';
        var modal_ = true;
        EditWindow(title_, url_, width_, height_, modal_);
    }
    function UpdateCache(type) {
        var postData = ""; 
        if (type == 0){
            postData = {'datatype':'languagetag,producttype,config,themepage'};
        }else{
            postData = {'datatype':'dbbody,lebitype,lebimenu,lebipage'};
        }
        var url = "<%=site.AdminPath %>/ajax/ajax_db.aspx?__Action=CacheReset";
        RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "")});
    }
    function updateadmin(){
        var url="<%=site.AdminPath %>/ajax/ajax_site.aspx?__Action=UpdateAdmin";
        RequestAjax(url,"",function(res){RequestAjax("<%=site.AdminPath %>/ajax/ajax_db.aspx?__Action=CacheReset","{'datatype':'dbbody'}",function(){MsgBox(1, "<%=Tag("操作成功")%>", "")});});
    }
    function NewEvent(){
        GetNewEvent();
        setTimeout(function(){NewEvent();},<%=SYS.NewEventTimes%>);
    }
    function PlayAudio(){
        <%if (config.NewEventPlayAudio=="1"){%>
        $('#sound').html('<audio autoplay="autoplay"><source src="<%=site.AdminImagePath %>/msg.mp3" type="audio/mpeg"><source src="<%=site.AdminImagePath %>/msg.wav" type="audio/wav"></audio>');
        <%}%>
    }
    setTimeout(function(){NewEvent();},<%=LeftNewEventTimes%>);
</script>
</body>
</html>