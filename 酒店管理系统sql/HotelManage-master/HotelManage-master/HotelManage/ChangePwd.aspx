<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="ChangePwd.aspx.cs" Inherits="HotelManage.ChangePwd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>修改密码（后台设置）</title>
        <style type="text/css">
body{text-align:center; overflow-y:auto;overflow-X:auto; font-family:微软雅黑}
.gd{font-size:14px; position:relative; top:10px;text-align: center;}
#bk{ border: solid 2px gray;border-radius:15px; width:1170px ; height:630px; position:relative;top:-7px; background-color:#ffffff}
#research{ height:350px; background-color:#ffffff; width:100%;border-radius:15px 15px 0px 0px; font-size:15px; color:#343434;-webkit-box-shadow:#fff 0px 0px 10px;-moz-box-shadow:#666 0px 0px 10px}
.bt{ width:170px; height:22px}
.button{ border-style:none;background:#00AA68;  width:272px;  height:40px; position:relative;left:119px;cursor:pointer;font-size:20px; font-family:微软雅黑;top: 0px;}
.style1{text-align: left; position:relative; left:300px; font-size:22px}
 .style2{text-align: right;}
 .text{margin-left: 0px;Height:40px; width:272px; font-size:20px; font-family:微软雅黑; background-color:#ffffff; color:Black; border-style:none; border:solid 2px Black;}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphRight" runat="server">
     <div id="bk" class="style2">


    <div id="research">
        <br />
        <br />
        <br />
        <div class="style1">
            当前操作员：<asp:TextBox ID="txtOName" runat="server" CssClass="text"></asp:TextBox>
        &nbsp;&nbsp;
            <br />
            <br />
            原&nbsp;&nbsp; 密&nbsp;&nbsp; 码：&nbsp;&nbsp;<asp:TextBox ID="txtOldPwd" runat="server" 
                CssClass="text" TextMode="Password"></asp:TextBox>
        <br /><br />
            新&nbsp;&nbsp; 密&nbsp;&nbsp; 码：&nbsp;&nbsp;<asp:TextBox ID="txtNewPwd" runat="server" CssClass="text"  TextMode="Password"></asp:TextBox>
        &nbsp;&nbsp;
            <br />
            <br />
            确认新密码：<asp:TextBox ID="txtEnPwd" runat="server" CssClass="text"  TextMode="Password"></asp:TextBox>
        <br /><br />
        &nbsp; <asp:Button ID="btnSubmit" runat="server" 
                Text="提        交" CssClass="button" 
                onclick="btnSubmit_Click" BackColor="White" BorderColor="Black" BorderStyle="Solid" ForeColor="Black"/>
        </div>
        <br />
        </div>
    
      

    
    </div>
</asp:Content>
