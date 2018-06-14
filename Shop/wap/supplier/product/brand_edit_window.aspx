﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.supplier.product.Brand_Edit_window" validateRequest="false"%>

<%=Shop.Bussiness.Language.AdminLanguageTab("") %>
<table cellspacing="0" border="0" style="width: 100%; border-collapse: collapse;" class="table">
    <%foreach (Shop.Model.Lebi_Language_Code lang in Shop.Bussiness.Language.Languages())
      {%>
    <tbody id="lang_<%=lang.Code %>" class="lang_table" style="display: none">
        <tr>
            <th style="width: 20%">
                <%=Tag("品牌名称")%>：
            </th>
            <td>
                <input type="text" id="Name<%=lang.Code %>" name="Name<%=lang.Code %>" class="input" shop="true"  style="width: 200px;" value="<%=Shop.Bussiness.Language.Content(model.Name,lang.Code) %>" />
            </td>
        </tr>
        <tr>
            <th valign="top">
                <%=Tag("品牌介绍")%>：
            </th>
            <td style="text-align: left;">
                <textarea shop="true" class="textarea" style="width:400px;height:60px;" id="Description<%=lang.Code %>" name="Description<%=lang.Code %>"><%=Shop.Bussiness.Language.Content(model.Description, lang.Code)%></textarea>
                <script type="text/javascript">
                    CKEDITOR.replace('Description<%=lang.Code %>', {
                        height: '150',
                        toolbar: 'Basic',
                        language: '<%=Tag("CKEditor语言")%>'
                    });
                </script>
            </td>
        </tr>
    </tbody>
    <%} %>
    </table>
    <ul id="tablistmain"><li class="selected"><a><span><%=Tag("通用信息")%></span></a></li></ul>
    <table cellspacing="0" border="0" style="width: 100%; border-collapse: collapse;" id="common" class="table">
    <tr>
        <th valign="top" style="width: 20%">
            <%=Tag("品牌图片")%>：
        </th>
        <td>
            <div id="image_ImageUrl">
                <%if (model.ImageUrl != "")
                    {%>
                <img height="30" src="<%=site.WebPath + model.ImageUrl%>" />
                <%} %>
            </div>
            <input type="text" shop="true" id="ImageUrl" name="ImageUrl" class="input" style="width: 200px;" value="<%=model.ImageUrl%>" />
            <input id="file_ImageUrl" name="file_ImageUrl" type="file" class="input" onchange="uploadImage('ImageUrl')" />
            
        </td>
    </tr>
    <tr>
        <th>
            <%=Tag("首字母")%>：
        </th>
        <td>
            <input type="text" id="FirstLetter" name="FirstLetter" style="width: 80px" shop="true" min="notnull" class="input" value="<%=model.FirstLetter %>" maxlength="4" />
        </td>
    </tr>
    <tr>
        <th valign="top">
            <%=Tag("关联分类")%>：
        </th>
        <td>
            <select name="Pro_Type_id" id="Pro_Type_id" shop="true" multiple="multiple" size="8">
                <%=Shop.Bussiness.EX_Product.TypeOption(0, model.Pro_Type_id, 0, CurrentLanguage.Code)%>
            </select>
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
        <%foreach (Shop.Model.Lebi_Language_Code lang in Shop.Bussiness.Language.Languages()){%>
        var editor<%=lang.Code %> = CKEDITOR.instances.Description<%=lang.Code %>;
        $("#Description<%=lang.Code %>").val(editor<%=lang.Code %>.getData())
        <%} %>
        var postData = GetFormJsonData("shop");
        if (!CheckForm("shop", "span"))
            return false;
        var url = "<%=site.AdminPath %>/ajax/ajax_product.aspx?__Action=Brand_Edit&id=<%=model.id %>";
        RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "?")});
    }
    function uploadImage(id) {
        $.ajaxFileUpload
        (
	        {
	            url: WebPath + '/ajax/imageuploadone.aspx?path=brand',
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
    $().ready(function () {
        $('#Pro_Type_id').multiselect2side({
            selectedPosition: 'right',
            moveOptions: false,
            //search: "<img src='img/search.gif' align=\"absmiddle\" /> ",
            labelsx: '',
            labeldx: '',
            autoSort: false,
            autoSortAvailable: false
        });
    }); 
</script>

  