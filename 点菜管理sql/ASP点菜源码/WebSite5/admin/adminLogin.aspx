<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMP.master" AutoEventWireup="true" CodeFile="adminLogin.aspx.cs" Inherits="admin_adminLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style9
        {
            width: 177px;
        }
        .style10
        {
            width: 632px;
        }
        .style11
        {
            width: 177px;
            height: 69px;
        }
        .style12
        {
            width: 632px;
            height: 69px;
        }
        .style13
        {
            height: 69px;
        }
        .style14
        {
            width: 177px;
            height: 234px;
        }
        .style15
        {
            width: 632px;
            height: 234px;
        }
        .style16
        {
            height: 234px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%; height: 452px;">
        <tr>
            <td class="style11">
            </td>
            <td class="style12">
            </td>
            <td class="style13">
            </td>
        </tr>
        <tr>
            <td class="style14">
            </td>
            <td class="style15" style="vertical-align: top">
                <asp:Label ID="LbAdmin" runat="server" Font-Bold="True" Font-Size="Small" 
                    Height="17px" Text="管理员账号" Width="86px"></asp:Label>
&nbsp;
                <asp:TextBox ID="TbAccount" runat="server" ValidationGroup="1"></asp:TextBox>
&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TbAccount" ErrorMessage="*必填项" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <br />
                <asp:Label ID="LbPassword" runat="server" Font-Bold="True" Font-Size="Small" 
                    Height="17px" Text="管理员密码" Width="86px"></asp:Label>
&nbsp;
                <asp:TextBox ID="TbPasseord" runat="server" ValidationGroup="1" 
                    TextMode="Password"></asp:TextBox>
&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="TbPasseord" ErrorMessage="*必填项" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="BtnLogin" runat="server" Font-Bold="True" 
                    onclick="BtnLogin_Click" Text="进入管理中心" ValidationGroup="1" />
            </td>
            <td class="style16">
            </td>
        </tr>
        <tr>
            <td class="style9">
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

