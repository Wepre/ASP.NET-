<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Stdmsg.aspx.cs" Inherits="showtime.Studentmsg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="CSS/stdmsg.css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <div class="title"><h1>学生信息</h1></div>
    <form id="form1" runat="server" class="box">
    <div>
        <a class="return" href="index.aspx" >返回首页</a>
        <asp:SqlDataSource ID="STDMSG" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:bigworkConnectionString %>" DeleteCommand="DELETE FROM std_msg WHERE [id] = ? AND (([name] = ?) OR ([name] IS NULL AND ? IS NULL)) AND (([classid] = ?) OR ([classid] IS NULL AND ? IS NULL)) AND (([academy] = ?) OR ([academy] IS NULL AND ? IS NULL)) AND (([bookid] = ?) OR ([bookid] IS NULL AND ? IS NULL)) AND (([note] = ?) OR ([note] IS NULL AND ? IS NULL))" InsertCommand="INSERT INTO std_msg ([id], [name], [classid], [academy], [bookid], [note]) VALUES (?, ?, ?, ?, ?, ?)" OldValuesParameterFormatString="original_{0}" ProviderName="<%$ ConnectionStrings:bigworkConnectionString.ProviderName %>" SelectCommand="SELECT * FROM std_msg" UpdateCommand="UPDATE std_msg SET [name] = ?, [classid] = ?, [academy] = ?, [bookid] = ?, [note] = ? WHERE [id] = ? AND (([name] = ?) OR ([name] IS NULL AND ? IS NULL)) AND (([classid] = ?) OR ([classid] IS NULL AND ? IS NULL)) AND (([academy] = ?) OR ([academy] IS NULL AND ? IS NULL)) AND (([bookid] = ?) OR ([bookid] IS NULL AND ? IS NULL)) AND (([note] = ?) OR ([note] IS NULL AND ? IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_name" Type="String" />
                <asp:Parameter Name="original_name" Type="String" />
                <asp:Parameter Name="original_classid" Type="String" />
                <asp:Parameter Name="original_classid" Type="String" />
                <asp:Parameter Name="original_academy" Type="String" />
                <asp:Parameter Name="original_academy" Type="String" />
                <asp:Parameter Name="original_bookid" Type="String" />
                <asp:Parameter Name="original_bookid" Type="String" />
                <asp:Parameter Name="original_note" Type="String" />
                <asp:Parameter Name="original_note" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="id" Type="Int32" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="classid" Type="String" />
                <asp:Parameter Name="academy" Type="String" />
                <asp:Parameter Name="bookid" Type="String" />
                <asp:Parameter Name="note" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="classid" Type="String" />
                <asp:Parameter Name="academy" Type="String" />
                <asp:Parameter Name="bookid" Type="String" />
                <asp:Parameter Name="note" Type="String" />
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_name" Type="String" />
                <asp:Parameter Name="original_name" Type="String" />
                <asp:Parameter Name="original_classid" Type="String" />
                <asp:Parameter Name="original_classid" Type="String" />
                <asp:Parameter Name="original_academy" Type="String" />
                <asp:Parameter Name="original_academy" Type="String" />
                <asp:Parameter Name="original_bookid" Type="String" />
                <asp:Parameter Name="original_bookid" Type="String" />
                <asp:Parameter Name="original_note" Type="String" />
                <asp:Parameter Name="original_note" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        
        
    
        <asp:GridView ID="GG" runat="server" ForeColor="White" Height="98px" OnRowCancelingEdit="GG_RowCancelingEdit" OnRowEditing="GG_RowEditing" OnRowUpdating="GG_RowUpdating" Width="426px">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
            </Columns>
        </asp:GridView>
        
        
    
    </div>
    </form>
</body>
</html>
