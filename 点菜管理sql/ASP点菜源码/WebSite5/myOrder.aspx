<%@ Page Title="" Language="C#" MasterPageFile="~/InernetSaleMainStyle.master" AutoEventWireup="true" CodeFile="myOrder.aspx.cs" Inherits="myOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <style type="text/css">
    .style28
    {
        width: 288px;
    }
    .style29
    {
        width: 608px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%; height: 424px;">
    <tr>
        <td class="style28">
            &nbsp;</td>
        <td class="style29" rowspan="3" style="vertical-align: top; text-align: left">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" ForeColor="#333333" GridLines="None" style="margin-bottom: 0px" 
                Width="603px" AllowPaging="True" 
                onpageindexchanging="GridView1_PageIndexChanging" PageSize="8">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:TemplateField HeaderText="图片">
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" Height="42px" 
                                ImageUrl='<%# Eval("foodImgUrl") %>' Width="61px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="订单号">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("orderID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="用户名">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("username") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="会员状态">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("memName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="商品名称">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("foodName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="菜品类型">
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("foodClassName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="购买数量">
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("foodNum") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="单价">
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("foodPrice") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="折扣">
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("youHui") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="单品总计支付">
                        <ItemTemplate>
                            <asp:Label ID="Label11" runat="server" 
                                Text='<%# Convert.ToDouble(Eval("foodNum"))* Convert.ToDouble(Eval("foodPrice"))* Convert.ToDouble(Eval("youHui")) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="收货地址">
                        <ItemTemplate>
                            <asp:Label ID="Label9" runat="server" Text='<%# Eval("address") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="订单状态">
                        <ItemTemplate>
                            <asp:Label ID="Label12" runat="server" Text='<%# Eval("orderStatus") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="商家电话">
                        <ItemTemplate>
                            <asp:Label ID="Label13" runat="server" Text='<%# Eval("employerTel") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="订单日期">
                        <ItemTemplate>
                            <asp:Label ID="Label10" runat="server" Text='<%# Eval("orderTime") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
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
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style28">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style28">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
</table>
</asp:Content>

