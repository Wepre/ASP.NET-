<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="CheckIn.aspx.cs" Inherits="HotelManage.CheckIn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>用户入住信息登记（表）</title>
        <script src="laydate/laydate.js" type="text/javascript"></script>
<script type="text/jscript">
   function aa(){
   
   
   }
   
   
    !function ()
     {
        laydate.skin('molv'); //切换皮肤，请查看skins下面皮肤库
        laydate({ elem: '#demo' }); //绑定元素
        
    } ();
    //日期范围限制

    
    var start = {
        elem: '#start',
        format: 'YYYY-MM-DD',
        min: laydate.now(), //设定最小日期为当前日期
        max: '2099-06-16', //最大日期
        istime: true,
        istoday: false,
        choose: function (datas) {
            end.min = datas; //开始日选好后，重置结束日的最小日期
            end.start = datas //将结束日的初始值设定为开始日
        }
    };
    var end = {
        elem: '#end',
        format: 'YYYY-MM-DD',
        min: laydate.now(),
        max: '2099-09-16',
        istime: true,
        istoday: false,
        choose: function (datas) {
            start.max = datas; //结束日选好后，充值开始日的最大日期
        }
    };
    laydate(start);
    laydate(end);
    
    //自定义日期格式
    laydate({
        elem: '#test1',
        format: 'YYYY年MM月DD日',
        festival: true, //显示节日
        choose: function (datas) { //选择日期完毕的回调
            alert('得到：' + datas);
        }
    });
    //日期范围限定在昨天到明天
    laydate({
        elem: '#hello3',
        min: laydate.now(-1), //-1代表昨天，-2代表前天，以此类推
        max: laydate.now(+1) //+1代表明天，+2代表后天，以此类推
    });
</script>

<style type="text/css">
table{border:solid 1px #747474}
tr{border:solid 1px #747474}
td{border:solid 1px #747474}
#table{ font-size:16px; font-family:微软雅黑; position:relative; top:50px; left:201px;border-radius:15px 15px 0px 0px;}
.tdstyle{ background-color:#ffffff;text-align:center}
.text{margin-left: 0px;Height:40px; width:272px; border:0px; font-size:20px; font-family:微软雅黑; background-color:#ffffff; color:Black; border-style:none}
.buttom{ background:#00AA68;  width:100px;  height:30px; cursor:pointer;font-size:20px; font-family:微软雅黑; border:1px solid #CCCCCC;border-radius:8px;}
body{text-align:center; overflow-y:auto;overflow-X:auto;}
.gd{font-size:14px; position:relative; top:10px;text-align: center;}
#bk{ border: solid 2px gray;border-radius:15px; width:1170px ; height:630px; position:relative;top:-7px; background-color:#ffffff}
#research{ height:300px; background-color:#ffffff; width:100%;border-radius:15px 15px 0px 0px; font-size:15px; color:Black;-webkit-box-shadow:#ffffff 0px 0px 10px;-moz-box-shadow:#666 0px 0px 10px}
.error{ color:Red; font-size:18px; position:relative; right:200px;  font-family:微软雅黑}
.text1{margin-left: 0px;Height:40px; width:272px; border:0px; font-size:20px; font-family:微软雅黑; background-color:#ffffff; color:Black; border-style:none; background-image:url("images/checkdate.png"); background-repeat:no-repeat; background-position:234px 5px }

    .auto-style1 {
        width: 270px;
    }

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphRight" runat="server">
    <div id="bk" class="style2">




<div id="research">
    <div id="table">
    

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
               




      <table  cellpadding="0" cellspacing="0" width="830">

      <tr>
  <td   class="tdstyle" colspan="4" height="52"><span style=" font-size:24px;">&nbsp;用户入住信息登记表</span></td>

</tr>

<tr>
  <td class="tdstyle"  width="115" >&nbsp; 顾客编号：</td>
  <td width="270" >
      <asp:TextBox ID="txtGid" runat="server" CssClass="text" Enabled="False" ></asp:TextBox>
    </td>
  <td width="115"  class="tdstyle">&nbsp; 顾客姓名：</td>
  <td height="40" class="auto-style1">
      <asp:TextBox ID="txtGname" runat="server" CssClass="text" Enabled="False"></asp:TextBox>
    </td>
</tr>
<tr>
  <td  class="tdstyle">&nbsp; 联系方式：</td>
  <td class="style3">
      <asp:TextBox ID="txtMobile" runat="server" CssClass="text" Enabled="False"></asp:TextBox>
    </td>
  <td  class="tdstyle">&nbsp; 房间类型：</td>
  <td height="37" class="auto-style1">
      <asp:DropDownList ID="ddlRTName" runat="server"  CssClass="text" 
          onselectedindexchanged="ddlRTName_SelectedIndexChanged" 
          AutoPostBack="True">
      </asp:DropDownList>
    </td>
</tr>
<tr>
  <td  class="tdstyle">&nbsp; 顾客等级：</td>
  <td class="style3">
      <asp:TextBox ID="txtTName" runat="server" CssClass="text" Enabled="False" ></asp:TextBox>
    </td>
  <td  class="tdstyle">&nbsp; 房间编号：</td>
  <td height="37" class="auto-style1">
      <asp:DropDownList ID="ddlRoomName" runat="server"  CssClass="text">
      </asp:DropDownList>
    </td>
</tr>
<tr>
  <td   class="tdstyle">&nbsp; 入住时间：</td>
  <td>

    
      <asp:TextBox ID="txtInTime" runat="server" CssClass="text1" AutoPostBack="True" 
          ontextchanged="txtInTime_TextChanged" ></asp:TextBox>
    </td>
  <td   class="tdstyle">&nbsp; 入住天数：</td>
  <td height="37" class="auto-style1">
      <asp:TextBox ID="txtDays" runat="server" CssClass="text" AutoPostBack="True" 
          ontextchanged="txtDays_TextChanged"  placeholder="请输入天数" ></asp:TextBox>
    </td>
</tr>

<tr>
  <td   class="tdstyle">&nbsp; 到期时间：</td>
  <td>
      <asp:TextBox ID="txtOutTime" runat="server" CssClass="text" AutoPostBack="True"></asp:TextBox>
    </td>
  <td   class="tdstyle">&nbsp; 交付押金：</td>
  <td height="37" class="auto-style1">
      <asp:TextBox ID="txtCharge" runat="server" CssClass="text"></asp:TextBox>
    </td>
</tr>


<tr>
  <td width="200" style="height:101px;"  class="tdstyle">备注信息：</td>
  <td colspan="3"  >
      &nbsp;&nbsp;<asp:TextBox ID="txtRemark" runat="server" Width="720px" Height="98px" 
          TextMode="MultiLine" Font-Names="微软雅黑" Font-Size="16pt" BackColor="#ffffff" >暂无备注</asp:TextBox>
    </td>
  </tr>
  <tr>
  <td colspan="4" style="height:40px"   class="tdstyle">
      <asp:Button ID="btnSubmint" runat="server" Text="提交" CssClass="buttom" 
          onclick="btnSubmint_Click" />
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <input type="button" onclick="javascript:window.history.go(-1);"value="取消" class="buttom">
      </td>


</tr>
</table>

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>


</div>

    </div>
</asp:Content>
