﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Admin.order.shipping_shouhuo_window" validateRequest="false"%>

    <%
    Lebi.ERP.PLebi_Transport_Order porder = new Lebi.ERP.PLebi_Transport_Order(torder.id);
    %>
    <table class="datalist">
        <tr class="title">
            <th>
                <%=Tag("商品名称")%>
            </th>
            <th style="width: 80px">
                <%=Tag("退货数量")%>
            </th>
            <th style="width: 80px">
                <%=Tag("收货数量")%>
            </th>
        </tr>
        <%foreach (Shop.Model.Lebi_Order_Product tp in pros)
        { %>
        <tr class="list">
            <td>
                <img src="<%=Image(tp.ImageOriginal,50,50)%>" style="width: 30px" />
                <%=Shop.Bussiness.Language.Content(tp.Product_Name, CurrentLanguage)%>
            </td>
            <td>
                <%=tp.Count%>
            </td>
            <td>
                <%if (order.IsCompleted != 1)
                { %>
                <input type="text" class="input" Shipping="true" name="Count<%=tp.Product_id %>" id="Count<%=tp.Product_id %>"
                       value="<%=tp.Count_Received%>" onkeyup="value=value.replace(/[^\d\.]/g,'')" style="width: 70px;" />
                <%}
                else { Response.Write(tp.Count_Received); }%>
            </td>
        </tr>
        <%} %>
    </table>
    <table class="table">
        <tr>
            <th style="width: 15%">
                <%=Tag("配送方式")%>：
            </th>
            <td>
                <%=torder.Transport_Name %>
            </td>
        </tr>
        <tr>
            <th>
                <%=Tag("货运单号")%>：
            </th>
            <td>
                <%=torder.Code %>
            </td>
        </tr>
        <tr>
            <th>
                <%=Tag("状态")%>：
            </th>
            <td>
                <%if (order.IsCompleted != 1)
                { %>
                <select name="Type_id_TransportOrderStatus" id="Type_id_TransportOrderStatus" Shipping="true">
                    <%=Shop.Bussiness.EX_Type.TypeOption("TransportOrderStatus",torder.Type_id_TransportOrderStatus,CurrentLanguage.Code) %>
                </select>
                <%}
                else { Response.Write(Shop.Bussiness.EX_Type.TypeName(torder.Type_id_TransportOrderStatus));} %>
            </td>
        </tr>
        <tr>
            <th>
                <%=Tag("收货仓")%>：
            </th>
            <td>

                <select id="store_id" name="store_id" Shipping="true" class="input fromstore" <%=order.IsCompleted==1?"disabled":""%> >
                    <%=Lebi.ERP.other.storeoptionsAll(porder.LebiERP_store_id) %>
                </select>

               
            </td>
        </tr>
        <tr>
            <th>
               <%=Tag("运费")%>(<%=DefaultCurrency.Msige%>)：
            </th>
            <td>
                <%if (order.IsCompleted != 1)
                { %>
                <input type="text" Shipping="true" min="notnull" id="Money" name="Money" class="input" onkeyup="value=value.replace(/[^\d\.]/g,'')"
                       value="<%=torder.Money %>" style="width: 100px;" />
                <%}
                else { Response.Write(torder.Money); } %>
            </td>
        </tr>
        <%if (order.IsCompleted != 1 && porder.LebiERP_store_id==0)
        { %>
        <tr>
            <td colspan="2" class="action">
                <div class="tools tools-m">
                    <ul>
                        <li class="submit"><a href="javascript:void(0);" onclick="Shipping();"><b></b><span><%=Tag("保存")%></span></a></li>
                    </ul>
                </div>
            </td>
        </tr>
        <%} %>
    </table>
    <script type="text/javascript">
    function Shipping() {
        if (!CheckForm("Shipping", "span"))
            return false;
        var postData = GetFormJsonData("Shipping");
        var url = "<%=site.AdminPath %>/ajax/ajax_ex.aspx?__Action=Order_shouhuo&id=<%=torder.id %>";
        RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "?")});
    }
    </script>

  