﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Admin.cms.Node_Edit_window" validateRequest="false"%>

<table
    class="table">
    <tr>
        <th style="width: 15%">
            <%=Tag("名称")%>：
        </th>
        <td>
            <input type="text" id="Name" name="Name" class="input" shop="true" min="notnull"
                style="width: 350px;" value="<%=model.Name %>" />
        </td>
    </tr>
    <tr>
        <th style="width: 15%">
            <%=Tag("上级结点")%>：
        </th>
        <td>
            <select name="parentid" id="parentid" shop="true">
                <option value="0">
                    <%=Tag("根结点")%></option>
                <%=GetOptionTreeString(0, 0, PNode.id)%>
            </select>
            <span id="C_txt_tdname"></span>
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("结点代码")%>：
        </th>
        <td>
            <input type="text" id="Code" name="Code" class="input" shop="true" min="notnull"
                style="width: 200px;" value="<%=model.Code %>" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("结点类型")%>：
        </th>
        <td>
            <select name="TypeFlag" id="TypeFlag" shop="true">
                <option value="1" <%=model.TypeFlag==1?"selected":"" %>>
                    <%=Tag("页面分类")%></option>
                <option value="2" <%=model.TypeFlag==2?"selected":"" %>>
                    <%=Tag("结点分类")%></option>
                <option value="3" <%=model.TypeFlag==3?"selected":"" %>>
                    <%=Tag("独立内容")%></option>
            </select>
            <span id="Span3"></span>
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("链接页面")%>：
        </th>
        <td>
            <input type="text" id="url" name="url" class="input" shop="true" style="width: 500px;"
                value="<%=model.url %>" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("管理首页")%>：
        </th>
        <td>
            <input type="text" id="AdminPage_Index" name="AdminPage_Index" class="input" shop="true"
                style="width: 500px;" value="<%=model.AdminPage_Index %>" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("管理内页")%>：
        </th>
        <td>
            <input type="text" id="AdminPage" name="AdminPage" class="input" shop="true" style="width: 500px;"
                value="<%=model.AdminPage %>" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("打开方式")%>：
        </th>
        <td>
            <select name="target" id="target" shop="true">
                <option value="_self" <%=model.target=="_self"?"selected":"" %>>
                    <%=Tag("当前窗口")%></option>
                <option value="_blank" <%=model.target=="_blank"?"selected":"" %>>
                    <%=Tag("新窗口")%></option>
            </select>
            <span id="Span1"></span>
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("多语言")%>：
        </th>
        <td>
            <input type="radio" name="IsLanguages" shop="true" value="0" <%=model.IsLanguages==0?"checked":"" %> />No
            <input type="radio" name="IsLanguages" shop="true" value="1" <%=model.IsLanguages==1?"checked":"" %>>Yes
            <span id="Span2"></span>
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("子结点")%>：
        </th>
        <td>
            <input type="radio" name="haveson" shop="true" value="0" <%=model.haveson==0?"checked":"" %> /><%=Tag("不允许")%>
            <input type="radio" name="haveson" shop="true" value="1" <%=model.haveson==1?"checked":"" %>><%=Tag("允许")%>
            <span id="Span4"></span>
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("排序序号")%>：
        </th>
        <td>
            <input type="text" id="Sort" name="Sort" style="width: 50px" shop="true" class="input"
                value="<%=model.Sort %>" onkeyup="value=value.replace(/[^\d]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
                maxlength="4" />
        </td>
    </tr>
    <tr>
        <th class="head" colspan="2" onclick="ShowChild('0,1,2','seo')">
            <img src="<%=PageImage("plus.gif")%>" name="imgseo" id="imgseo" style="cursor: pointer;" />
            <%=Tag("SEO优化")%>
        </th>
    </tr>
    <tr style="display: none;" name="trseo" id="tr0">
        <th style="width: 14%">
            <%=Tag("网页标题")%>：
        </th>
        <td>
            <input type="text" id="SEO_Title" name="SEO_Title" class="input" shop="true" style="width: 500px;"
                value="<%=model.SEO_Title %>" />
        </td>
    </tr>
    <tr style="display: none;" name="trseo" id="tr1">
        <th>
            <%=Tag("关键词")%>：
        </th>
        <td>
            <input type="text" id="SEO_Keywords" name="SEO_Keywords" class="input" shop="true"
                style="width: 500px;" value="<%=model.SEO_Keywords %>" />
        </td>
    </tr>
    <tr style="display: none;" name="trseo" id="tr2">
        <th>
            <%=Tag("网页描述")%>：
        </th>
        <td>
            <input type="text" id="SEO_Description" name="SEO_Description" class="input" shop="true"
                style="width: 500px;" value="<%=model.SEO_Description %>" />
        </td>
    </tr>
    <tr>
        <td colspan="2" class="action">
            <div class="tools tools-m clear">
                <ul>
                    <li class="submit"><a href="javascript:void(0);" onclick="SaveObj();">
                        <b></b><span><%=Tag("保存")%></span></a></li>
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
        var url = "<%=site.AdminPath %>/ajax/ajax_node.aspx?__Action=Node_Edit&id=<%=model.id %>";
        RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "?")});
    }
</script>

  