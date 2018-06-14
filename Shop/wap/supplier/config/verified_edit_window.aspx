﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Supplier.Config.Verified_Edit_window" validateRequest="false"%>

<table cellspacing="0" border="0" style="width: 100%; border-collapse: collapse;" class="table">
    <tr>
        <th valign="top" style="width: 20%">
            <%=Lang(Verified.Name)%>：
        </th>
        <td>
            <div id="image_ImageUrl">
                <%if (model.ImageUrl != "")
                    {%>
                <img height="60" src="<%=site.WebPath + model.ImageUrl%>" />
                <%} %>
            </div>
            <input type="text" shop="true" id="ImageUrl" name="ImageUrl" class="input" style="width: 200px;" value="<%=model.ImageUrl%>" readonly />
            <input id="file_ImageUrl" name="file_ImageUrl" type="file" class="input" onchange="uploadImage('ImageUrl')" />
            
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
    function SaveObj() {
        var postData = GetFormJsonData("shop");
        if (!CheckForm("shop", "span"))
            return false;
        var url = "<%=site.AdminPath %>/ajax/ajax_config.aspx?__Action=Verified_Edit&id=<%=Verified.id %>";
        RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "?")});
    }
    function uploadImage(id) {
        $.ajaxFileUpload
        (
	        {
	            url: WebPath + '/ajax/imageuploadone.aspx?path=verified',
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
	                            $("#image_" + id + "").html('<img height="60" src=' + WebPath + imageUrl + '>');
	                            $("#" + id + "").val(imageUrl);
	                        }
	                    }
	            }
	        }
        )
    }
</script>

  