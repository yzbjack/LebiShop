﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Admin.order.Express_Shipper_Edit_window" validateRequest="false"%>

<table class="table">
    <tr>
        <th style="width: 20%">
            <%=Tag("网店名称")%>：
        </th>
        <td>
            <input type="text" id="SiteName" name="SiteName" style="width: 200px" shop="true" min="notnull" class="input" value="<%=model.SiteName %>" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("发货人姓名")%>：
        </th>
        <td>
            <input type="text" id="UserName" name="UserName" style="width: 200px" shop="true" min="notnull" class="input" value="<%=model.UserName %>" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("发货地址")%>：
        </th>
        <td>
            <input type="text" id="Address" name="Address" style="width: 400px" shop="true" min="notnull" class="input" value="<%=model.Address %>" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("所在城市")%>：
        </th>
        <td>
            <input type="text" id="City" name="City" style="width: 200px" shop="true" class="input" value="<%=model.City %>" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("邮政编码")%>：
        </th>
        <td>
            <input type="text" id="ZipCode" name="ZipCode" style="width: 200px" shop="true" class="input" value="<%=model.ZipCode %>" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("电话号码")%>：
        </th>
        <td>
            <input type="text" id="Tel" name="Tel" style="width: 200px" shop="true" class="input" value="<%=model.Tel %>" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("手机号码")%>：
        </th>
        <td>
            <input type="text" id="Mobile" name="Mobile" style="width: 200px" shop="true" class="input" value="<%=model.Mobile %>" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("是否启用")%>：
        </th>
        <td>
            <input type="radio" name="Status" shop="true" value="1" <%=model.Status==1?"checked":"" %> /><%=Tag("是")%>
            <input type="radio" name="Status" shop="true" value="0" <%=model.Status==0?"checked":"" %> /><%=Tag("否")%>
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("排序序号")%>：
        </th>
        <td>
            <input type="text" id="Sort" name="Sort" style="width: 70px" shop="true" class="input" value="<%=model.Sort %>" onkeyup="value=value.replace(/[^\d]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" maxlength="4" />
        </td>
    </tr>
        <tr  >
            <th style="vertical-align:top">
                <%=Tag("自定义信息")%>：<br>
                <em>≤ <span id="remLen">255</span></em>
            </th>
            <td colspan="3">
                <textarea name="Remark" id="Remark" shop="true" rows="3" cols="60" class="textarea" onKeyDown="checkMaxInput(this.form)" onKeyUp="checkMaxInput(this.form)" style="height: 60px;width: 400px;"><%=model.Remark%></textarea>
                <div class="tools clear">
                    <ul>
                        <li class="plus"><a href="javascript:void(0);" onclick="javascript:resizeEditor('Remark',100);"><b></b><span><%=Tag("展开")%></span></a></li>
                        <li class="minus"><a href="javascript:void(0);" onclick="javascript:resizeEditor('Remark',-100)"><b></b><span><%=Tag("收缩")%></span></a></li>
                    </ul>
                </div>
            </td>
        </tr>
    <tr>
        <td colspan="2" class="action">
            <div class="tools tools-m clear">
                <ul>
                    <li class="submit"><a href="javascript:void(0);" onclick="SaveObj();"><b></b><span><%=Tag("保存")%></span></a></li>
                </ul>
            </div>
        </td>
    </tr>
</table>
<script type="text/javascript">
    var maxLen = 255;
    var Remark = document.getElementById("Remark");
    function checkMaxInput(form) {
        if (Remark.value.length > maxLen)
            Remark.value = Remark.value.substring(0, maxLen);
        else document.getElementById("remLen").innerHTML = maxLen - Remark.value.length;
    }
    LanguageTab_EditPage('<%=CurrentLanguage.Code %>'); //加载默认语言
    function SaveObj() {
        var postData = GetFormJsonData("shop");
        if (!CheckForm("shop", "span"))
            return false;
        var url = "<%=site.AdminPath %>/ajax/ajax_order.aspx?__Action=Express_Shipper_Edit&id=<%=model.id %>";
        RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "?")});
    }
</script>

  