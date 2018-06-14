﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.supplier.product.Brand" validateRequest="false"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta content="text/html; charset=UTF-8" http-equiv="content-type" />
<meta name="author" content="LebiShop" />

    <title><%=Tag("品牌管理")%>-<%=site.title%></title>

<link rel="stylesheet" type="text/css" href="<%=site.AdminCssPath %>/css.css" />
<script type="text/javascript" src="<%=site.AdminJsPath %>/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=site.AdminJsPath %>/ajaxfileupload.js"></script>
<script type="text/javascript" src="<%=site.AdminJsPath %>/main.js"></script>
<script type="text/javascript" src="<%=site.AdminJsPath %>/messagebox.js"></script>
<script type="text/javascript" src="<%=site.AdminJsPath %>/Cookies.js"></script>
<script type="text/javascript" src="<%=site.AdminJsPath %>/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=site.WebPath %>/Editor/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="<%=site.WebPath %>/Editor/ckfinder/ckfinder.js"></script>
<script type="text/javascript" src="<%=site.AdminJsPath %>/master.js"></script>
<link rel="stylesheet" type="text/css" href="<%=site.AdminJsPath %>/jqueryuicss/redmond/jquery-ui.css" />
<script type="text/javascript" src="<%=site.AdminJsPath %>/multiselect/js/jquery.multiselect2side.js"></script>
<link rel="stylesheet" href="<%=site.AdminJsPath %>/multiselect/css/jquery.multiselect2side.css" type="text/css" media="screen" />
<script type="text/javascript">
    var AdminPath = "<%=site.AdminPath %>";var WebPath ="<%=site.WebPath %>";var AdminImagePath = "<%=site.AdminImagePath %>";var requestPage = "<%=Shop.Tools.RequestTool.GetRequestUrl().ToLower() %>";var refPage = "<%=Shop.Tools.RequestTool.GetUrlReferrer().ToLower() %>";
    function quit() { if (confirm("<%=Tag("您确定要退出吗？")%>")) return true; else return false; }
    </script>
</head>
<body>
<div id="body_head">
    <div id="logo">
      <span><a href="<%=site.AdminPath %>/ajax/ajax_supplier.aspx?__Action=MenuJump&pid=0"><%=Lang(CurrentSupplier.Name)%></a></span>
    </div>
    <div id="service">
        <div class="layout">
          <span><em><%=Tag("您好！")%></em>[<%=CurrentSupplier.SubName%>|<%=CurrentSupplierUserGroup.Name%>]<%=CurrentSupplierUser.RemarkName%>&nbsp;&nbsp;<a href="<%=site.AdminPath %>/config/password.aspx"><%=Tag("改密")%></a>&nbsp;|&nbsp;<a href="<%=site.AdminPath %>/Logout.aspx" onclick="return quit()"><%=Tag("注销")%></a>&nbsp;|&nbsp;<a href="<%=Shop.Bussiness.ThemeUrl.GetURL("P_ShopIndex",CurrentSupplier.id.ToString(),"",CurrentLanguage.Code) %>" target="_blank"><%=Tag("网站前台")%></a></span>
        </div>
    </div>
    <div class="clearfix">
    </div>
    <div class="navmenu">
        <ul class="menu">
            <%foreach (Shop.Model.Lebi_Supplier_Menu menu in TopMenus)
                { %>
            <li class="<%=CurrentTopMenu.id==menu.id?"current":"" %>"><a href="<%=site.AdminPath %>/Ajax/ajax_supplier.aspx?__Action=MenuJump&pid=<%=menu.id %>"><span><%if (menu.Image != ""){ %><img src="<%=GetImage(site.WebPath + menu.Image) %>" height="15px" /><%} %><%=Tag(menu.Name)%></span></a> </li>
            <%} %>
        </ul>
        <%=lbmenu%>
    </div>
