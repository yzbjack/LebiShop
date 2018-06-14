﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Admin.order.order_add_window" validateRequest="false"%>

<table class="table">
    <tr>
        <th style="width:25%">
            UserID：
        </th>
        <td>
           <input type="text" shop="true" min="notnull" id="userid" name="userid"
                class="input" value="<%=user.id %>" style="width: 100px;" onkeyup="value=value.replace(/[^\d\.]/g,'')" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("用户名")%>：
        </th>
        <td>
           <%=user.UserName %>
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("真实姓名")%>：
        </th>
        <td>
           <%=user.RealName %>
        </td>
    </tr>
    <tr>
        <td colspan="2" class="action">
            <div class="tools tools-m">
                <ul>
                    <li class="submit"><a href="javascript:void(0);" onclick="AddOrder();"><b></b><span><%=Tag("提交")%></span></a></li>
                    
                </ul>
            </div>
        </td>
    </tr>
</table>
<script type="text/javascript">
    function AddOrder()
    {
        if (!confirm("<%=Tag("确认要添加吗？")%>"))
            return false;
        var userid=$('#userid').val();
        var postData = { "userid": userid };
        var url = "<%=site.AdminPath %>/ajax/ajax_order.aspx?__Action=Order_Add";
        RequestAjax(url,postData,function(res){MsgBox(1, "<%=Tag("操作成功")%>", "<%=site.AdminPath %>/order/order_view.aspx?id="+res.id)});
    }
</script>

  