﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Admin.storeConfig.ServicePanel_Type_Edit_window" validateRequest="false"%>

<table class="table">
    <tr>
        <th style="width: 20%;">
            <%=Tag("软件名称")%>：
        </th>
        <td style="width: 80%;">
            <input type="text" shop="true" min="notnull" id="Name" name="Name" class="input" value="<%=model.Name %>" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("链接地址")%>：
        </th>
        <td>
            <input type="text" shop="true" id="Url" name="Url" size="50" class="input" value="<%=model.Url %>" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("提示文字")%>：
        </th>
        <td>
            <input type="text" shop="true" id="Text" name="Text" size="50" class="input" value="<%=model.Text %>" />
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("在线检测")%>：
        </th>
        <td>
            <label><input type="radio" name="IsOnline" value="1" shop="true" <%=model.IsOnline==1?"checked":"" %> /><%=Tag("支持")%></label>
            <label><input type="radio" name="IsOnline" value="0" shop="true" <%=model.IsOnline==0?"checked":"" %> /><%=Tag("不支持")%></label>
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("动态图标")%>：
        </th>
        <td>
            <input type="text" shop="true" id="Code" name="Code" size="50" class="input" value="<%=model.Code %>" />
        </td>
    </tr>
    <tr>
        <th style="vertical-align:top">
            <%=Tag("静态图标")%>：
        </th>
        <td>
        <div id="image_Face"><%if (model.Face != ""){%><img src="<%=site.WebPath + model.Face%>" /><%} %></div>
        <input type="text" shop="true" id="Face" name="Face" class="input" style="width: 200px;" value="<%=model.Face%>" />
        <input id="file_Face" name="file_Face" type="file" class="input" onchange="uploadImage('Face')" />
        
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("排序序号")%>：
        </th>
        <td style="text-align: left;">
            <input type="text" class="input" shop="true" name="Sort" id="Sort" value="<%=model.Sort %>" style="width: 70px;" />
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
    function uploadImage(id) {
        $.ajaxFileUpload
        (
	        {
	            url: WebPath + '/ajax/imageuploadone.aspx?path=config',
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
    function SaveObj() {
        var postData = GetFormJsonData("shop");
        if (!CheckForm("shop", "span"))
            return false;
        var url = "<%=site.AdminPath %>/ajax/ajax_site.aspx?__Action=ServicePanel_Type_Edit&id=<%=model.id %>";
        RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "?")});
    }
</script>

  