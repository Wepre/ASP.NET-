<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mybook.aspx.cs" Inherits="showtime.mybook" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="CSS/stdmsg.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <div class="title"><h1>我的借书</h1></div>
    <form id="form1" runat="server" class="box">
    <div>
        <a href="index.aspx" class="return">返回首页</a>
        <asp:GridView ID="G" runat="server" ForeColor="White" OnRowCancelingEdit="G_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting">
            <Columns>
                <asp:CommandField DeleteText="还书" ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
