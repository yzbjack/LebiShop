﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Admin.update" validateRequest="false"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta content="text/html; charset=UTF-8" http-equiv="content-type" />
<meta name="author" content="LebiShop" />

    <title>LebiShop升级程序-<%=site.title%></title>

<script src="<%=site.AdminJsPath %>/jquery-3.1.0.min.js"></script>
<script src="<%=site.AdminJsPath %>/jquery-migrate-1.2.1.js"></script>
<script src="<%=site.AdminJsPath %>/Cookies.js"></script>
<script src="<%=site.AdminJsPath %>/main.js"></script>
<script src="<%=site.AdminJsPath %>/messagebox.js"></script>
<script src="<%=site.AdminJsPath %>/jquery-ui/jquery-ui.min.js"></script>
<%if (CurrentLanguage.Code=="CN"){%><script src="<%=site.AdminJsPath %>/jquery-ui/datepicker-zh-CN.js"></script><%}%>
<link rel="stylesheet" type="text/css" href="<%=site.AdminCssPath %>/css.css" />
<link rel="stylesheet" type="text/css" href="<%=site.AdminJsPath %>/jquery-ui/jquery-ui.min.css" />
<link rel="stylesheet" type="text/css" href="<%=site.AdminJsPath %>/jquery-ui/jquery-ui.theme.min.css" />
<script>
  var AdminPath = "<%=site.AdminPath %>";var WebPath ="<%=site.WebPath %>";var AdminImagePath = "<%=site.AdminImagePath %>";var requestPage = "<%=Shop.Tools.RequestTool.GetRequestUrl().ToLower() %>";var refPage = "<%=Shop.Tools.RequestTool.GetUrlReferrer().ToLower() %>";
</script>

