<%@ Page Title="" Language="C#" MasterPageFile="~/InernetSaleMainStyle.master" AutoEventWireup="true" CodeFile="searchResultPage.aspx.cs" Inherits="searchResultPage" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <style type="text/css">
        .style25
        {
            width: 260px;
        }
        .style26
        {
            width: 679px;
        }
        .style28
        {
            height: 28px;
        }
        .style29
        {
            height: 28px;
            width: 112px;
        }
        .style32
        {
            height: 28px;
            width: 90px;
        }
        .style34
        {
            width: 90px;
        }
        .style35
        {
            width: 112px;
        }
        .style36
        {
            height: 28px;
            width: 78px;
        }
        .style37
        {
            width: 78px;
        }
        .style38
        {
            width: 100px;
        }
        .style39
        {
            width: 112px;
            height: 33px;
        }
        .style40
        {
            width: 90px;
            height: 33px;
        }
        .style41
        {
            width: 78px;
            height: 33px;
        }
        .style42
        {
            height: 33px;
        }
        .style43
        {
            width: 193px;
        }
        .style44
        {
            width: 427px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 104%; height: 267px;">
    <tr>
        <td class="style25">
            &nbsp;</td>
        <td class="style26" rowspan="3" style="vertical-align: top; text-align: left">
            <asp:DataList ID="DataList1" runat="server" 
                onitemcommand="DataList2_ItemCommand" CellSpacing="1" RepeatColumns="3"  
                >
                <ItemTemplate>
                    <table style="width:91%; height: 114px;">
                        <tr>
                            <td class="style38" style="vertical-align: top; text-align: left">
                                <asp:Image ID="Image1" runat="server" Height="88px" 
                                    ImageUrl='<%# Eval("foodImgUrl") %>' Width="99px" />
                            </td>
                            <td style="vertical-align: top; text-align: left">
                                <table style="width: 85%; height: 97px;">
                                    <tr>
                                        <td class="style29">
                                            商品名称</td>
                                        <td class="style32">
                                            菜品类型</td>
                                        <td ID="jwge" class="style36">
                                            价格</td>
                                        <td ID="jwge" class="style28">
                                            销量</td>
                                    </tr>
                                    <tr>
                                        <td class="style39">
                                            <asp:Label ID="LbFName" runat="server" Height="19px" 
                                                Text='<%# Eval("foodName") %>' Width="61px"></asp:Label>
                                        </td>
                                        <td class="style40">
                                            <asp:Label ID="Lb2" runat="server" Height="19px" style="margin-left: 0px" 
                                                Text='<%# Eval("foodClassName") %>' Width="44px"></asp:Label>
                                        </td>
                                        <td class="style41">
                                            <asp:Label ID="LbPrice" runat="server" Height="16px" 
                                                Text='<%# Eval("foodPrice") %>' Width="48px"></asp:Label>
                                        </td>
                                        <td class="style42">
                                            <asp:Label ID="LbSaleNum" runat="server" Height="19px" 
                                                Text='<%# Eval("foodSaleNum") %>' Width="48px"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style35">
                                            <asp:Button ID="AddShoppingCart" 
                                                runat="server" BackColor="#FF9900" 
                                    BorderStyle="Ridge" Font-Bold="True" Font-Size="Smaller" Height="27px" 
                                    Text="加入购物车" Width="79px" CommandName="addShoppingCartSearch" />
                                        </td>
                                        <td class="style34">
                                            &nbsp;</td>
                                        <td class="style37">
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style25">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style25">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
</table>
    <br />
    <table style="width: 100%; height: 11px; margin-top: 0px;">
        <tr>
            <td class="style43">
                &nbsp;</td>
            <td class="style44">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style43">
                &nbsp;</td>
            <td class="style44">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
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
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style43">
                &nbsp;</td>
            <td class="style44">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

