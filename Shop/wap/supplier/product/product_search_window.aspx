﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.supplier.product.product_search_window" validateRequest="false"%>

<table class="table" border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <th style="width: 120px;">
            <%=Tag("名称")%>：
        </th>
        <td>
            <input name="UserName" id="UserName" value="<%=model.Name %>" shop="true" type="text"
                class="input" style="width: 200px;" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("商品编号")%>：
        </th>
        <td>
            <input name="Number" value="<%=model.Number %>" shop="true" type="text" class="input"
                style="width: 200px;" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("状态")%>：
        </th>
        <td>
            <%=Shop.Bussiness.EX_Type.TypeCheckbox("ProductStatus", "Type_id_ProductStatus", model.Type_id_ProductStatus, "shop=\"true\"", CurrentLanguage.Code)%>
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("品牌")%>：
        </th>
        <td>
            <%
                int Brand_id = 0;
                int.TryParse(model.Brand_id, out  Brand_id);    
            %>
            <select id="Brand_id" name="Brand_id" shop="true">
                <option value="0">
                    <%=Tag("全部")%></option>
                <%=Shop.Bussiness.EX_Product.BrandOption(Brand_id, CurrentLanguage.Code)%>
            </select>
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("销量")%>：
        </th>
        <td>
            <input name="Count_Sales1" shop="true" type="text" class="input" style="width: 70px;"
                onkeyup="value=value.replace(/[^\d]/g,'')" value="<%=model.Count_Sales1 %>" />
            -
            <input name="Count_Sales2" shop="true" type="text" class="input" style="width: 70px;"
                onkeyup="value=value.replace(/[^\d]/g,'')" value="<%=model.Count_Sales1 %>" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("库存")%>：
        </th>
        <td>
            <input name="Count_Stock1" shop="true" type="text" class="input" style="width: 70px;"
                onkeyup="value=value.replace(/[^\d]/g,'')" value="<%=model.Count_Stock1 %>" />
            -
            <input name="Count_Stock2" shop="true" type="text" class="input" style="width: 70px;"
                onkeyup="value=value.replace(/[^\d]/g,'')" value="<%=model.Count_Stock2 %>" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("预警库存")%>：
        </th>
        <td>
            <input name="Count_StockCaution1" shop="true" type="text" class="input" style="width: 70px;"
                onkeyup="value=value.replace(/[^\d]/g,'')" value="<%=model.Count_StockCaution1 %>" />
            -
            <input name="Count_StockCaution2" shop="true" type="text" class="input" style="width: 70px;"
                onkeyup="value=value.replace(/[^\d]/g,'')" value="<%=model.Count_StockCaution2 %>" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("浏览量")%>：
        </th>
        <td>
            <input name="Count_Views1" shop="true" type="text" class="input" style="width: 70px;"
                onkeyup="value=value.replace(/[^\d]/g,'')" value="<%=model.Count_Views1 %>" />
            -
            <input name="Count_Views2" shop="true" type="text" class="input" style="width: 70px;"
                onkeyup="value=value.replace(/[^\d]/g,'')" value="<%=model.Count_Views2 %>" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("价格")%>：
        </th>
        <td>
            <input name="Price1" shop="true" type="text" class="input" style="width: 70px;"
                onkeyup="value=value.replace(/[^\d\.]/g,'')" value="<%=model.Price1 %>" />
            -
            <input name="Price2" shop="true" type="text" class="input" style="width: 70px;"
                onkeyup="value=value.replace(/[^\d\.]/g,'')" value="<%=model.Price2 %>" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("成本价")%>：
        </th>
        <td>
            <input name="Price_Cost1" shop="true" type="text" class="input" style="width: 70px;"
                onkeyup="value=value.replace(/[^\d\.]/g,'')" value="<%=model.Price_Cost1 %>" />
            -
            <input name="Price_Cost2" shop="true" type="text" class="input" style="width: 70px;"
                onkeyup="value=value.replace(/[^\d\.]/g,'')" value="<%=model.Price_Cost2 %>" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("商品标签")%>：
        </th>
        <td>
            <% foreach (Shop.Model.Lebi_Pro_Tag t in Shop.Bussiness.B_Lebi_Pro_Tag.GetList("", ""))
                   { %>
                <label><input shop="true" type="checkbox" value="<%=t.id %>" name="Pro_Tag_id"
                    <%=(","+model.Pro_Tag_id+",").Contains(","+t.id+",")?"checked":"" %> /><%=Shop.Bussiness.Language.Content(t.Name,CurrentLanguage.Code) %></label>
                <%} %>
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("添加时间")%>：
        </th>
        <td>
            <input name="Time_Add1" shop="true" type="text" class="input-calendar" onclick="WdatePicker()"
                style="width: 120px;" value="<%=model.Time_Add1 %>" />
            -
            <input name="Time_Add2" shop="true" type="text" class="input-calendar" onclick="WdatePicker()"
                style="width: 120px;" value="<%=model.Time_Add2 %>" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("上架时间")%>：
        </th>
        <td>
            <input name="Time_OnSale1" shop="true" type="text" class="input-calendar" onclick="WdatePicker()"
                style="width: 120px;" value="<%=model.Time_OnSale1 %>" />
            -
            <input name="Time_OnSale2" shop="true" type="text" class="input-calendar" onclick="WdatePicker()"
                style="width: 120px;" value="<%=model.Time_OnSale2 %>" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("商品分类")%>：
        </th>
        <td>
            <select name="Pro_Type_id" id="Pro_Type_id" shop="true" multiple="multiple" size="8">
                <%=Shop.Bussiness.EX_Product.TypeOption(0, model.Pro_Type_id, 0, CurrentLanguage.Code)%>
            </select>
        </td>
    </tr>
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
        <td colspan="2" class="action">
            <div class="tools tools-m clear">
                <ul>
                    <li class="submit"><a href="javascript:void(0);" onclick="SearchProduct();"><b></b><span>
                        <%=Tag("提交")%></span></a></li>
                </ul>
            </div>
        </td>
    </tr>
</table>
<script type="text/javascript">
        
        function SearchProduct()
        {
            var postData = GetFormJsonData("shop");
            var url = "<%=site.AdminPath %>/ajax/ajax_search.aspx?__Action=ProductSearch";
            $.ajax({
                type: "POST",
                url: url,
                data: postData,
                dataType: 'json',
                success: function (res) {
                    <%=callback %>(res.url);
                }
            });
        }
        $().ready(function () {
        $('#Pro_Type_id').multiselect2side({
            selectedPosition: 'right',
            moveOptions: false,
            //search: "<img src='img/search.gif' align=\"absmiddle\" /> ",
            labelsx: '',
            labeldx: '',
            autoSort: false,
            autoSortAvailable: false
        });
    }); 
</script>

  