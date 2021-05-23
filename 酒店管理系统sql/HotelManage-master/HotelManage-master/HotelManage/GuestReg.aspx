<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="GuestReg.aspx.cs" Inherits="HotelManage.GuestReg" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>	新增客户（客户管理）/新增用户信息登记（表）</title>
    <style type="text/css">
        table {
            border: solid 1px #747474
        }

        tr {
            border: solid 1px #747474
        }

        td {
            border: solid 1px #747474
        }

        #table {
            font-size: 16px;
            font-family: 微软雅黑;
            position: relative;
            /*top: 50px;
            left: 201px;*/  
            top: 35%;
            left: 13%;
            border-radius: 15px 15px 0px 0px;
        }

        .tdstyle {
            background-color: #ffffff;
            text-align:center;
        }

        .text {
            margin-left: 0px;
            Height: 40px;
            width: 272px;
            border: 0px;
            font-size: 20px;
            font-family: 微软雅黑;
            background-color: #ffffff
        }

        .buttom {
            background: #00AA68;
            width: 100px;
            height: 30px;
            cursor: pointer;
            font-size: 20px;
            font-family: 微软雅黑;
            border: 1px solid #CCCCCC;
            border-radius: 8px;
        }

        body {
            text-align: center;
            overflow:auto;
        }

        .gd {
            font-size: 14px;
            position: relative;
            top: 10px;
            text-align: center;
        }

        #bk {
            border: solid 2px gray;
            border-radius: 15px;
            width: 1170px;
            height: 630px;
            position: relative;
            top: -7px;
            background-color: #ffffff
        }

        #research {
            height: 400px;
            background-color: #ffffff;
            width: 100%;
            border-radius: 15px 15px 0px 0px;
            font-size: 15px;
            color: #343434;
            -webkit-box-shadow: #fff 0px 0px 10px;
            -moz-box-shadow: #666 0px 0px 10px
        }
        .auto-style1 {
            width: 270px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphRight" runat="server">
        <div id="bk" class="style2">
            <div id="research">
                <div id="table">
                    <table cellpadding="0" cellspacing="0" width="900">
                        <tr>
                            <td class="tdstyle" colspan="4" height="52"><span style="font-size: 24px;">新增顾客信息登记表</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="tdstyle" width="115">顾客姓名：
                            </td>
                            <td width="270">
                                <asp:TextBox ID="txtGname" runat="server" CssClass="text"></asp:TextBox>
                            </td>
                            <td width="115" class="tdstyle">顾客性别：
                            </td>
                            <td height="40" class="auto-style1">
                                <asp:RadioButton ID="rdoMale" runat="server" GroupName="a" Text="男" Checked="True" Font-Size="14pt" />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:RadioButton ID="rdoFemale" runat="server" GroupName="a" Text="女" Font-Size="14pt" />
                            </td>
                        </tr>
                        <tr>
                            <td class="tdstyle">联系方式：
                            </td>
                            <td class="style3">
                                <asp:TextBox ID="txtMobile" runat="server" CssClass="text"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtMobile"></asp:RequiredFieldValidator>
                            </td>
                            <td class="tdstyle">顾客等级：
                            </td>
                            <td height="37" class="auto-style1">
                                <asp:DropDownList ID="ddlGTid" runat="server" CssClass="text"></asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="tdstyle">身份证号：
                            </td>
                            <td>
                                <asp:TextBox ID="txtPid" runat="server" CssClass="text"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtPid"></asp:RequiredFieldValidator>
                            </td>
                            <td class="tdstyle">累计消费：
                            </td>
                            <td height="37" class="auto-style1">
                                <asp:TextBox ID="txtChargeSum" runat="server" CssClass="text">0</asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td width="93" style="height: 101px;" class="tdstyle">备注信息：
                            </td>
                            <td colspan="3">
                                <asp:TextBox ID="TextBox7" runat="server" Width="660" Height="101"
                                    TextMode="MultiLine" Font-Names="微软雅黑" Font-Size="16pt" BackColor="#ffffff"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" style="height: 40px" class="tdstyle">
                                <asp:Button ID="btnSubmit" runat="server" Text="提交" CssClass="buttom"
                                    OnClick="btnSubmit_Click" BorderColor="Black" />
                                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:Button ID="btnCancel" runat="server" CssClass="buttom" Text="取消" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

        </div>
</asp:Content>
