﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.inc.OftenBuyDialog" validateRequest="false"%><%LoadPage();%>

<div class="user">
<table cellpadding="0" cellspacing="0" width="100%" class="tableform">
    <tbody>
        <tr>
            <th style="width:100px;text-align:left">
                <%=Tag("购买周期")%>：
            </th>
            <td>
                <input name="warndays" id="warndays" size="5" type="text" min="notnull" shop="true" class="input" /> <%=Tag("天")%>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <a href="javascript:void(0)" onclick="submitofftenbuy();" class="btn btn-11"><s></s><%=Tag("提交")%></a>
                <input name="type" id="type" type="hidden" value="144" shop="true" /><input name="pid" id="pid" type="hidden" value="<%=pid %>" shop="true" /><input name="num" id="num" type="hidden" value="<%=num %>" shop="true" /><input name="property" id="property" type="hidden" value="<%=property %>" shop="true" />
            </td>
        </tr>
    </tbody>
</table>
</div>
<script type="text/javascript">
    function submitofftenbuy() {
        var postData = GetFormJsonData("shop"); 
        if (!CheckForm("shop", "span"))
            return false;
        var url = path+"/ajax/Ajax_user.aspx?__Action=UserProduct_Edit";
        RequestAjax(url, postData, function (data) { MsgBox(1, data.mes, "");});
    }
</script>

  