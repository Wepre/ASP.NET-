<%@ Page Title="" Language="C#" MasterPageFile="~/InernetSaleMainStyle.master" AutoEventWireup="true" CodeFile="shoppingCart.aspx.cs" Inherits="shoppingCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <style type="text/css">
        .style28
        {
            height: 29px;
        }
        .style29
        {
            height: 29px;
            width: 135px;
        }
        .style30
        {
        width: 135px;
    }
        .style31
        {
            height: 29px;
            width: 656px;
        }
        .style32
        {
            width: 656px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%; height: 340px;">
        <tr>
            <td class="style29">
            </td>
            <td class="style31" style="color: #FF0000; font-size: large">
                购物车</td>
            <td class="style28">
            </td>
        </tr>
        <tr>
            <td class="style30">
                &nbsp;</td>
            <td class="style32" rowspan="3" style="vertical-align: top; text-align: left">
                <br />
                <asp:Button ID="BtnAll" runat="server" onclick="BtnAll_Click" Text="合计" 
                    ValidationGroup="7" />
&nbsp;
                <asp:TextBox ID="TBAll" runat="server"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="LbAdd" runat="server" Text="收货地址"></asp:Label>
&nbsp;
                <asp:TextBox ID="TBAdd" runat="server" onload="Page_Load" Width="238px">&lt;%#Eval(&quot;[address]&quot;)%&gt;</asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="pay" runat="server" Font-Bold="True" ForeColor="Red" 
                    onclick="pay_Click" Text="结账" ValidationGroup="5" Width="60px" />
&nbsp;&nbsp;
                <asp:GridView ID="GridView1" runat="server" 
                     
                    AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
                    GridLines="None" style="margin-left: 0px" Width="820px" Height="280px" 
                    AllowPaging="True" >
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:TemplateField HeaderText="确认">
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked="True" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="图片">
                            <ItemTemplate>
                                <asp:Image ID="imgUrl" runat="server" Height="37px" 
                                    ImageUrl='<%# Eval("foodImgUrl") %>' Width="62px" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("foodImgUrl") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ControlStyle Height="50px" Width="50px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="商品名称">
                            <ItemTemplate>
                                <asp:Label ID="LbFName" runat="server" Text='<%# Eval("foodName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="菜品类型">
                            <ItemTemplate>
                                <asp:Label ID="LbFCName" runat="server" Text='<%# Eval("foodClassName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="价格">
                            <ItemTemplate>
                                <asp:Label ID="LBPrice" runat="server" Text='<%# Eval("foodPrice") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="订购数量">
                            <ItemTemplate>
                                <asp:TextBox ID="TBNum" runat="server" Text='<%# Eval("foodNum") %>' 
                                    Height="24px" Width="131px"></asp:TextBox>
                                <br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="TBNum" Display="Dynamic" ErrorMessage="*订购数量不能为空" 
                                    ForeColor="Red" ValidationGroup="5"></asp:RequiredFieldValidator>
                                &nbsp;<br /> 
                                <asp:RangeValidator ID="RangeValidator1" runat="server" 
                                    ControlToValidate="TBNum" Display="Dynamic" ErrorMessage="*订购数量必须&gt;=1" 
                                    ForeColor="Red" MinimumValue="1" MaximumValue="10000" ValidationGroup="5" 
                                    Type="Integer"></asp:RangeValidator>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="折扣">
                            <ItemTemplate>
                                <asp:Label ID="LbYouHui" runat="server" Text='<%# Eval("youHui") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="总计">
                            <ItemTemplate>
                                <asp:Label ID="LbAllPrice" runat="server" 
                                    Text='<%# Convert.ToDouble(Eval("foodNum"))*Convert.ToDouble(Eval("foodPrice")) %>'></asp:Label>
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
            <td class="style30">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style30">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

