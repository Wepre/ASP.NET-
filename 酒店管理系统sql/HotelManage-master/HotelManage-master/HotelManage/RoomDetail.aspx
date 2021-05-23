<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="RoomDetail.aspx.cs" Inherits="HotelManage.RoomDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>用户入住信息详情（表）</title>
    <script src="Scripts/jquery-1.4.1-vsdoc.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready
       (
         function () {

             var bkcss = { background: 'white',border: '0px' }
             var divcss = { background: 'white', height: '630px', border: '0px' };
             var txtcss = { background: 'transparent' };
             var bt = { display: 'none' };


             $("#Button6").bind("click", function () {
                 $("#research").css(divcss);
                 $(".text").css(txtcss);
                 $("#txtMark").css(txtcss);
                 $("td").css(txtcss);
                 $(".buttom").css(bt);
                 $("#bk").css(bkcss);
                 window.print();


             });
         });

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
#bk{ border: solid 2px white;border-radius:15px; width:1170px ; height:630px; position:relative;top:-7px; background-color:#ffffff;}
#research{ height:292px; background-color:#ffffff; width:100%;border-radius:15px 15px 0px 0px; font-size:15px; color:#000000;-webkit-box-shadow:#ffffff 0px 0px 10px;}

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphRight" runat="server">
       <div id="bk" class="style2">





<div id="research">
    <div id="table">
    
      <table  cellpadding="0" cellspacing="0" width="800">
            <tr>
  <td   class="tdstyle" colspan="4" height="52"><span style=" font-size:24px;">&nbsp;用户入住信息详情表
  
      <input id="Button6" type="button" value="预览并打印" class="buttom" style=" width:120px"/>
  
  </span></td>

  

</tr>
<tr>
  <td class="tdstyle"  width="115" >&nbsp; 顾客编号：</td>
  <td width="270" >
      <asp:TextBox ID="txtGid" runat="server" CssClass="text" ></asp:TextBox>
    </td>
  <td width="115"  class="tdstyle">&nbsp; 顾客姓名：</td>
  <td width="270" height="40">
      <asp:TextBox ID="txtGname" runat="server" CssClass="text"></asp:TextBox>
    </td>
</tr>
<tr>
  <td  class="tdstyle">&nbsp; 顾客性别：</td>
  <td class="style3">
      <asp:TextBox ID="txtSex" runat="server" CssClass="text"></asp:TextBox>
    </td>
  <td  class="tdstyle">&nbsp; 联系方式：</td>
  <td height="37">
      <asp:TextBox ID="txtMobile" runat="server" CssClass="text"></asp:TextBox>
    </td>
</tr>
<tr>
  <td  class="tdstyle">&nbsp; 顾客等级：</td>
  <td class="style3">
      <asp:TextBox ID="txtTName" runat="server" CssClass="text"></asp:TextBox>
    </td>
  <td  class="tdstyle">&nbsp; 身份证号：</td>
  <td height="37">
      <asp:TextBox ID="txtPid" runat="server" CssClass="text"></asp:TextBox>
    </td>
</tr>
<tr>
  <td   class="tdstyle">&nbsp; 楼层信息：</td>
  <td>
      <asp:TextBox ID="txtFName" runat="server" CssClass="text"></asp:TextBox>
    </td>
  <td   class="tdstyle">&nbsp; 房间类型：</td>
  <td height="37">
      <asp:TextBox ID="txtRTName" runat="server" CssClass="text"></asp:TextBox>
    </td>
</tr>

<tr>
  <td   class="tdstyle">&nbsp; 入住时间：</td>
  <td>
      <asp:TextBox ID="txtInTime" runat="server" CssClass="text"></asp:TextBox>
    </td>
  <td   class="tdstyle">&nbsp; 房间编号：</td>
  <td height="37">
      <asp:TextBox ID="txtRoomName" runat="server" CssClass="text"></asp:TextBox>
    </td>
</tr>

<tr>
  <td   class="tdstyle">&nbsp; 退房时间：</td>
  <td>
      <asp:TextBox ID="txtOutTime" runat="server" CssClass="text"></asp:TextBox>
    </td>
  <td   class="tdstyle">&nbsp; 本次押金：</td>
  <td height="37">
      <asp:TextBox ID="txtCharge" runat="server" CssClass="text"></asp:TextBox>
    </td>
</tr>
<tr>
  <td   class="tdstyle">&nbsp; 入住天数：</td>
  <td>
      <asp:TextBox ID="txtDayNum" runat="server" CssClass="text"></asp:TextBox>
    </td>
  <td   class="tdstyle">&nbsp; 累计消费：</td>
  <td height="37">
      <asp:TextBox ID="txtChargeSum" runat="server" CssClass="text"></asp:TextBox>
    </td>
</tr>






<tr>
  <td width="93" style="height:101px;"  class="tdstyle">备注信息：</td>
  <td colspan="3"  >
      <asp:TextBox ID="txtMark" runat="server" Width="660" Height="101" 
          TextMode="MultiLine" Font-Names="微软雅黑" Font-Size="16pt" BackColor="#ffffff" ></asp:TextBox>
    </td>
  </tr>
  <tr>
  <td colspan="4" style="height:40px"   class="tdstyle">
       <asp:Button ID="btnAdd" runat="server" Text="续房" CssClass="buttom" 
          onclick="btnAdd_Click" />
      &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;     
      <asp:Button ID="btnChangeR" runat="server" Text="换房" CssClass="buttom" 
          onclick="btnChangeR_Click" />
      &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; 
      <asp:Button ID="btnCheckOut" runat="server" CssClass="buttom" Text="退房" 
          onclick="btnCheckOut_Click" />
      &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; 
      <input type="button" onclick="javascript:window.history.go(-1);"value="返回" class="buttom">
      </td>


</tr>
</table>
    </div>


</div>

    </div>
</asp:Content>
