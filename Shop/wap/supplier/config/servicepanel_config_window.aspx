﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Supplier.Config.ServicePanel_Config_window" validateRequest="false"%>

<table cellspacing="0" border="0" class="table" style="width: 100%; border-collapse: collapse;">
    <tr>
        <th style="width: 20%;">            
        <%=Tag("坐标位置")%>：
        </th>
        <td style="width: 80%;">
            X：<input type="text" shop="true" min="notnull" id="X" name="X" class="input" value="<%=sp.X%>" size="5" />&nbsp;&nbsp;
            Y：<input type="text" shop="true" min="notnull" id="Y" name="Y" class="input" value="<%=sp.Y%>" size="5" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("面板风格")%>：
        </th>
        <td>
        <select name="Theme" onchange="document.images['Theme'].src='../../theme/system/images/CN/ServicePanel/'+options[selectedIndex].value+'_1.gif';" shop="true">
           <%int i;for(i=1;i<10;i++){%>
           <option value="<%=i%>" <%=sp.Theme==""+i+""?"selected":"" %>><%=i%></option>
           <%}%>
           </select> <img src="../../theme/system/images/CN/ServicePanel/<%=sp.Theme%>_1.gif" id="Theme" align="absmiddle">
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("是否显示")%>：
        </th>
        <td>
            <input type="radio" name="Status" value="1" shop="true" <%=sp.Status=="1"?"checked":"" %> /><%=Tag("是")%>
            <input type="radio" name="Status" value="0" shop="true" <%=sp.Status=="0"?"checked":"" %> /><%=Tag("否")%>
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("浮动位置")%>：
        </th>
        <td>
            <input type="radio" name="IsFloat" value="1" shop="true" <%=sp.IsFloat=="1"?"checked":"" %> /><%=Tag("顶部")%>
            <input type="radio" name="IsFloat" value="0" shop="true" <%=sp.IsFloat=="0"?"checked":"" %> /><%=Tag("底部")%>
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("面板样式")%>：
        </th>
        <td>
            <input type="radio" name="Style" value="1" shop="true" <%=sp.Style=="1"?"checked":"" %> /><%=Tag("浮动")%>
            <input type="radio" name="Style" value="0" shop="true" <%=sp.Style=="0"?"checked":"" %> /><%=Tag("固定")%>
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
        var postData = GetFormJsonData("shop");
        if (!CheckForm("shop", "span"))
            return false;
        var url = "<%=site.AdminPath %>/ajax/ajax_config.aspx?__Action=ServicePanel_Config";
        RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "?")});
    }
</script>

  