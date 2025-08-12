<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMP.master" AutoEventWireup="true" CodeFile="addUser.aspx.cs" Inherits="admin_addUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style9
        {
            width: 215px;
        }
        .style10
        {
            width: 644px;
        }
        .style11
        {
            width: 222px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%; height: 364px;">
        <tr>
            <td class="style9">
                &nbsp;</td>
            <td class="style10" rowspan="3" style="text-align: left; vertical-align: top">
                <table style="width: 100%; height: 223px;">
                    <tr>
                        <td class="style11" style="text-align: right">
                            用户名</td>
                        <td>
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="TextBox1" ErrorMessage="*用户名不能为空" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style11" style="text-align: right">
                            密码</td>
                        <td>
                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="TextBox2" ErrorMessage="*用户密码不能为空" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style11" style="text-align: right">
                            电话</td>
                        <td>
                            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="TextBox3" ErrorMessage="*用户电话不能为空" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style11" style="text-align: right">
                            地址</td>
                        <td>
                            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="TextBox4" ErrorMessage="*用户地址不能为空" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style11" style="text-align: right; vertical-align: top;">
                            会员状态</td>
                        <td style="color: #FF0000">
                            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ControlToValidate="TextBox5" ErrorMessage="*用户会员状态不能为空" ForeColor="Red"></asp:RequiredFieldValidator>
                            <br />
                            【提示：普通会员&lt;500;500&lt;=铜牌会员&lt;1000;<br />
                            1000&lt;=银牌会员&lt;1500;金牌会员&gt;=1500;<br />
                            除恢复用户数据外均默认：普通用户。】</td>
                    </tr>
                    <tr>
                        <td class="style11" style="text-align: right; vertical-align: top;">
                            消费总额</td>
                        <td style="color: #FF0000">
                            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                            <br />
                            【提示：初始用户此项为0】</td>
                    </tr>
                    <tr>
                        <td class="style11">
                            &nbsp;</td>
                        <td>
                            <asp:ImageButton ID="ImageButton1" runat="server" Height="29px" 
                                ImageUrl="~/WebIcon/Add Green Button.png" onclick="ImageButton1_Click" 
                                Width="39px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:ImageButton ID="ImageButton2" runat="server" Height="32px" 
                                ImageUrl="~/WebIcon/Pause Green Button.png" onclick="ImageButton2_Click" 
                                Width="37px" />
                        </td>
                    </tr>
                </table>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style9">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style9">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

