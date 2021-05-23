<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="AddDays.aspx.cs" Inherits="HotelManage.AddDays" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>用户房间续费（表）</title>
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
            top: 50px;
            left: 201px;
            border-radius: 15px 15px 0px 0px;
        }

        .tdstyle {
            background-color: #ffffff;
            text-align: center;
        }

        .text {
            border-color: inherit;
            border-width: 0px;
            margin-left: 0px;
            font-size: 20px;
            font-family: 微软雅黑;
            background-color: #ffffff;
            color: Black;
            border-style: none
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
            overflow-y: auto;
            overflow-X: auto;
        }

        .gd {
            font-size: 14px;
            position: relative;
            top: 10px;
            text-align: center;
        }

        #bk {
            border: solid 2px black;
            border-radius: 15px;
            width: 1170px;
            height: 630px;
            position: relative;
            top: -7px;
            background-color: #ffffff
        }

        #research {
            height: 300px;
            background-color: #ffffff;
            width: 100%;
            border-radius: 15px 15px 0px 0px;
            font-size: 15px;
            color: Black;
            -webkit-box-shadow: #ffffff 0px 0px 10px;
            -moz-box-shadow: #666 0px 0px 10px
        }

        .error {
            color: Red;
            font-size: 18px;
            position: relative;
            right: 200px;
            font-family: 微软雅黑
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
                <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <table cellpadding="0" cellspacing="0" width="830">
                            <tr>
                                <td class="tdstyle" colspan="4" height="52"><span style="font-size: 24px;">用户房间续费登记表</span></td>
                            </tr>
                            <tr>
                                <td class="tdstyle" width="320">&nbsp; 顾客编号：</td>
                                <td width="270">
                                    <asp:TextBox ID="txtGid" runat="server" CssClass="text" Enabled="False"></asp:TextBox>
                                </td>
                                <td width="115" class="tdstyle">&nbsp; 顾客姓名：</td>
                                <td height="40" class="auto-style1">
                                    <asp:TextBox ID="txtGname" runat="server" CssClass="text" Enabled="False"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="tdstyle">&nbsp; 联系方式：</td>
                                <td class="style3">
                                    <asp:TextBox ID="txtMobile" runat="server" CssClass="text" Enabled="False"></asp:TextBox>
                                </td>
                                <td class="tdstyle">&nbsp; 房间类型：</td>
                                <td height="37" class="auto-style1">
                                    <asp:TextBox ID="txtRTName" runat="server" CssClass="text"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="tdstyle">&nbsp; 顾客等级：</td>
                                <td class="style3">
                                    <asp:TextBox ID="txtTname" runat="server" CssClass="text" Enabled="False"></asp:TextBox>
                                </td>
                                <td class="tdstyle">&nbsp;&nbsp; 房间编号：</td>
                                <td height="37" class="auto-style1">
                                    <asp:TextBox ID="txtRoomNum" runat="server" CssClass="text"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="tdstyle">&nbsp; 入住时间：</td>
                                <td>
                                    <asp:TextBox ID="txtInTime" runat="server" CssClass="text" AutoPostBack="True"
                                        OnTextChanged="txtInTime_TextChanged"></asp:TextBox>
                                </td>
                                <td class="tdstyle">&nbsp;&nbsp; 续费天数：</td>
                                <td height="37" class="auto-style1">
                                    <asp:TextBox ID="txtAddDay" runat="server" CssClass="text" AutoPostBack="True"
                                        OnTextChanged="txtAddDay_TextChanged">0</asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="tdstyle">&nbsp; 到期时间：</td>
                                <td>
                                    <asp:TextBox ID="txtOutTime" runat="server" CssClass="text" AutoPostBack="True" Width="272px"></asp:TextBox>
                                </td>
                                <td class="tdstyle">&nbsp; 续交押金：</td>
                                <td height="37" class="auto-style1">
                                    <asp:TextBox ID="txtAddCharge" runat="server" CssClass="text"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td width="270" style="height: 101px;" class="tdstyle">&nbsp;&nbsp; 备注信息：</td>
                                <td colspan="3">
                                    <asp:TextBox ID="txtRemark" runat="server" Width="660" Height="101"
                                        TextMode="MultiLine" Font-Names="微软雅黑" Font-Size="16pt" BackColor="#ffffff">暂无备注</asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4" style="height: 40px" class="tdstyle">
                                    <asp:Button ID="btnSubmit" runat="server" Text="提交" CssClass="buttom"
                                        OnClick="btnSubmit_Click" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="button" onclick="javascript: window.history.go(-1);" value="取消" class="buttom">
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:Label ID="Label1" runat="server" CssClass="error"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
