﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.supplier.product.Supplier_ProductType_edit_window" validateRequest="false"%>

<table cellspacing="0" border="0" style="width: 100%;" class="table">
    <tr>
        <th valign="top">
            <%=Tag("自定义类别")%>：
        </th>
        <td>
            <select name="Supplier_ProductType_ids" id="Supplier_ProductType_ids" shop="true" multiple="multiple" size="8" style="width:220px">
                <%=Shop.Bussiness.EX_Product.SupplierTypeOption(CurrentSupplier.id, 0, "", 0, CurrentLanguage.Code)%>
            </select>
        </td>
    </tr>
    <tr>
        <td class="action" colspan="2">
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
        var url = "<%=site.AdminPath %>/ajax/ajax_product.aspx?__Action=Supplier_ProductType_Edit&ids=<%=ids %>";
        RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "?");});
    }
</script>

  