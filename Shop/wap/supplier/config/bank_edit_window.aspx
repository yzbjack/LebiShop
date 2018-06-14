﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Supplier.Config.Bank_Edit_window" validateRequest="false"%>

<table cellspacing="0" border="0" class="table" style="width: 100%; border-collapse: collapse;">
    <tr>
        <th style="width: 20%;">
            <%=Tag("开户银行")%>：
        </th>
        <td style="width: 80%;">
            <input type="text" shop="true" id="Name" name="Name" class="input" style="width:200px" value="<%=model.Name%>" />
        </td>
    </tr>
    <tr>
        <th style="width: 20%;">
            <%=Tag("银行账号")%>：
        </th>
        <td>
            <input type="text" shop="true" id="Code" name="Code" class="input" style="width:200px" value="<%=model.Code%>" />
        </td>
    </tr>
    <tr>
        <th style="width: 20%;">
            <%=Tag("开户名称")%>：
        </th>
        <td>
            <input type="text" shop="true" id="UserName" name="UserName" class="input" style="width:200px" value="<%=model.UserName%>" />
        </td>
    </tr>
    <tr>
        <td colspan="2" class="action">
            <div class="tools tools-m">
                <ul>
                    <li class="submit"><a href="javascript:void(0);" onclick="SaveObj();"><b></b><span><%=Tag("保存")%></span></a></li>
                </ul>
            </div>
        </td>
    </tr>
</table>
<script type="text/javascript">
    function SaveObj() {
        var postData = GetFormJsonData("shop");
        if (!CheckForm("shop", "span"))
            return false;
        var url = "<%=site.AdminPath %>/ajax/ajax_config.aspx?__Action=Bank_Edit&id=<%=model.id %>";
        RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "?")});
    }
</script>

  