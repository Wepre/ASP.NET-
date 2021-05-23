<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="showtime.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<link rel="stylesheet" href="CSS/login.css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>教材管理系统登录</title>
</head>
<body>
    <form id="form1" runat="server" class="box">
   <div>
       <h1>教材管理系统登录</h1>
            <asp:TextBox ID="name" runat="server" ToolTip="Username" placeholder="Username"></asp:TextBox>
            <asp:TextBox ID="pwd" runat="server" TextMode="Password" ToolTip="Password" placeholder="Password"></asp:TextBox>
            <asp:Button ID="btn" runat="server" Text="登录" OnClick="btn_Click" />
        <a  href="register.aspx" class="show">没有帐号点我</a>
   </div>
        
    </form>
</body>
</html>
