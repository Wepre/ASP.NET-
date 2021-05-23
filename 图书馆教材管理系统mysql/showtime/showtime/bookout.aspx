<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bookout.aspx.cs" Inherits="showtime.bookout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="CSS/stdmsg.css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <div class="title"><h1>书本信息</h1></div>
    <form id="form1" runat="server" class="box">
    <div>
        <a class="return" href="index.aspx" >返回首页</a>
        <asp:GridView ID="G" runat="server" ForeColor="White" OnRowUpdating="GridView1_RowUpdating" OnSelectedIndexChanged="G_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
            </Columns>
        </asp:GridView>
        
        
    
       
        
        
    
    </div>
    </form>
</body>
</html>
