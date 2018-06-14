﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.inc.selectpickupdate" validateRequest="false"%><%LoadPage();%>


<div class="calendar">
<div class="calendarlist">
<%
DateTime day=start;
for(int i=0;i<sumdays;i++){ 
day=start.AddDays(i);
if(cmonth==","){
%>
<div class="month clearfix">
<h2><%=day.ToString("yyyy-MM") %></h2>
<div class="week"><%=Tag("星期一") %></div>
<div class="week"><%=Tag("星期二") %></div>
<div class="week"><%=Tag("星期三") %></div>
<div class="week"><%=Tag("星期四") %></div>
<div class="week"><%=Tag("星期五") %></div>
<div class="week"><%=Tag("星期六") %></div>
<div class="week"><%=Tag("星期日") %></div>
<%}
else if(!cmonth.Contains(","+day.Month+",")){
%>
</div>
<div class="month clearfix">
<h2><%=day.ToString("yyyy-MM") %></h2>
<div class="week"><%=Tag("星期一") %></div>
<div class="week"><%=Tag("星期二") %></div>
<div class="week"><%=Tag("星期三") %></div>
<div class="week"><%=Tag("星期四") %></div>
<div class="week"><%=Tag("星期五") %></div>
<div class="week"><%=Tag("星期六") %></div>
<div class="week"><%=Tag("星期日") %></div>
<%} %>

    <%if(day.Day==1){ %>
    <%=GetBeginDays(day) %>
    <%} %>
    <%int res=checkday(day); %>
    <%if(res>0){ %>
    <div class="day day<%=res %>">
    <%=day.Day %>
    <%}else{ %>
    <div class="day"><a href="javascript:void(0)" onclick="selectday('<%=day.ToString("yyyy-MM-dd") %>')"><%=day.Day %></a>
    <%} %>
    </div>
<%
cmonth+=day.Month+",";
} %> 
  <%=GetLastDays(day) %> 
</div>
</div>
</div>

<script type="text/javascript">
    function selectday(day) {
        $('#pickupdate_<%=pick.id %>').val(day);
        <%=callback %>();
    }
</script>

  