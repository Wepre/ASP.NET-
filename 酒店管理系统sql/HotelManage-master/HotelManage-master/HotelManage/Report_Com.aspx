<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Report_Com.aspx.cs" Inherits="HotelManage.Report_cOM" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>混合图</title>
    <script src="js/jquery-1.8.3.min.js" type="text/javascript"></script>
		<style type="text/css">
${demo.css}
		</style>
		<script type="text/javascript">
		    $(function () {
		        $('#container').highcharts({
		            title: {
		                text: '近三年收益对比图'
		            },
		            xAxis: {
		                categories: ['一月', '二月', '三月', '四月', '五月','六月','七月','八月','九月','十月','十一月','十二月']
		            },
		            labels: {
		                items: [{
		                    html: '近三年收益额饼状图',
		                    style: {
		                        left: '58px',
		                        top: '-40px',
		                        color: (Highcharts.theme && Highcharts.theme.textColor) || 'black'
		                    }
		                }]
		            },
		            series: [{
		                type: 'column',
		                name: '今年',
		                data: [<%=now()%>]
		            }, {
		                type: 'column',
		                name: '去年',
		                data: [<%=last()%>]
		            }, {
		                type: 'column',
		                name: '前年',
		                data: [<%=final()%>]
		            }, {
		                type: 'spline',
		                name: '走势图',
		                data: [<%=now()%>],
		                marker: {
		                    lineWidth: 3,
		                    lineColor: Highcharts.getOptions().colors[3],
		                    fillColor: 'white'
		                }
		            }, {
		                type: 'pie',
		                name: 'Total consumption',
		                data: [{
		                    name: '前年',
		                    y: <%=pie("1")%>,
		                    color: Highcharts.getOptions().colors[0] 
		                }, {
		                    name: '去年',
		                    y: <%=pie("2")%>,
		                    color: Highcharts.getOptions().colors[1] 
		                }, {
		                    name: '今年',
		                    y: <%=pie("3")%>,
		                    color: Highcharts.getOptions().colors[2]
		                }],
		                center: [100, 10],
		                size: 100,
		                showInLegend: false,
		                dataLabels: {
		                    enabled: true
		                }
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