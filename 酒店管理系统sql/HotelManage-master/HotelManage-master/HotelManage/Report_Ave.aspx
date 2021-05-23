<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Report_Ave.aspx.cs" Inherits="HotelManage.Report_Ave" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>走势图</title>

		<script type="text/javascript" src="../../js/jquery-1.8.3.min.js"></script>
		<style type="text/css">
${demo.css}
		</style>
		<script type="text/javascript">
		    $(function () {
		        $('#container').highcharts({
		            chart: {
		                type: 'spline'
		            },
		            title: {
		                text: '<%=year()%>年收益走势图'
		            },
		            subtitle: {
		                text: 'Source: WorldClimate.com'
		            },
		            xAxis: {
		                categories: ['一月', '二月', '三月', '四月', '五月', '六月',
                '七月', '八月', '九月', '十月', '十一月', '十二月']
		            },
		            yAxis: {
		                title: {
		                    text: '月成交额'
		                },
		                labels: {
		                    formatter: function () {
		                        return this.value + '元';
		                    }
		                }
		            },
		            tooltip: {
		                crosshairs: true,
		                shared: true
		            },
		            plotOptions: {
		                spline: {
		                    marker: {
		                        radius: 4,
		                        lineColor: '#666666',
		                        lineWidth: 1
		                    }
		                }
		            },
		            series: [{
		                name: '今年',
		                marker: {
		                    symbol: 'square'
		                },
		                data: [<%=AveNow()%>]

		            }, {
		                name: '去年',
		                marker: {
		                    symbol: 'diamond'
		                },
		                data: [<%=AveLast()%>]
		            }]
		        });
		    });
		</script>
	</head>
	<body>
<script src="../../js/highcharts.js"></script>
<script src="../../js/modules/exporting.js"></script>

<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>

	</body>
</html>
