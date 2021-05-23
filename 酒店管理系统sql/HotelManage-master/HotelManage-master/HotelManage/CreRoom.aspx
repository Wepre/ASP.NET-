<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="CreRoom.aspx.cs" Inherits="HotelManage.CreRoom" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>房间开通登记（表）</title>
<style type="text/css">
table{border:solid 1px #747474}
tr{border:solid 1px #747474}
td{border:solid 1px #747474}
#table{ font-size:16px; font-family:微软雅黑; position:relative; top:50px; left:201px;border-radius:15px 15px 0px 0px;}
.tdstyle{ background-color:#ffffff;text-align:center}
.text{margin-left: 0px;Height:40px; width:272px; border:0px; font-size:20px; font-family:微软雅黑; background-color:#ffffff}
.buttom{ background:#00AA68;  width:100px;  height:30px; cursor:pointer;font-size:20px; font-family:微软雅黑; border:1px solid #CCCCCC;border-radius:8px;}
body{text-align:center; overflow-y:auto;overflow-X:auto;}
.gd{font-size:14px; position:relative; top:10px;text-align: center;}
#bk{ border: solid 2px White;border-radius:15px; width:1170px ; height:630px; position:relative;top:-7px; background-color:#ffffff}
#research{ height:400px; background-color:#ffffff; width:100%;border-radius:15px 15px 0px 0px; font-size:15px; color:#000000;-webkit-box-shadow:#ffffff 0px 0px 10px;-moz-box-shadow:#666 0px 0px 10px}

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphRight" runat="server">
        <div id="bk" class="style2">




<div id="research">
            <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
    <div id="table">
    
      <table  cellpadding="0" cellspacing="0" width="765">

            <tr>
  <td   class="tdstyle" colspan="4" height="52"><span style=" font-size:24px;">&nbsp; 房间开通登记表</span></td>

</tr>
<tr>
  <td class="tdstyle"  width="115" >&nbsp; 房间序号：</td>
  <td width="270" >
      <asp:TextBox ID="txtRoomId" runat="server" CssClass="text" ></asp:TextBox>
    </td>
  <td width="115"  class="tdstyle">&nbsp; 输入名称：</td>
  <td width="270" height="40">
      <asp:TextBox ID="txtRoomName" runat="server" CssClass="text" placeholder="请输入名称 如:C025" ></asp:TextBox>
    </td>
</tr>
<tr>
  <td  class="tdstyle">&nbsp; 选择楼层：</td>
  <td class="style3">
      <asp:DropDownList ID="ddlFName" runat="server" AutoPostBack="True" 
          CssClass="text">
      </asp:DropDownList>
    </td>
  <td  class="tdstyle">&nbsp; 房间类型：</td>
  <td height="37">
      <asp:TextBox ID="txtRTName" runat="server" CssClass="text"></asp:TextBox>
    </td>
</tr>



<tr>
  <td width="93" style="height:101px;"  class="tdstyle">&nbsp; 备注信息：</td>
  <td colspan="3"  >
      <asp:TextBox ID="TextBox7" runat="server" Width="660" Height="101" 
          TextMode="MultiLine" Font-Names="微软雅黑" Font-Size="16pt" BackColor="#ffffff" ></asp:TextBox>
    </td>
  </tr>
  <tr>
  <td colspan="4" style="height:40px"   class="tdstyle">
     <asp:Button ID="btnSubmit" runat="server" Text="提交" CssClass="buttom" 
          onclick="btnSubmit_Click" />
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="button" onclick="javascript:window.history.go(-1);"value="返回" class="buttom">
      </td>


</tr>
</table>
    </div>
    </ContentTemplate></asp:UpdatePanel>

</div>

    </div>
</asp:Content>