</div>
<div id="body_content">
<div id="sidebar">
    <div class="menubar ">
        <%if (desk == 1)
            { 
        %>
        <h2><span><img src="<%=site.AdminImagePath %>/minus.gif" id="img1" /> <%=Tag("快捷菜单")%></span></h2>
        <ul class="clear">
            <%foreach (Shop.Model.Lebi_Supplier_Menu menu in GetIndexMenus()){ %><li><a href="<%=MenuUrl(menu.URL,1) %>"><span><%=Tag(menu.Name)%></span></a></li><%}%>
        </ul>
        <% }else{ %>
        <%foreach (Shop.Model.Lebi_Supplier_Menu pmenu in GetMenus(CurrentTopMenu.id)){ %>
        <h2><span><img mid="<%=pmenu.id %>" src="<%=site.AdminImagePath %>/<%=MenuShow(pmenu.id)==true?"minus":"plus" %>.gif" id="imgStatis" /> <%=Tag(pmenu.Name)%></span></h2>
        <ul class="clear" <%=MenuShow(pmenu.id)==true?"":"style=\"display:none;\"" %>>
            <%foreach (Shop.Model.Lebi_Supplier_Menu menu in GetMenus(pmenu.id)){ %><li><a href="<%=MenuUrl(menu.URL,0) %>"><span><%=Tag(menu.Name)%></span></a></li><%}%>
        </ul>
        <%} } %>
    </div>
</div>
<div id="sideplus">
    <a onclick="switchSysBar()"><span class="navPoint" id="switchPoint" title="<%=Tag("关闭/打开左栏")%>"><img src="<%=site.AdminImagePath%>/vertical/left.png" alt="<%=Tag("关闭/打开左栏")%>" /></span></a>
