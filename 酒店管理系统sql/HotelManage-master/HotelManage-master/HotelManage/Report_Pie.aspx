<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Report_Pie.aspx.cs" Inherits="HotelManage.Report_Pie" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>饼状图</title>

   <script src="js/jquery-1.8.3.min.js" type="text/javascript"></script>
		<style type="text/css">
${demo.css}
		</style>
		<script type="text/javascript">
		    $(function () {
		        $('#container').highcharts({
		            chart: {
		                plotBackgroundColor: null,
		                plotBorderWidth: null,
		                plotShadow: false
		            },
		            title: {
		                text: '<%=year()%>年每月收益比例图'
		            },
		            tooltip: {
		                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
		            },
		            plotOptions: {
		                pie: {
		                    allowPointSelect: true,
		                    cursor: 'pointer',
		                    dataLabels: {
		                        enabled: true,
		                        format: '<b>{point.name}</b>: {point.percentage:.1f} %',
		                        style: {
		                            color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
		                        }
		                    }
		                }
		            },
		            series: [{
		                type: 'pie',
		                name: '销售额占比：',
		                data: [
                        <%=pie()%>
                ['其他月份',0]
            ]
		            }]
		        });
		    });


		</script>
	</head>
	<body>
<script src="../../js/highcharts.js"></script>
<script src="../../js/modules/exporting.js"></script>

<div id="container" style="width:100%;height: 400px; margin: 0 auto"></div>

	</body>
</html>
