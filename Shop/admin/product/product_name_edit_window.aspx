﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Admin.product.product_Name_Edit_window" validateRequest="false"%>

<table cellspacing="0" border="0" style="width: 100%;" class="table">
    <%foreach (Shop.Model.Lebi_Language_Code lang in Shop.Bussiness.Language.Languages())
      {%>
        <tr>
            <th style="width: 15%;">
                <%=lang.Name%><%=Tag("名称")%>：
            </th>
            <td>
                <input type="text" class="input" name="Name<%=lang.Code %>" shopname="true"  id="Name<%=lang.Code %>" value="<%=Shop.Bussiness.Language.Content(model.Name, lang.Code) %>" style="width:400px;" />
            </td>
        </tr>
    <%} %>
    <tr>
        <td class="action" colspan="2">
            <div class="tools tools-m clear">
                <ul>
                    <li class="submit"><a href="javascript:void(0);" onclick="SavePNameObj();"><b></b><span><%=Tag("保存")%></span></a></li>
                </ul>
            </div>
        </td>
    </tr>
</table>
<script type="text/javascript">
    function SavePNameObj() {
        if (!CheckForm("shopname", "span"))
            return false;
        <%if (removelang !=""){ %>
        <%foreach (Shop.Model.Lebi_Language_Code lang in Shop.Bussiness.Language.Languages())
          {%>
            $("#Name<%=lang.Code%><%=id%>").val($("#Name<%=lang.Code%>").val());
        <%} %>
        $("#div_window").dialog('close'); 
        <%}else{ %>
        var postData = GetFormJsonData("shopname");
        var url = "<%=site.AdminPath %>/ajax/ajax_product.aspx?__Action=Product_Name_Edit&id=<%=model.id %>";
        RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "");getsubproducts();});
        <%} %>
    }
    function getsubproducts() {
        $.ajax({
            type: "POST",
            url: "subproduct_list.aspx?pid=<%=pid %>&randnum=<%=randnum %>",
            data: '',
            success: function (res) {
                $("#div_error").dialog('close'); 
                $("#subproducts").html(res);
            }
        });
    }
</script>

  