﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Supplier.user.Supplier_Group_Edit_window" validateRequest="false"%>

<table cellspacing="0" border="0" style="width: 100%; border-collapse: collapse;"
    id="common" class="table">
    <tr>
        <th style="width: 20%">
            <%=Tag("名称")%>：
        </th>
        <td style="text-align: left;">
            <input type="text" id="Name" name="Name" 
                value="<%=model.Name %>" class="input" shop="true" min="notnull" />
        </td>
    </tr>
    <tr>
        <th style="width: 20%">
            <%=Tag("排序序号")%>：
        </th>
        <td style="text-align: left;">
            <input type="text" class="input" shop="true" name="Sort" id="Sort" value="<%=model.Sort %>"
                style="width: 70px;" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("允许申请")%>：
        </th>
        <td>
            <input type="radio" name="IsShow" shop="true" value="1" <%=model.IsShow==1?"checked":"" %> /><%=Tag("是")%>
            <input type="radio" name="IsShow" shop="true" value="0" <%=model.IsShow==0?"checked":"" %> /><%=Tag("否")%>
            <em>仅在开放申请时有效</em>
        </td>
    </tr>
    <tr>
        <th valign="top">
            <%=Tag("描述")%>：<br>
            <em>≤ <span id="remLen">255</span></em>
        </th>
        <td>
            <textarea name="Description" id="Description" shop="true" rows="3" cols="60" class="input"
                onkeydown="checkMaxInput(this.form)" onkeyup="checkMaxInput(this.form)" style="height: 55px; max="255"
                width: 100%;"><%=model.Description%></textarea>
            <div class="tools clear">
                <ul>
                    <li class="plus"><a href="javascript:void(0);" onclick="javascript:resizeEditor('Remark',100);">
                        <b></b><span>
                            <%=Tag("展开")%></span></a></li>
                    <li class="minus"><a href="javascript:void(0);" onclick="javascript:resizeEditor('Remark',-100)">
                        <b></b><span>
                            <%=Tag("收缩")%></span></a></li>
                </ul>
            </div>
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
        var url = AdminPath+"/ajax/ajax_supplier.aspx?__Action=Group_Edit&id=<%=model.id %>";
        RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "?")});
    }
</script>

  