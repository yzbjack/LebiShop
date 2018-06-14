﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Admin.storeConfig.FriendLink_Edit_window" validateRequest="false"%>

<table class="table">
    <tr>
        <th style="width: 20%;">
            <%=Tag("链接名称")%>：
        </th>
        <td style="width: 80%;">
            <input type="text" shop="true" min="notnull" id="Name" name="Name" class="input" style="width:300px" value="<%=model.Name %>" />
        </td>
    </tr>
<tr>
    <th>
        <%=Tag("链接地址")%>：
    </th>
    <td>
        <input type="text" class="input" shop="true" min="notnull" name="Url" id="Url" style="width:300px" value="<%=model.Url %>" />
    </td>
</tr>
<tr>
    <th style="vertical-align:top">
        <%=Tag("图片Logo")%>：
    </th>
    <td>
        <div id="image_Logo">
            <%if (model.Logo != "")
                {%>
            <img height="30" src="<%=site.WebPath + model.Logo%>" />
            <%} %>
        </div>
        <input type="text" shop="true" id="Logo" name="Logo" class="input" style="width: 200px;" value="<%=model.Logo%>" />
        <input id="file_Logo" name="file_Logo" class="input" type="file" onchange="uploadImage('Logo')" />
        
    </td>
</tr>
<tr>
    <th>
        <%=Tag("图片链接")%>：
    </th>
    <td>
        <label><input type="radio" name="IsPic" shop="true" value="1" <%=model.IsPic==1?"checked":"" %> /><%=Tag("是")%></label>
        <label><input type="radio" name="IsPic" shop="true" value="0" <%=model.IsPic==0?"checked":"" %> /><%=Tag("否")%></label>
    </td>
</tr>
<tr>
    <th>
        <%=Tag("是否显示")%>：
    </th>
    <td>
        <label><input type="radio" name="IsShow" shop="true" value="1" <%=model.IsShow==1?"checked":"" %> /><%=Tag("是")%></label>
        <label><input type="radio" name="IsShow" shop="true" value="0" <%=model.IsShow==0?"checked":"" %> /><%=Tag("否")%></label>
    </td>
</tr>
<tr>
    <th style="vertical-align:top">
        <%=Tag("显示语言")%>：
    </th>
    <td>
        <%= Shop.Bussiness.Language.SiteLanguageCheckbox("Language_ids",model.Language_ids,CurrentLanguage.Code)%>
    </td>
</tr>
<tr>
    <th>
        <%=Tag("排序序号")%>：
    </th>
    <td>
        <input type="text" class="input" shop="true" name="Sort" id="Sort" value="<%=model.Sort %>" style="width: 70px;" />
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
    LanguageTab_EditPage('<%=CurrentLanguage.Code %>'); //加载默认语言
    function SaveObj() {
        var postData = GetFormJsonData("shop");
        if (!CheckForm("shop", "span"))
            return false;
        var url = "<%=site.AdminPath %>/ajax/ajax_site.aspx?__Action=FriendLink_Edit&id=<%=model.id %>";
        RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "?")});
    }
</script>
<script type="text/javascript">
    function uploadImage(id) {
        $.ajaxFileUpload
        (
	        {
	            url: WebPath + '/ajax/imageuploadone.aspx?path=friendlink',
	            secureuri: false,
	            fileElementId: 'file_' + id,
	            dataType: 'json',
	            success: function (data, status) {
	               
	                    if (data.msg != 'OK') {
	                        MsgBox(2, data.msg, "");
	                    }
	                    else {
	                        var imageUrl = data.ImageUrl;
	                        if (imageUrl.length > 0) {
	                            $("#image_" + id + "").html('<img height="30" src=' + WebPath + imageUrl + '>');
	                            $("#" + id + "").val(imageUrl);
	                        }
	                    }
	            },
	            error: function (data, status, e) {
	                MsgBox(2, data.error, "");
	            }
	        }
        )
    }
</script>

  