﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Admin.order.order_baseinfo_edit_window" validateRequest="false"%>

<table class="table">
    <tr>
        <th style="width: 15%">
            <%=Tag("付款方式")%>：
        </th>
        <td >
            <select id="Pay_id" name="Pay_id" onchange="changepay();"  orderbaseinfo="true">
                <%=paylist(model.Pay_id)%>
            </select>

            <select id="OnlinePay_id" name="OnlinePay_id" style="display:none" orderbaseinfo="true" >
                <%=onlinepaylist(model.OnlinePay_id)%>
            </select>
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("配送方式")%>：
        </th>
        <td>
            <select id="Transport_id" name="Transport_id" onchange="changetransport();" orderbaseinfo="true">
                <%=transportlist(model.Transport_id)%>
            </select>

           
        </td>
    </tr>
    <tr id="trPickUp_id"  style="display:none" >
        <th>
            <%=Tag("自提")%>：
        </th>
        <td>
            <select id="PickUp_id" name="PickUp_id" orderbaseinfo="true">
                <%=pickuplist(model.PickUp_id)%>
            </select>
            <%=Tag("时间")%>：
            <input type="text" name="PickUp_Date" orderbaseinfo="true" id="PickUp_Date" size="12" class="input-calendar" value="<%=FormatDate(model.PickUp_Date) %>" />
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
        var postData = GetFormJsonData("orderbaseinfo");
        var url = "<%=site.AdminPath %>/ajax/ajax_order.aspx?__Action=Order_baseinfo_Edit&id=<%=model.id %>";
        RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "?")});
    }
    function changepay()
    {
        var code=$('#Pay_id option:selected').attr('code');
        if(code=='OnlinePay')
            $('#OnlinePay_id').show();
        else
            $('#OnlinePay_id').hide();
    }
    function changetransport()
    {
        var code=$('#Transport_id option:selected').attr('code');
        if(code=='332')
            $('#trPickUp_id').show();
        else
            $('#trPickUp_id').hide();
    }
    changetransport();
    changepay();
</script>

  