﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Admin.Config.Currency_Edit_window" validateRequest="false"%>

<table class="table">
    <tr>
        <th style="width: 20%">
            <%=Tag("代码")%>：
        </th>
        <td style="width: 80%">
            <input type="text" id="Code" name="Code" class="input" shop="true" min="notnull" style="width: 200px;" value="<%=model.Code %>" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("名称")%>：
        </th>
        <td>
           <input type="text" id="Name" name="Name" class="input" shop="true" min="notnull" style="width: 200px;" value="<%=model.Name %>" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("货币符号")%>：
        </th>
        <td>
           <input type="text" id="Msige" name="Msige" class="input" shop="true" min="notnull" style="width: 70px;" value="<%=model.Msige %>" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("汇率")%>：
        </th>
        <td>
           <input type="text" id="ExchangeRate" name="ExchangeRate" onkeyup="value=value.replace(/[^\d\.]/g,'')" class="input" shop="true" min="notnull" style="width: 70px;" value="<%=model.ExchangeRate %>" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("小数")%>：
        </th>
        <td>
            <label><input type="radio" name="DecimalLength" shop="true" value="0" <%=model.DecimalLength==0?"checked":"" %>>0</label>
            <label><input type="radio" name="DecimalLength" shop="true" value="1" <%=model.DecimalLength==1?"checked":"" %> />1</label>
            <label><input type="radio" name="DecimalLength" shop="true" value="2" <%=model.DecimalLength==2?"checked":"" %> />2</label>
            <label><input type="radio" name="DecimalLength" shop="true" value="3" <%=model.DecimalLength==3?"checked":"" %> />3</label>
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("是否默认")%>：
        </th>
        <td>
            <label><input type="radio" name="IsDefault" shop="true" value="1" <%=model.IsDefault==1?"checked":"" %>><%=Tag("是")%></label>
            <label><input type="radio" name="IsDefault" shop="true" value="0" <%=model.IsDefault==0?"checked":"" %> /><%=Tag("否")%></label>
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("排序")%>：
        </th>
        <td>
           <input type="text" id="Sort" name="Sort" onkeyup="value=value.replace(/[^\d]/g,'')" class="input" shop="true" min="notnull" style="width: 70px;" value="<%=model.Sort %>" />
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
        var url = "<%=site.AdminPath %>/ajax/ajax_site.aspx?__Action=Currency_Edit&id=<%=model.id %>";
        RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "?")});
    }
</script>

  