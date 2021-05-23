<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="changepwd.aspx.cs" Inherits="showtime.changepwd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="CSS/login.css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server" class="box">
    <div>
       <h1>密码修改</h1>
            <asp:TextBox ID="org_pwd" runat="server" ToolTip="Username" placeholder="原密码" TextMode="Password"></asp:TextBox>
            <asp:TextBox ID="newpwd" runat="server" TextMode="password" ToolTip="新密码" placeholder="新密码"></asp:TextBox>
            <asp:Button ID="sure" runat="server" Text="确认" OnClick="sure_Click1" />
        <a  href="index.aspx" class="show">返回首页</a>
   </div>
    </form>
</body>
</html>
