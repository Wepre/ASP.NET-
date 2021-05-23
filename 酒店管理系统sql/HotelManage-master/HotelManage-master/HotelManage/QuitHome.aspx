<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="QuitHome.aspx.cs" Inherits="HotelManage.QuitHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>用户退房结算（表）</title>
        	<script type = "text/javascript" src = "js/jquery.min.js"></script>
<script src="Scripts/jquery-1.4.1-vsdoc.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready
       (

         function () {
             var divcss = { background: 'white', height: '630px' };
             var txtcss = { background: 'transparent' };
             var bt = { display: 'none' };
           
             $("#Button6").bind("click", function () {
                 $("#research").css(divcss);
                 $(".text").css(txtcss);
                 $("#txtRemark").css(txtcss);
                 $("td").css(txtcss);
                 $(".buttom").css(bt);
                 window.print();


             });






         }
       );

</script>





<style type="text/css">
table{border:solid 1px #747474}
tr{border:solid 1px #747474}
td{border:solid 1px #747474}
#table{ font-size:16px; font-family:微软雅黑; position:relative; top:50px; left:201px;border-radius:15px 15px 0px 0px;}
.tdstyle{ background-color:#ffffff;text-align:center;}
.text{margin-left: 0px;Height:40px; width:272px; border:0px; font-size:20px; font-family:微软雅黑; background-color:#ffffff}
.buttom{ background:#00AA68;  width:100px;  height:30px; cursor:pointer;font-size:20px; font-family:微软雅黑; border:1px solid #CCCCCC;border-radius:8px;}
body{text-align:center; overflow-y:auto;overflow-X:auto;}
.gd{font-size:14px; position:relative; top:10px;text-align: center;}
#bk{ border: solid 2px white;border-radius:15px; width:1170px ; height:630px; position:relative;top:-7px; background-color:#ffffff}
#research{ height:290px; background-color:#ffffff; width:100%;border-radius:15px 15px 0px 0px; font-size:15px; color:#000000;-webkit-box-shadow:#ffffff 0px 0px 10px;-moz-box-shadow:#666 0px 0px 10px}

    .style1
    {
        background-color: #ffffff;
        width: 150px;
    }
    .style2
    {
        background-color: #ffffff;
        height: 101px;
        width: 150px;
    }

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphRight" runat="server">
    <div id="bk" class="style2">

    <!-- $("#btnSubmit").bind("click", function () { window.top.location = "index.aspx"; alert('退房成功！房间状态已更新为打扫状态，请尽快打扫。'); });-->


<div id="research">
    <div id="table">
    
      <table  cellpadding="0" cellspacing="0" width="860">

                  <tr>
  <td   class="tdstyle" colspan="4" height="52"><span style=" font-size:24px;">&nbsp; 用户退房结算详情表
  
      <span style=" font-size:24px;">
  
      <input id="Button6" type="button" value="预览并打印" class="buttom" style=" width:120px"/></span>
  
  </span></td>

  

</tr>


<tr>
  <td class="style1" >&nbsp; 顾客编号：</td>
  <td width="270" >
      <asp:TextBox ID="txtGid" runat="server" CssClass="text" ></asp:TextBox>
    </td>
  <td width="130"  class="tdstyle">&nbsp; 顾客姓名：</td>
  <td width="270" height="40">
      <asp:TextBox ID="txtGname" runat="server" CssClass="text"></asp:TextBox>
    </td>
</tr>
<tr>
  <td  class="style1">&nbsp; 顾客等级：</td>
  <td class="style3">
      <asp:TextBox ID="txtTName" runat="server" CssClass="text"></asp:TextBox>
    </td>
  <td  class="tdstyle">&nbsp; 房间类型：</td>
  <td height="37">
      <asp:TextBox ID="txtRTName" runat="server" CssClass="text"></asp:TextBox>
    </td>
</tr>
<tr>
  <td  class="style1">&nbsp; 顾客折扣：</td>
  <td class="style3">
      <asp:TextBox ID="txtTRate" runat="server" CssClass="text"></asp:TextBox>
    </td>
  <td  class="tdstyle">&nbsp; 房间编号：</td>
  <td height="37">
      <asp:TextBox ID="txtRoomName" runat="server" CssClass="text"></asp:TextBox>
    </td>
</tr>
<tr>
  <td   class="style1">&nbsp; 交付押金：</td>
  <td>
      <asp:TextBox ID="txtCharge" runat="server" CssClass="text"></asp:TextBox>
    </td>
  <td   class="tdstyle">&nbsp; 入住时间：</td>
  <td height="37">
      <asp:TextBox ID="txtInTime" runat="server" CssClass="text"></asp:TextBox>
    </td>
</tr>
<tr>
  <td   class="style1">&nbsp; 结算金额：</td>
  <td>
      <asp:TextBox ID="txtPrice" runat="server" CssClass="text"></asp:TextBox>
    </td>
  <td   class="tdstyle">&nbsp; 登记离开时间：</td>
  <td height="37">
      <asp:TextBox ID="txtOutTime" runat="server" CssClass="text"></asp:TextBox>
    </td>
</tr>
<tr>
  <td   class="style1">&nbsp; 实际入住天数：</td>
  <td>
      <asp:TextBox ID="txtFactDays" runat="server" CssClass="text"></asp:TextBox>
    </td>
  <td   class="tdstyle">&nbsp; 实际离开时间：</td>
  <td height="37">
      <asp:TextBox ID="txtNow" runat="server" CssClass="text"></asp:TextBox>
    </td>
</tr>


<tr>
  <td  class="style2">退房说明：</td>
  <td colspan="3"  >
      <asp:TextBox ID="txtRemark" runat="server" Width="700px" Height="101px" 
          TextMode="MultiLine" Font-Names="微软雅黑" Font-Size="16pt" 
          BackColor="#ffffff" style="margin-left: 0px" ></asp:TextBox>
    </td>
  </tr>
  <tr>
  <td colspan="4" style="height:40px"   class="tdstyle">
    <asp:Button ID="btnSubmit" runat="server" Text="确认退房" CssClass="buttom" 
          onclick="btnSubmit_Click" />
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:Button ID="Button2" runat="server" CssClass="buttom" Text="取消" />
      </td>


</tr>
</table>
    </div>


</div>

    </div>
</asp:Content>
