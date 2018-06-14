﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Admin.order.cash_edit_window" validateRequest="false"%>

<table class="table">
    <tr>
        <th style="width:25%">
            <%=Tag("金额")%>：
        </th>
        <td>
            <%=FormatMoney(model.Money-model.Fee) %> = <%=FormatMoney(model.Money) %> - <%=FormatMoney(model.Fee) %>(<%=Tag("手续费")%>)
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("用户")%>：
        </th>
        <td>
           <%if (model.User_id > 0)
             {%>
             [<%=Tag("会员") %>]<%=model.User_UserName %>
           <%}
             else
             { %>
             [<%=Tag("供应商") %>]<%=model.Supplier_SubName%>
           <%} %>
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("收款方式")%>：
        </th>
        <td>
           <%=model.PayType == "alipay"?Tag("支付宝"):Tag("银行转账")%>
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("姓名")%>：
        </th>
        <td>
           <%=model.AccountName%>
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("账号")%>：
        </th>
        <td>
           <%=model.AccountCode%>
        </td>
    </tr>
    <%if (model.PayType == "bank"){ %>
    <tr>
        <th>
            <%=Tag("银行")%>：
        </th>
        <td>
           <%=model.Bank%>
        </td>
    </tr>
    <%} %>
    <tr>
        <th>
            <%=Tag("管理员")%>：
        </th>
        <td>
           <%=model.Admin_UserName%>
        </td>
    </tr>
<%--    <tr>
        <th>
            <%=Tag("状态")%>：
        </th>
        <td>
           <%=Shop.Bussiness.EX_Type.TypeRadio("CashStatus", "Type_id_CashStatus", model.Type_id_CashStatus, "shop=\"true\"")%>
        </td>
    </tr>--%>
    <tr>
        <th style="vertical-align:top">
            <%=Tag("备注")%>：
        </th>
        <td>
            <textarea id="Remark" shop="true" name="Remark" class="textarea" style="height: 60px;width: 100%;"><%=model.Remark %></textarea>
            <div class="tools clear">
                <ul>
                    <li class="plus"><a href="javascript:void(0);" onclick="javascript:resizeEditor('Remark',100);"><b></b><span><%=Tag("展开")%></span></a></li>
                    <li class="minus"><a href="javascript:void(0);" onclick="javascript:resizeEditor('Remark',-100)"><b></b><span><%=Tag("收缩")%></span></a></li>
                </ul>
            </div>
        </td>
    </tr>
    <%if(model.Type_id_CashStatus==401){ %>
    <tr>
        <td colspan="2" class="action">
            <div class="tools tools-m">
                <ul>
                    <li class="submit"><a href="javascript:void(0);" onclick="SaveObj(402);"><b></b><span><%=Tag("已付款")%></span></a></li>
                    <li class="del"><a href="javascript:void(0);" onclick="SaveObj(403);"><b></b><span><%=Tag("无效")%></span></a></li>
                </ul>
            </div>
        </td>
    </tr>
    <%} %>
</table>
<script type="text/javascript">
    function SaveObj(t) {
        var postData = GetFormJsonData("shop");
        if (!CheckForm("shop", "span"))
            return false;
        var url = "<%=site.AdminPath %>/ajax/ajax_order.aspx?__Action=Cash_Edit&id=<%=model.id %>&t="+t;
        RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "?")});
    }
</script>

  