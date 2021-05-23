<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addbook.aspx.cs" Inherits="showtime.addbook" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<link rel="stylesheet"  href="CSS/addbook.css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server" class="box">
    <div >
    <h1>教材录入</h1>
        <asp:TextBox ID="bookID" runat="server" ToolTip="书籍编号" placeholder="书籍编号"></asp:TextBox>
        <asp:TextBox ID="bookname" runat="server" ToolTip="书籍名称" placeholder="书籍名称"></asp:TextBox>
        <asp:TextBox ID="type" runat="server" ToolTip="类型"  placeholder="类型"></asp:TextBox>
        <asp:TextBox ID="price" runat="server" ToolTip="价格"  placeholder="价格"></asp:TextBox>
        <asp:TextBox ID="amount" runat="server" ToolTip="数量"  placeholder="数量"></asp:TextBox>
        <asp:TextBox ID="note" runat="server" ToolTip="备注"  placeholder="备注"></asp:TextBox>
        <asp:Button ID="submit" runat="server" Text="提交" /><a href="index.aspx">返回首页</a>
    </div>
    </form>
</body>
</html>
