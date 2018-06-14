﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Supplier.Config.Log_Edit_window" validateRequest="false"%>

<table cellspacing="0" border="0" style="width: 100%; border-collapse: collapse;" id="common" class="table">
    <%if (model.AdminName != "")
      { %>
    <tr>
        <th style="width: 20%;">
            <%=Tag("系统用户")%>：
        </th>
        <td>
            <%=model.AdminName %>
        </td>
    </tr>
    <%} %>
    <tr>
        <th >
            <%=Tag("数据表")%>：
        </th>
        <td>
            <%=model.TableName %>
        </td>
    </tr>
    <%if (model.Keyid != "")
      { %>
    <tr>
        <th >
            <%=Tag("主键")%>：
        </th>
        <td>
            <%=model.Keyid%>
        </td>
    </tr>
    <%} %>
    <tr>
        <th >
            <%=Tag("内容")%>：
        </th>
        <td>
            <%=model.Content%>
        </td>
    </tr>
    <%if (model.Description != "")
      { %>
    <tr>
        <th >
            <%=Tag("描述")%>：
        </th>
        <td>
            <%=model.Description%>
        </td>
    </tr>
    <%} %>
    <tr>
        <th >
            <%=Tag("URL")%>：
        </th>
        <td>
            <%=model.URL%>
        </td>
    </tr>
    <%if (model.RefererURL != "")
      { %>
    <tr>
        <th >
            <%=Tag("来源URL")%>：
        </th>
        <td>
            <%=model.RefererURL%>
        </td>
    </tr>
    <%} %>
    <tr>
        <th >
            <%=Tag("IP地址")%>：
        </th>
        <td>
            <%=model.IP_Add%>&nbsp;&nbsp;<%=Shop.Tools.RequestTool.getIpInfoOne(model.IP_Add)%>
        </td>
    </tr>
    <tr>
        <th >
            <%=Tag("时间")%>：
        </th>
        <td>
            <%=FormatTime(model.Time_Add)%>
        </td>
    </tr>
</table>

  