<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="showtime.search" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="CSS/stdmsg.css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>搜索结果</title>
</head>
<body>
    <div class="title"><h1>搜索结果</h1></div>
    <form id="form1" runat="server" class="box">
    <div>
        <asp:GridView ID="G" runat="server" ForeColor="White" OnRowDeleting="G_RowDeleting">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="编号" />
                <asp:BoundField DataField="name" HeaderText="书名" />
                <asp:BoundField DataField="type" HeaderText="类型" />
                <asp:BoundField DataField="price" HeaderText="价钱" />
                <asp:BoundField DataField="amount" HeaderText="数量" />
                <asp:BoundField DataField="note" HeaderText="备注" />
                <asp:CommandField DeleteText="借书" ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
