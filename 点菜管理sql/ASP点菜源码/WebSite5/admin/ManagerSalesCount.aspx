<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMP.master" AutoEventWireup="true" CodeFile="ManagerSalesCount.aspx.cs" Inherits="admin_ManagerSalesCount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style10
        {
            width: 223px;
            height: 17px;
        }
        .style11
        {
            width: 223px;
            height: 388px;
        }
        .style15
        {
            width: 21px;
        }
        .style18
        {
            width: 68px;
        }
        .style17
        {
            width: 38px;
        }
        .style19
        {
            width: 531px;
        }
        .style20
        {
            width: 10px;
        }
        .style25
        {
            width: 150px;
        }
        .style26
        {
            width: 223px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 112%; height: 513px;">
        <tr>
            <td class="style10">
            </td>
            <td class="style19" rowspan="2" 
                style="vertical-align: top; text-align: left; font-size: small; font-weight: bold;">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AutoGenerateSelectButton="True" CellPadding="4" ForeColor="#333333" 
                    GridLines="None" Height="48px" 
                    onpageindexchanging="GridView1_PageIndexChanging" 
                    onselectedindexchanging="GridView1_SelectedIndexChanging" PageSize="6" 
                    Width="286px">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <br />
                总计销售额￥：<asp:Label ID="Label1" runat="server" Font-Bold="True" 
                    Font-Size="Medium" ForeColor="Red"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                最火的菜品：<asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Medium" 
                    ForeColor="Red"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 已卖出：<asp:Label 
                    ID="Label3" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Red"></asp:Label>
&nbsp;份&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 销售额￥：<asp:Label ID="Label4" 
                    runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Red"></asp:Label>
            </td>
            <td rowspan="2" 
                style="vertical-align: top; text-align: left; font-size: small; font-weight: bold;">
                <asp:DataList ID="DataList1" runat="server">
                    <ItemTemplate>
                        <table style="width:101%; height: 69px;">
                            <tr>
                                <td class="style20" rowspan="3" style="vertical-align: top; text-align: left">
                                    <asp:Image ID="Image1" runat="server" Height="89px" 
                                        ImageUrl='<%# Eval("foodImgUrl") %>' Width="113px" />
                                </td>
                                <td class="style25">
                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("foodName") %>'></asp:Label>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style25">
                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("foodClassName") %>'></asp:Label>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style25">
                                    已经卖出<asp:Label ID="Label7" runat="server" Text='<%# Eval("foodSaleNum") %>'></asp:Label>
                                    &nbsp;份</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
            </td>
        </tr>
        <tr>
            <td class="style11" style="vertical-align: top">
            <table style="width: 97%; height: 150px;">
                <tr>
                    <td class="style15">
                        &nbsp;</td>
                    <td class="style18">
                        <asp:LinkButton ID="LBtnUserManager" runat="server" Font-Bold="True" 
                                Font-Size="Small" onclick="LBtnUserManager_Click">用户管理</asp:LinkButton>
                    </td>
                    <td class="style17">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style15">
                        &nbsp;</td>
                    <td class="style18">
                        <asp:LinkButton ID="LBtnFoodManager" runat="server" Font-Bold="True" 
                                Font-Size="Small" onclick="LBtnFoodManager_Click">菜品管理</asp:LinkButton>
                    </td>
                    <td class="style17">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style15">
                        &nbsp;</td>
                    <td class="style18">
                        <asp:LinkButton ID="LinkButton3" runat="server" Font-Bold="True" 
                                Font-Size="Small" onclick="LinkButton3_Click">订单管理</asp:LinkButton>
                    </td>
                    <td class="style17">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style15">
                        &nbsp;</td>
                    <td class="style18">
                        <asp:LinkButton ID="LinkButton4" runat="server" Font-Bold="True" 
                                Font-Size="Small" onclick="LinkButton4_Click">销售统计</asp:LinkButton>
                    </td>
                    <td class="style17">
                        &nbsp;</td>
                </tr>
            </table>
            </td>
        </tr>
        <tr>
            <td class="style26">
                &nbsp;</td>
            <td colspan="2" style="vertical-align: top; text-align: left">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

