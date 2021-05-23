<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="submit.aspx.cs" Inherits="showtime.submit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link  rel="stylesheet" href="CSS/stdmsg.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <div class="title"><h1>订阅信息</h1></div>
    <form id="form1" runat="server" class="box">
    <div>
        <a class="return" href="index.aspx" >返回首页</a>
        <asp:GridView ID="GG" runat="server" ForeColor="White">
        </asp:GridView>
        
    
    </div>
    </form>
</body>
</html>
