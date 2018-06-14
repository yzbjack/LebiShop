﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Shop.Bussiness.PageBase.AdminCustomPageBase.cs" Inherits="Shop.Bussiness.AdminCustomPageBase" %>
<%@ Import Namespace="Shop.Bussiness" %>
<%@ Import Namespace="Shop.Model" %>
<%@ Import Namespace="System.Collections.Generic" %>
<%
int id = Rint("id");
Lebi_Order model = B_Lebi_Order.GetModel(id);
if (model == null)
{
    model = new Lebi_Order();
}
List<Lebi_Order_Product> pros = B_Lebi_Order_Product.GetList("Order_id=" + model.id + "", "");
List<Lebi_Comment> comms = B_Lebi_Comment.GetList("TableName='Order' and Keyid=" + model.id + " and User_id = "+ model.User_id +" and Admin_id = 0", "id desc");
%>
<html>
<head>
<title><%=Tag("装箱单")%>-<%=Tag("单据打印")%>-<%=site.title%></title>
<META name="author" content="LebiShop">
<link rel="stylesheet" type="text/css" href="<%=site.AdminCssPath %>/css.css">
<script type="text/javascript" language="javascript" src="<%=site.AdminJsPath %>/jquery-1.7.2.min.js"></script>
<script type="text/javascript" language="javascript" src="<%=site.AdminJsPath %>/messagebox.js"></script>
<script type="text/javascript" language="javascript" src="<%=site.AdminJsPath %>/jquery-ui.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=site.AdminJsPath %>/jqueryuicss/redmond/jquery-ui.css" />
<style>
body{background:#fff;margin:0;padding:0;font-size:12px;text-align:left}h1,h2,h3{text-align:center;font-weight:bold;}h1{font-size:22px},h2{font-size:18px}h3{font-size:14px}input{font-size:12px}.order-print{width:754px;margin:0 auto}.order-print table{width:100%; margin-bottom:10px;border-collapse:collapse;}.order-print table td{border-bottom:1px solid #000}.order-print table th{text-align:left;font-weight:normal}
.order-print h2{margin:0 0 10px 0; padding:10px 0; border-bottom:1px dotted #000; font-weight:bold; font-size:15px; text-align:Center}
.order-print .headmenu{padding-left:5px; height:27px;color:#666;font-size:13px;font-weight:bold}
.order-print .list{border-top:1px solid #000}
.order-print .list th{padding-left:5px; line-height:25px; font-weight:normal; text-align:left; border-bottom:1px solid #000}
.order-print .list td{padding-left:5px; line-height:25px; text-align:left; background:#fff; border-bottom:1px solid #fff}
.order-print .list TR.list {background-color:expression((this.rowIndex%2==0)?"#FFFFFF":"#FFFFFF")}
.order-print .list TH.list .pro-pic {width: 45px; height: 45px}
.order-print .list TH.list .pro-pic IMG {width: expression(this.width > 45 ? 45 : true); height: expression(this.height > 45 ? 45 : true); max-width: 45px; max-height: 45px; vertical-align: middle; text-align: center}
</style>
<style media=print>.print-btn{display:none;}</style>
</head>
<body>
<div class="print-btn">
    <div class="tools">
        <ul>
            <li class="print"><a href="javascript:void(0);" onclick="window.print();"><b></b><span><%=Tag("打印")%></span></a></li>
            <li class="close"><a href="javascript:void(0);" onclick="window.close();"><b></b><span><%=Tag("关闭")%></span></a></li>
        </ul>
    </div>
</div>
<div class="order-print">
<table cellspacing="0" cellpadding="0" style="width:600px">
<tr>
<td style="padding-left:35px"><img src="/theme/mojoii/images/print-logo.jpg" /></td>
</tr>
<tr>
<td style="font-size:20px; font-weight:bold">WWW.MOJOII.COM</td>
</tr>
</table>
<table cellspacing="0" cellpadding="0" style="margin-top:20px; width:600px">
<tr>
<th colspan="4" style="padding:0 0 0 5px; color:#BA8D63; font-weight:bold">Packing Slip</th>
</tr>
<tr>
<th style="width:60px; font-weight:bold">Ship To:</th>
<th style="width:190px"><%=model.T_Name %></th>
<th style="width:70px; font-weight:bold">Ship From:</th>
<th style="width:190px; line-height:100%">MojoII<br />http://www.mojoii.com</th>
</tr>
<tr>
<th style="font-weight:bold">Address:</th>
<th style="line-height:100%"><%=model.T_Address %>&nbsp;<%=model.T_Postalcode %><br /><%=Shop.Bussiness.EX_Area.GetAreaNameDesc(model.T_Area_id,999)%></th>
<th style="font-weight:bold">Address:</th>
<th style="line-height:100%">PO BOX 13616<br />Mill Creek,WA 98082<br />United States</th>
</tr>
<tr>
<th style="font-weight:bold">Email:</th>
<th><%=model.T_Email %></th>
<th style="font-weight:bold">Email:</th>
<th style="line-height:100%">mojoii@live.com</th>
</tr>
</table>

<table cellspacing="0" cellpadding="0" border="1" align="center" class="list" style="width:600px">
<tr>
<th colspan="5" style="padding:0 0 0 5px">Transaction ID:<%=model.Code %></th>
</tr>
<tr>
<th style="width:15%;">Item #</th>
<th style="width:35%;">Item Title</th>
<th style="width:10%;">Qty</th>
<th style="width:10%;">Price</th>
<th style="width:10%;">Subtotal</th>
</tr>
<%int totalqty = 0;decimal totalnetweight = 0;decimal totalweight = 0;decimal totalvolume = 0; foreach (Shop.Model.Lebi_Order_Product pro in pros)
  { %>
<tr class="list">
<th class="list"><%=pro.Product_Number%>&nbsp;</th>
<th class="list"><%=Shop.Bussiness.Language.Content(pro.Product_Name, CurrentLanguage)%><%if (pro.ProPerty134!=""){ %>&nbsp;&nbsp;<%=pro.ProPerty134%><%} %></th>
<th class="list"><%=pro.Count%></th>
<th class="list"><%=FormatMoney(pro.Price)%></th>
<th class="list"><%=FormatMoney(pro.Money)%></th>
</tr>
<%totalqty += pro.Count;totalnetweight += pro.NetWeight;totalweight += pro.Weight;totalvolume += pro.Volume;;
  } %>
</table>
<table cellspacing="0" cellpadding="0" border="0" style="width:600px">
<tr>
<th style="padding:0; width:540px; text-align:right; font-weight:bold">Shipping & Handling:</th>
<th style="padding:0; width:80px"><%=FormatMoney(model.Money_Transport)%></th>
</tr>
<tr>
<th style="padding:0; width:540px; text-align:right; font-weight:bold">Shipping Insurance:</th>
<th style="padding:0; width:80px"><%=FormatMoney(0)%></th>
</tr>
<tr>
<th style="padding:0; width:540px; text-align:right; font-weight:bold">Total:</th>
<th style="padding:0; width:80px"><%=FormatMoney(model.Money_Order)%></th>
</tr>
</table>
</div>
</body>
</html>