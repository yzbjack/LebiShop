﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Admin.product.Property_Edit_window" validateRequest="false"%>

<%=Shop.Bussiness.Language.AdminLanguageTab("") %>
<table
    class="table">
    <%foreach (Shop.Model.Lebi_Language_Code lang in Shop.Bussiness.Language.Languages())
      {%>
    <tbody id="lang_<%=lang.Code %>" class="lang_table" style="display: none">
        <tr>
            <th style="width: 20%">
                <%=Tag("属性名称")%>：
            </th>
            <td>
                <input type="text" class="input" name="Name<%=lang.Code %>" shop="true"  id="Name<%=lang.Code %>" style="width:200px" value="<%=Shop.Bussiness.Language.Content(model.Name, lang.Code) %>" />
            </td>
        </tr>
    </tbody>
    <%} %>
    </table>
    <ul id="tablistmain"><li class="selected"><a><span><%=Tag("通用信息")%></span></a></li></ul>
    <table class="table">
    <tr>
        <th style="width: 20%">
            <%=Tag("类型")%>：
        </th>
        <td>
            <%=Shop.Bussiness.EX_Type.TypeRadio("ProPertyType", "Type_id_ProPertyType", model.Type_id_ProPertyType, "shop=\"true\" onclick=\"SetType();\"")%>
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("标签")%>：
        </th>
        <td>
            <input type="text" class="input" name="Tag" shop="true" id="Tag" value="<%=model.Tag %>" style="width:200px"/>
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("备注")%>：
        </th>
        <td>
            <input type="text" class="input" name="Remark" shop="true" id="Remark" value="<%=model.Remark %>" style="width:200px"/>
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("代码")%>：
        </th>
        <td>
            <input type="text" class="input" name="Code" shop="true" id="Code" value="<%=model.Code %>" style="width:70px"/>
        </td>
    </tr>
    <%if (Shop.LebiAPI.Service.Instanse.Check("plugin_gongyingshang")){ %>
    <tr id="supplier_box">
        <th>
            <%=Tag("商家")%>：
        </th>
        <td>
            <select id="Supplier_id" name="Supplier_id" shop="true">
                <option value="0"><%=Tag("请选择")%></option>
                <%=Shop.Bussiness.EX_Supplier.SupplierOption(model.Supplier_id, CurrentLanguage.Code)%>
            </select>
        </td>
    </tr>
    <%} %>
    <tr>
        <th>
            <%=Tag("排序序号")%>：
        </th>
        <td>
            <input type="text" class="input" name="Sort" shop="true" id="Sort" value="<%=model.Sort %>" style="width:70px" onkeyup="value=value.replace(/[^\d]/g,'')" />
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
    LanguageTab_EditPage('<%=CurrentLanguage.Code %>'); //加载默认语言
    function SaveObj() {
        if (!CheckForm("shop", "span"))
            return false;
        var postData = GetFormJsonData("shop");
        var url = "<%=site.AdminPath %>/ajax/ajax_product.aspx?__Action=Property_Edit&id=<%=model.id %>";
        RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "?")});
    }
    function SetType() {
        var Type = $("input[name='Type_id_ProPertyType']:checked").val();
        if (Type == "131" || Type == "133") {
            $("#supplier_box").show();
        } else {
            $("#supplier_box").hide();
        }
    }
    SetType();
</script>

  