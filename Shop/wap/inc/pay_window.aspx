﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.inc.pay_window" validateRequest="false"%>
<table cellspacing="0" border="0" style="width: 100%; border-collapse: collapse;" id="common" class="table">
    <tr>
        <th>
            <%=Tag("金额")%>：
        </th>
        <td>
            <%=DefaultCurrency.Msige %><%=money %>
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("账户余额")%>：
        </th>
        <td>
            <%=DefaultCurrency.Msige %><%=CurrentUser.Money %>
        </td>
    </tr>
    <%if (CurrentUser.Money < money)
      { %>
    <tr>
        <th>
            
        </th>
        <td>
            <%=Tag("余额不足") %>,<a href="<%=URL("P_Recharge","") %>" target="_blank"><%=Tag("请充值") %></a>
        </td>
    </tr>
    <%}
      else
      { %>
    <tr>
        <th>
            <%=Tag("支付密码")%>：
        </th>
        <td>
            <input id="paypwd" name="paypwd" type="password" value="" class="input"  shop="true" min="notnull" />
            <em></em>
        </td>
    </tr>
   
    <tr>
        <td colspan="2" class="action">
        <div class="tools tools-m clear">
            <ul>
                <li class="submit"><a href="javascript:void(0);" onclick="SaveObj();"><b></b><span><%=Tag("确定")%></span></a></li>
                <li class="add"><a href="<%=URL("P_Recharge","") %>" target="_blank" ><b></b><span><%=Tag("充值")%></span></a></li>
            </ul>
        </div>
        </td>
    </tr>
    <%} %>
</table>
<script type="text/javascript">
    function SaveObj() {
        var paypwd=$("#paypwd").val();
        var postData={"paypwd":paypwd};
        var url = "<%=WebPath %>/ajax/ajax_userin.aspx?__Action=BuyOther&tablename=<%=tablename %>&keyid=<%=keyid %>";
        RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "?")});
    }
</script>