<style>body{background:#fff;margin:0;padding:0;font-size:12px;text-align:left}input{font-size:12px}.order-print table{margin-bottom:10px}
.order-print h2{margin:0 0 10px 0; padding:10px 0; border-bottom:1px dotted #000; font-weight:bold; font-size:15px; text-align:Center}
.order-print .headmenu{padding-left:5px; height:27px;color:#666;font-size:13px;font-weight:bold}
.order-print th{padding-left:5px; line-height:25px; font-weight:normal; text-align:left; border-bottom:1px dotted #000}
.order-print td{padding-left:5px; line-height:25px; text-align:left; background:#fff}
.order-print TR.list {background-color:expression((this.rowIndex%2==0)?"#FFFFFF":"#FFFFFF")}
.order-print TD.list {padding-left:3px;border-bottom:1px dotted #000; line-height:25px}
<style media=print>.print-btn{display:none;}</style>

</head>
<body>

<div class="print-btn">
    <div class="tools">
        <ul>
            <%if (model.IsUpdate != 1){ %>
            <li class="submit"><a href="#" class="a-btn" onclick="update();"><b></b><span><%=Tag("开始升级")%></span></a></li>
            <%} %>
            <li class="print"><a href="javascript:void(0);" onclick="window.print();"><b></b><span><%=Tag("打印")%></span></a></li>
            <li class="close"><a href="javascript:void(0);" onclick="window.close();"><b></b><span><%=Tag("关闭")%></span></a></li>
        </ul>
    </div>
</div>
<div class="order-print">
<h2>LebiShop升级程序</h2>
<table>
    <tr>
        <td>目标版本：</td>
        <td><%=model.Version%>.<%=model.Version_Son%></td>
    </tr>
    <%if (model.IsUpdate == 1)
    { %>
    <tr>
        <td>状态：</td>
        <td>已升级</td>
    </tr>
    <%}
    else
    { %>
    <tr>
        <td>下载文件：</td>
        <td id="status_down"><%=IsDown?"已下载":"-" %></td>
    </tr>
    <tr>
        <td>升级数据库：</td>
        <td id="status_db">-</td>
    </tr>
    <tr>
        <td>部署文件：</td>
        <td id="status_file">-</td>
    </tr>
    <%if (model.IsSystemPageUpdate == 1)
    { %>
    <tr>
        <td>刷新系统页面：</td>
        <td id="status_systempage">-</td>
    </tr>
    <%} %>
    <%if (model.IsThemePageUpdate == 1)
    { %>
    <tr>
        <td>刷新前台页面：</td>
        <td id="status_webpage">-</td>
    </tr>
    <%} %>
    <tr>
        <td>更新缓存：</td>
        <td id="status_cache">-</td>
    </tr>
    <%} %>
    <tr>
        <td colspan="2">
            更新说明： <br />
            <%=model.Content %>
        </td>
    </tr>
</table>
<script type="text/javascript">
var loading='<img src="/theme/system/images/load.gif">';
function update(id) {
    <%if (IsDown)
        {%>
    UpdateDB(id);
    <%}
        else
        {%>
    var postData = { "id": <%=model.id%>};
    var url = "<%=site.AdminPath %>/ajax/ajax_service.aspx?__Action=Version_DownLoad";
    $.ajax({
        type: "POST",
        url: url,
        data: postData,
        dataType: "json",
        beforeSend: function () {
            $('#status_down').html(loading);
        },
        success: function (res) {
            if (res.msg == "OK") {
                $('#status_down').html('OK!');
                UpdateDB(id);
            } else {
                $('#status_down').html(res.msg);
            }
        }
    });
    <%}%>
}
//升级数据库
function UpdateDB() {
    var postData = { "id": <%=model.id%>};
    var url = "<%=site.AdminPath %>/ajax/ajax_service.aspx?__Action=Version_DBUpdate";
    $.ajax({
        type: "POST",
        url: url,
        data: postData,
        dataType: "json",
        beforeSend: function () {
            $('#status_db').html(loading);
        },
        success: function (res) {
            if (res.msg == "OK") {
                $('#status_db').html('OK!');
                UpdateFile();
            } else {
                $('#status_db').html(res.msg);
            }
        }
    });
}
//部署文件
function UpdateFile() {
    var postData = { "id": <%=model.id%>};
    var url = "<%=site.AdminPath %>/ajax/ajax_service.aspx?__Action=Version_FileUpdate";
    $.ajax({
        type: "POST",
        url: url,
        data: postData,
        dataType: "json",
        beforeSend: function () {
            $('#status_file').html(loading);
        },
        success: function (res) {
            if (res.msg == "OK") {
                $('#status_file').html('OK!');
                UpdatePage_system();
            } else {
                $('#status_file').html(res.msg);
            }
        }
    });
}
//刷新系统文件
function UpdatePage_system()
{
    <%if (model.IsSystemPageUpdate == 1)
        {%>
    var postData = { "id": <%=model.id%>};
    //var url = "<%=site.AdminPath%>/ajax/ajax_service.aspx?__Action=Version_AdminUpdate";
    var url = "<%=site.AdminPath%>/updatepage.aspx";
    $.ajax({
        type: "POST",
        url: url,
        data: postData,
        dataType: "html",
        beforeSend: function () {
            $('#status_systempage').html(loading);
        },
        success: function (res) {
            if (res == "OK") {
                $('#status_systempage').html('OK!');
                UpdatePage();
            } else {
                $('#status_systempage').html('操作失败，<a href="javascript:UpdatePage_system();">点此重新执行</a>。');
            }
        }
    });
    <%}
        else
        {%>
    UpdatePage();
    <%}%>
}
//刷新前台文件
function UpdatePage()
{
    <%if (model.IsThemePageUpdate == 1)
        {%>
    var postData = { "id": <%=model.id%>};
    var url = "<%=site.AdminPath%>/ajax/ajax_service.aspx?__Action=Version_WebUpdate";
    $.ajax({
        type: "POST",
        url: url,
        data: postData,
        dataType: "json",
        beforeSend: function () {
            $('#status_webpage').html(loading);
        },
        success: function (res) {
            if (res.msg == "OK") {
                $('#status_webpage').html('OK!');
                UpdateCache();
            } else {
                $('#status_webpage').html('操作失败，<a href="javascript:IsThemePageUpdate();">点此重新执行</a>。');
            }
        }
    });
    <%}
        else
        {%>
    UpdateCache();
    <%}%>
}
//刷新缓存
function UpdateCache()
{
    $.ajax({
        type: "POST",
        url: "<%=site.AdminPath %>/ajax/ajax_db.aspx?__Action=CacheReset",
        data: { 'datatype': 'config' },
        dataType: "json",
        beforeSend: function () {
            $('#status_cache').html(loading);
        },
        success: function (res) {
            if (res.msg == "OK") {
                $('#status_cache').html('OK!');
                alert("升级完毕！");
            } else {
                $('#status_cache').html(res.msg);
            }
        }
    });
}
</script>
</div>

</body>
</html>