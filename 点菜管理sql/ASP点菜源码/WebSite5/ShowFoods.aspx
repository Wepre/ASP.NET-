<%@ Page Title="" Language="C#" MasterPageFile="~/InernetSaleMainStyle.master" AutoEventWireup="true" CodeFile="ShowFoods.aspx.cs" Inherits="ShowFoods" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <style type="text/css">
    .style25
    {
        width: 232px;
        height: 29px;
    }
    .style26
    {
        height: 29px;
        width: 793px;
    }
    .style27
    {
        width: 232px;
    }
        .style28
        {
            width: 53px;
        }
        .style29
        {
            height: 15px;
        }
        .style30
        {
            height: 20px;
        }
    .style31
    {
        width: 793px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 101%; height: 305px;">
    <tr>
        <td class="style25" style="color: #FF0000; font-size: large;">
            热销菜品展示</td>
        <td class="style26" 
            style="vertical-align: middle; text-align: left; color: #000000; font-size: large;">
            &nbsp;&nbsp;&nbsp;&nbsp;
            菜品分类：<asp:DropDownList 
                ID="DropDownList1" runat="server" AutoPostBack="True" 
                onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                <asp:ListItem Selected="True">全部</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="style27" style="text-align: left; vertical-align: top">
            <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
                GridLines="None" AllowPaging="True" AllowSorting="True" 
                AutoGenerateColumns="False" 
                onpageindexchanging="GridView1_PageIndexChanging" PageSize="5" 
                Width="301px"  
                onrowcommand="GridView1_RowCommand" Height="180px" >
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" BackColor="#FF9900" BorderStyle="Ridge" 
                                Font-Bold="True" Font-Size="Smaller" Height="20px" 
                                 Text="加入购物车" Width="73px" CommandName="grAddToCart" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:ImageField DataImageUrlField="foodImgUrl" HeaderText="图片">
                        <ControlStyle Height="50px" Width="50px" />
<ControlStyle Height="50px" Width="50px"></ControlStyle>
                    </asp:ImageField>
                    <asp:TemplateField HeaderText="商品名称">
                        <ItemTemplate>
                            <asp:Label ID="LbFname" runat="server" Text='<%# Eval("foodName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="菜品类型">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("foodClassName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="价格">
                        <ItemTemplate>
                            <asp:Label ID="LbFPrice" runat="server" Text='<%# Eval("foodPrice") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="销量">
                        <ItemTemplate>
                            <asp:Label ID="LbFNum" runat="server" Text='<%# Eval("foodSaleNum") %>'></asp:Label>
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

<SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>

<SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>

<SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>

<SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
            </asp:GridView>
        </td>
        <td style="vertical-align: top; text-align: left" class="style31">
            <asp:DataList ID="DataList1" runat="server" CellPadding="4" RepeatColumns="4" 
                RepeatDirection="Horizontal" Height="200px" Width="817px" 
                style="margin-left: 4px" onitemcommand="DataList1_ItemCommand"  
                >
                <ItemTemplate>
                    <table style="width:90%; height: 98px;">
                        <tr>
                            <td class="style28" rowspan="4" style="vertical-align: top; text-align: left">
                                <asp:Image ID="Image1" runat="server" Height="90px" 
                                    ImageUrl='<%# Eval("foodImgUrl") %>' Width="90px" />
                            </td>
                            <td class="style30">
                                <asp:Label ID="LbFName" runat="server" Text='<%# Eval("foodName") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style29">
                                ￥：<asp:Label ID="LbPrice" runat="server" Text='<%# Eval("foodPrice") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                已卖出<asp:Label ID="LbSaleNum" runat="server" Text='<%# Eval("foodSaleNum") %>'></asp:Label>
                                份</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="AddShoppingCart" runat="server" BackColor="#FF9900" 
                                    BorderStyle="Ridge" Font-Bold="True" Font-Size="Smaller" Height="27px" 
                                    Text="加入购物车" Width="79px" CommandName="addShoppingCart" />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
            <br />
        </td>
    </tr>
</table>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    当前：第 
    <asp:Label ID="lblCurrent" runat="server" Text="几"></asp:Label>
&nbsp;页&nbsp;&nbsp; 
    <asp:LinkButton ID="lbtnFirst" runat="server" onclick="lbtnFirst_Click">首页</asp:LinkButton>
&nbsp;
    <asp:LinkButton ID="lbtnPrveious" runat="server" onclick="lbtnPrveious_Click">上一页</asp:LinkButton>
&nbsp;
    <asp:LinkButton ID="lbtnNext" runat="server" onclick="lbtnNext_Click">下一页</asp:LinkButton>
&nbsp;
    <asp:LinkButton ID="lbtnLast" runat="server" onclick="lbtnLast_Click">末页</asp:LinkButton>
    <br />
    <br />
</asp:Content>