</div>
<div id="sidecontent" class="clear">
    <div class="mainbody_path" id="body_path">
      
    <div class="tools">
    <ul>
    <li class="add"><a href="javascript:void(0);" onclick="Edit(0);"><b></b><span><%=Tag("添加")%></span></a></li>
    <li class="submit"><a href="javascript:void(0);" onclick="Edits();"><b></b><span><%=Tag("保存")%></span></a></li>
    <li class="del"><a href="javascript:void(0);" onclick="Del();"><b></b><span><%=Tag("删除")%></span></a></li>
    <li class="name"><span id="navIgation"><%=Tag("当前位置")%>：<a href="<%=site.AdminPath %>/Ajax/ajax_admin.aspx?__Action=MenuJump&pid=0"><%=Tag("管理首页")%></a> > <%=Tag("品牌管理")%></span></li>
    </ul>
    </div>

    </div>
      
      
    <div class="mainbody" id="body_main">
        <div id="body_main_form" style="min-width:1200px;width:100%">
          
    <div class="searchbox">
        <select name="type" id="type">
            <option value="">┌<%=Tag("全部分类")%></option>
            <%=Shop.Bussiness.EX_Product.TypeOption(0, type, 0, CurrentLanguage.Code)%>
        </select>
        <input type="text" id="key" name="key" class="input-query" value="<%=key %>" onkeydown="if(event.keyCode==13){search_();}" /><input type="button" id="btnSou" class="btn-query" onclick="search_();" />
    </div>
    <table cellspacing="0" border="0" id="list" style="width: 100%; border-collapse: collapse;" class="datalist">
        <tr class="title">
            <th style="width: 40px" class="selectAll">
                <a href="javascript:void(0);" onclick="$('input[name=\'Delid\']').attr('checked',!$(this).attr('checked'));$(this).attr('checked',!$(this).attr('checked'));"><%=Tag("全选")%></a>
            </th>
            <th style="width: 40px">
                <%=Tag("ID")%>
            </th>
            <th style="width: 200px">
                <%=Tag("品牌名称")%>
            </th>
            <th style="width: 150px">
                <%=Tag("图片")%>
            </th>
            <th style="width: 80px">
                <%=Tag("首字母")%>
            </th>
            <th style="width: 80px">
                <%=Tag("商品数量")%>
            </th>
            <th style="width: 80px">
                <%=Tag("状态")%>
            </th>
            <th>
                <%=Tag("操作")%>
            </th>
        </tr>
        <%foreach (Shop.Model.Lebi_Brand model in models)
          {%>
        <tr class="list" ondblclick="Edit(<%=model.id %>);" >
            <td align="center">
                <input type="checkbox" name="Delid" del="true" value="<%=model.id %>" />
                <input type="hidden" name="IDS" shop="true" value="<%=model.id %>" />
            </td>
            <td>
                <%=model.id%>
            </td>
            <td>
                <%=Lang(model.Name)%>&nbsp;<a href="<%=Shop.Bussiness.ThemeUrl.GetURL("P_Brand", model.id.ToString(), "", CurrentLanguage.Code)%>" target="_blank"><img src="<%=PageImage("icon/newWindow.png")%>" /></a>
                
            </td>
            <td>
                <% if (model.ImageUrl == "")
                   { %>
                &nbsp;
                <%}
                   else
                   { %>
                <img src="<%=site.WebPath + model.ImageUrl %>" style="height: 25px;vertical-align:middle" name="ImageUrl" />
                <%} %>
            </td>
            <td>
                <input type="text" name="FirstLetter<%=model.id %>" shop="true" value="<%=model.FirstLetter %>" class="input" style="width: 70px;" />
            </td>
            <td>
                <a href="default.aspx?Brand_id=<%=model.id %>&Type_id_ProductType=320,321,322,323"><%=Shop.Bussiness.EX_Product.BrandProductCount("Brand_id=" + model.id + " and Supplier_id = " + CurrentSupplier.id +"")%></a>
                
            </td>
            <td><%=Tag(Shop.Bussiness.EX_Type.TypeName(model.Type_id_BrandStatus)) %></td>
            <td>
                <a href="javascript:void(0)" onclick="Edit(<%=model.id %>);"><%=Tag("编辑")%></a>
            </td>
        </tr>
        <%} %>
    </table>
    <script type="text/javascript">
        function search_() {
            var type = $("#type").val();
            var key = $("#key").val();
            window.location = "?key=" + escape(key) + "&type=" + type;
        }
        function Edit(id) {
            var title_ = "<%=Tag("编辑品牌")%>";
            if (id == 0) title_ = "<%=Tag("添加品牌")%>";
            var url_ = "brand_edit_window.aspx?id=" + id;
            var width_ = 750;
            var height_ = 500;
            var modal_ = true;
            EditWindow(title_, url_, width_, height_, modal_);
        }
        function Del() {
            if (!confirm("<%=Tag("确认要删除吗？")%>"))
                return false;
            var postData = GetFormJsonData("del");
            var url = "<%=site.AdminPath %>/ajax/ajax_product.aspx?__Action=Brand_Del";
            RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "?")});
        }
        function Edits() {
            var postData = GetFormJsonData("shop");
            var url = "<%=site.AdminPath %>/ajax/ajax_product.aspx?__Action=Brands_Edit";
            RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "?")});
        }
    </script>

        </div>
    </div>
    
<div class="bottom" id="body_bottom">
    <%=PageString%>
</div>

</div>
</div>
<div id="body_foot">
    <div class="foot">
      <div class="copy" id="lebicopy">
            <asp:Label ID="LBLicense" runat="server"></asp:Label>
        </div>
        <div class="lang">
            <ul class="droplang">
                <li class="lang_li"><a class="noclick">
                    <%int langi = 0;
                      if (CurrentLanguage.Name == "")
                        {%><%=Tag("语言选择")%><%}else{%><%=CurrentLanguage.Name%><%} %></a>
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
<script type="text/javascript">
    function Copyright() {
        var title_ = "<%=Tag("关于")%>";
        var url_ = "<%=site.AdminPath %>/Config/Copyright_window.aspx";
        var width_ = 500;
        var height_ = 310;
        var modal_ = true;
        EditWindow(title_, url_, width_, height_, modal_);
    }
</script>
</body>
</html>