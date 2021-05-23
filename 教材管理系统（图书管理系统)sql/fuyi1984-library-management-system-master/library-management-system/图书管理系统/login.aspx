<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="教材管理系统.login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <style type="text/css">
        .style1 {
            font-family: 华文楷体;
            font-size: xx-large;
            font-weight: bold;
        }
        body {

            background-image: url(./界面设计/QQ图片20201127125629.png);

            background-size:100% 100%;

            background-repeat: no-repeat;

            background-attachment: fixed;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div align="center" style="height: 274px">

            <span class="style1">教材管理系统<br />
                <br />
            </span>
            <asp:Label ID="Label3" runat="server" Text="登录身份："></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem Value="1">教材馆管理员</asp:ListItem>
                    <asp:ListItem Value="2">学生</asp:ListItem>
                </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="用户："></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" Width="150px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="密码："></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" Width="150px"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="登录" OnClick="Button1_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="清空" OnClick="Button2_Click" />

        </div>
    </form>
</body>
</html>
