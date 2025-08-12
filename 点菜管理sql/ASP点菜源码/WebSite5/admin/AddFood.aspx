<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMP.master" AutoEventWireup="true" CodeFile="AddFood.aspx.cs" Inherits="admin_AddFood" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style9
        {
            width: 105px;
        }
        .style10
        {
            width: 736px;
        }
        .style11
        {
            width: 343px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%; height: 424px;">
        <tr>
            <td class="style9">
                &nbsp;</td>
            <td class="style10" rowspan="3" style="vertical-align: top; text-align: left">
                <table style="width: 100%; height: 199px;">
                    <tr>
                        <td class="style11" style="text-align: right">
                            商品名称</td>
                        <td>
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="TextBox1" ErrorMessage="*商品名称不能为空" ForeColor="Red" 
                                ValidationGroup="1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style11" style="text-align: right">
                            商品类型ID</td>
                        <td style="color: #FF0000;">
                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="TextBox2" ErrorMessage="*商品类型ID不能为空" ForeColor="Red" 
                                ValidationGroup="1"></asp:RequiredFieldValidator>
                            <br />
                            【ID提示：1.饮品 2.甜点 3.主餐】</td>
                    </tr>
                    <tr>
                        <td class="style11" style="text-align: right">
                            商品价格</td>
                        <td>
                            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="TextBox3" ErrorMessage="*商品价格不能为空" ForeColor="Red" 
                                ValidationGroup="1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style11" style="text-align: right">
                            商品图片路径</td>
                        <td>
                            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style11">
                            &nbsp;</td>
                        <td>
                            <asp:ImageButton ID="ImageButton1" runat="server" Height="29px" 
                                ImageUrl="~/WebIcon/Add Green Button.png" onclick="ImageButton1_Click" 
                                ValidationGroup="1" Width="41px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:ImageButton ID="ImageButton2" runat="server" Height="33px" 
                                ImageUrl="~/WebIcon/Pause Blue Button.png" onclick="ImageButton2_Click" 
                                ValidationGroup="2" Width="37px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style11">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
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

