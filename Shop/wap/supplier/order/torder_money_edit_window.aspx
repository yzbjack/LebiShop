﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Supplier.order.torder_money_edit_window" validateRequest="false"%>

<table cellspacing="0" border="0" style="width: 100%; border-collapse: collapse;"
    class="table">
    
<%--    <tr>
        <th>
            <%=Tag("运费")%>：
        </th>
        <td>
            <input type="text" shop="true" min="notnull" id="Money_Transport" name="Money_Transport" class="input"
                value="<%=model.Money_Transport %>" style="width: 100px;" onkeyup="value=value.replace(/[^\d\.]/g,'')" />
        </td>
    </tr>--%>
    <tr>
        <th>
            <%=Tag("退款金额")%>：
        </th>
        <td>
            <input type="text" shop="true" min="notnull" id="Money_Give" name="Money_Give" class="input"
                value="<%=model.Money_Give %>" style="width: 100px;" onkeyup="value=value.replace(/[^\d\.]/g,'')" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("扣除积分")%>：
        </th>
        <td>
            <input type="text" shop="true" min="notnull" id="Point" name="Point"
                class="input" value="<%=model.Point %>" style="width: 100px;" onkeyup="value=value.replace(/[^\d\.]/g,'')" />
        </td>
    </tr>
     <tr>
        <td colspan="2" class="action">
            <div class="tools tools-m clear">
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
        var url = "<%=site.AdminPath %>/ajax/ajax_order.aspx?__Action=Order_Money_Edit&id=<%=model.id %>";
        RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "?")});
    }
</script>

  