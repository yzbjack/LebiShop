﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Ajax.js" validateRequest="false"%><%LoadPage();%>

/* 乐彼网上商城系统 LebiShop
* http://www.lebi.cn
* Copyright 2003-<%=DateTime.Now.Year %> lebi.cn;*/
$(document).ready(function ($) { 
$(".input-calendar").datepicker({dateFormat:"yy-mm-dd"});
<%if (CurrentLanguage.IsLazyLoad==1){ %>$("img.lazy").lazyload({ effect: "fadeIn" });<%} %> 
});
var path = "<%=WebPath %>"; 
var sitepath = "{/site}/"; 
var langpath = "{/lang}/";
var languagetags=[];
<%=langs%>
function Tag(strin) {
    return languagetags[strin];
}

  