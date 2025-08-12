<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login2.aspx.cs" Inherits="Login2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="Stylesheet" type="text/css" href="css/LoginStyle.css" />
    <title></title>
    <style type="text/css">
        .style1
        {
            height: 147px;
        }
        .style2
        {
            width: 595px;
        }
        .style3
        {
            width: 595px;
            height: 46px;
        }
        .style4
        {
            height: 46px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width: 100%; height: 466px;">
            <tr>
                <td class="style1" style="text-align: center">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:HyperLink ID="HyperLink2" runat="server" Font-Size="XX-Large" 
                        ForeColor="#66FF33" NavigateUrl="~/ShowFoods.aspx">欢迎光临吃了么</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td style="text-align: left; vertical-align: top">
                    <table style="width: 100%; height: 185px;">
                        <tr>
                            <td class="style2" style="text-align: right">
                                <asp:Label ID="LBUsername" runat="server" Font-Size="Large" ForeColor="#66FF33" 
                                    Text="用户名"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TBUsername" runat="server" Height="23px" Width="211px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="TBUsername" Display="Dynamic" ErrorMessage="*请填写用户名！" 
                                    ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2" style="text-align: right">
                                <asp:Label ID="LBPwd" runat="server" Font-Size="Large" ForeColor="#66FF33" 
                                    Text="密码"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TBPwd" runat="server" Height="23px" Width="211px" 
                                    TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="TBPwd" Display="Dynamic" ErrorMessage="*请填写密码！" 
                                    ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style3" style="text-align: right">
                                <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="Red" 
                                    NavigateUrl="~/Register.aspx">尚未注册</asp:HyperLink>
                            </td>
                            <td class="style4">
                                <asp:ImageButton ID="IBLogin" runat="server" Height="19px" 
                                    ImageUrl="~/imgs/21.gif" Width="55px" onclick="IBLogin_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
