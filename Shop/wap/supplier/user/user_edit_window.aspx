﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Supplier.user.user_edit_window" validateRequest="false"%>

<table cellspacing="0" border="0" style="width: 100%; border-collapse: collapse;"
    id="common" class="table">
    <tr>
        <th style="width: 20%">
            <%=Tag("账号")%>：
        </th>
        <td style="text-align: left;">
            <%if(user.id==0){ %>
            <input type="text" id="UserName" name="UserName" value="<%=user.UserName %>" class="input" shop="true" min="notnull" />
            <%}else{ %>
            <%=user.UserName %>
            <%} %>
        </td>
    </tr>
    <tr>
        <th style="width: 20%">
            <%=Tag("备注名称")%>：
        </th>
        <td style="text-align: left;">
            <input type="text" id="RemarkName" name="RemarkName" 
                value="<%=model.RemarkName %>" class="input" shop="true" min="notnull" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("分组")%>：
        </th>
        <td style="text-align: left;">
            <select id="Supplier_UserGroup_id" name="Supplier_UserGroup_id" shop="true">
            <%=Shop.Bussiness.EX_Supplier.SupplierUserGroupOption(CurrentSupplier.id,model.Supplier_UserGroup_id)%>
            </select>
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("状态")%>：
        </th>
        <td>
            <select id="Type_id_SupplierUserStatus" name="Type_id_SupplierUserStatus" shop="true">
                <%=Shop.Bussiness.EX_Type.TypeOption("SupplierUserStatus", model.Type_id_SupplierUserStatus)%>
            </select>
            <em></em>
        </td>
    </tr>
    
    <tr>
        <td colspan="2" class="action">
            <div class="tools tools-m clear">
                <ul>
                    <li class="submit"><a href="javascript:void(0);" onclick="SaveObj();"><b></b><span>
                        <%=Tag("保存")%></span></a></li>
                </ul>
            </div>
        </td>
    </tr>
</table>
<script type="text/javascript">
    function SaveObj() {
        var postData = GetFormJsonData("shop");
        if (!CheckForm("shop", "span"))
            return false;
        var url = AdminPath+"/ajax/ajax_supplier.aspx?__Action=User_Edit&id=<%=model.id %>";
        RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "?")});
    }
</script>

  