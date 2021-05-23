<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Report_Col.aspx.cs" Inherits="HotelManage.Report" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<style type="text/css">
</style>
    	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>柱状图</title>
    <script src="js/jquery-1.8.3.min.js" type="text/javascript"></script>
		
		<style type="text/css">
         ${demo.css}
		</style>
		<script type="text/javascript">
		    $(function () {
		        $('#container').highcharts({
		            data: {
		                table: 'datatable'
		            },
		            chart: {
		                type: 'column'
		            },
		            title: {
		                text: '<%=year()%>年收益统计表'
		            },
		            yAxis: {
		                allowDecimals: false,
		                title: {
		                    text: 'Units'
		                }
		            },
		            tooltip: {
		                formatter: function () {
		                    return '<b>' + this.series.name + '</b><br/>' +
                    this.point.y + ' ' + this.point.name.toLowerCase();
		                }
		            }
		        });
		    });
		</script>


</head>
    
<script src="../../js/highcharts.js"></script>
<script src="../../js/modules/data.js"></script>
<script src="../../js/modules/exporting.js"></script>

<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto; overflow:hidden;"></div>

<table id="datatable">
	<thead>
		<tr  style=" display:none">
			<th></th>
			<th>今年</th>
			<th>去年</th>
		</tr>
	</thead>
<body style="text-align: center">
    <form id="form1" runat="server">

   
 <div id="bk">
	<tbody style=" display:none">

    <%=month()%>


	</tbody>
</table>
	



</div>
   
    </form>
</body>
</html>
