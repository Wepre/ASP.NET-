<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="showtime.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link  rel="stylesheet" href="CSS/index.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>欢迎登录教材管理系统</title>
    <link rel="stylesheet" href="index.css" />
    
    <style type="text/css">
        .auto-style1 {
            border-style: none;
            border-color: inherit;
            border-width: 0;
            position : absolute;
            width: 50px;
            height: 47px;
            right: 0px;
            top: 0px;
            background: none;
            display: inline;
            cursor: pointer;
            background: url('image/搜索.png') ;
            opacity: 0.5;
            background-size: cover;
            left: 288px;
        }
    </style>
    
</head>
<body style="height: 183px">
    <form id="form1" runat="server" class="box">
        <p class="title">教材管理系统</p>
        <div class="label">
            <span><asp:Button ID="btn_my" runat="server" Text="我的借书" />
            <asp:Button ID="btn_pwd" runat="server" Text="修改密码" OnClick="btn_pwd_Click" />
            <asp:Button ID="btn_exit" runat="server" Text="退出登录" OnClick="btn_exit_Click" /></span>
        </div>
        <div class="biglabel">
            <span><asp:Button ID="btn_book" runat="server" Text="教材信息" OnClick="btn_book_Click" /> <asp:Button ID="btn_buy" runat="server" Text="订购信息" OnClick="btn_buy_Click" /><asp:Button ID="btn_std" runat="server" Text="学生信息" OnClick="btn_std_Click" /> <asp:Button ID="btn_letout" runat="server" Text="发放信息" OnClick="btn_letout_Click" /></span>
        </div>
        <div class="container">

        <asp:TextBox ID="search" runat="server" placeholder="书籍名称、类型  回车搜索" CssClass="auto-style1" style="left: 0px; top: -1px" Font-Size="18pt" ForeColor="White"></asp:TextBox>
            <div class="">
                <asp:Button ID="btn_search" runat="server" Text="" ToolTip="搜索"  CssClass="add_icon" OnClick="btn_search_Click" />
            </div>
        </div>
        
        <asp:Label ID="Label1" runat="server" Text="欢迎" CssClass="welcome"></asp:Label>
        
    </form>
</body>
</html>
