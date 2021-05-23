<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="ChangeGuest.aspx.cs" Inherits="HotelManage.ChangeGuest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>用户信息修改记录（表）</title>
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
            overflow: auto;
        }

        .gd {
            font-size: 14px;
            position: relative;
            top: 10px;
            text-align: center;
        }

        #bk {
            border: solid 2px white;
            border-radius: 15px;
            width: 1170px;
            height: 630px;
            position: relative;
            top: -7px;
            background-color: #ffffff ForeColor="Black"；
        }

        #research {
            height: 527px;
            background-color: #ffffff;
            width: 100%;
            border-radius: 15px 15px 0px 0px;
            font-size: 15px;
            color: #000000;
            -webkit-box-shadow: #fff 0px 0px 10px;
            -moz-box-shadow: #666 0px 0px 10px
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphRight" runat="server">
    <div id="bk" class="style2">




        <div id="research">
            <div id="table">

                <table cellpadding="0" cellspacing="0" width="765">

                    <tr>
                        <td class="tdstyle" colspan="4" height="52"><span style="font-size: 24px;">用户信息修改记录表</span></td>

                    </tr>
                    <tr>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<td class="tdstyle" width="115">&nbsp; 顾客姓名：</td>
                        <td width="270">
                            <asp:TextBox ID="txtGname" runat="server" CssClass="text"></asp:TextBox>
                        </td>
                        &nbsp;&nbsp;&nbsp;&nbsp;<td width="115" class="tdstyle">&nbsp; 顾客性别：</td>
                        <td width="270" height="40">&nbsp;&nbsp;<asp:RadioButton ID="rdoMale" runat="server" GroupName="a" Text="男"
                            Checked="True" Font-Size="12pt" BackColor="White" BorderColor="Black" ForeColor="Black" />
                            &nbsp;&nbsp;&nbsp;
      <asp:RadioButton ID="rdoFemaile" runat="server" GroupName="a" Text="女"
          Font-Size="12pt" BackColor="White" BorderColor="Black" ForeColor="Black" />
                        </td>
                    </tr>
                    <tr>
                        <td class="tdstyle">&nbsp; 联系方式：</td>
                        <td class="style3">
                            <asp:TextBox ID="txtMobile" runat="server" CssClass="text"></asp:TextBox>
                        </td>
                        <td class="tdstyle">&nbsp; 顾客等级：</td>
                        <td height="37">
                            <asp:DropDownList ID="ddlTName" runat="server" CssClass="text">
                            </asp:DropDownList>
                        </td>
                    </tr>

                    <tr>
                        <td class="tdstyle" forecolor="Black">&nbsp; 身份证号：</td>
                        <td>
                            <asp:TextBox ID="txtPid" runat="server" CssClass="text" BackColor="White"></asp:TextBox>
                        </td>
                        <td class="tdstyle" forecolor="Black">&nbsp; 累计消费：</td>
                        <td height="37">
                            <asp:TextBox ID="txtChargeSum" runat="server" CssClass="text"></asp:TextBox>
                        </td>
                    </tr>


                    <tr>
                        <td width="93" style="height: 101px;" class="tdstyle" forecolor="Black">&nbsp;&nbsp; 备注信息：</td>
                        <td colspan="3">
                            <asp:TextBox ID="txtRemark" runat="server" Width="660" Height="101"
                                TextMode="MultiLine" Font-Names="微软雅黑" Font-Size="16pt" BackColor="#ffffff"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="height: 40px" class="tdstyle">
                            <asp:Button ID="btnSubmit" runat="server" Text="提交" CssClass="buttom"
                                OnClick="btnSubmit_Click" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="button" onclick="javascript: window.history.go(-1);" value="取消" class="buttom">
                        </td>


                    </tr>
                </table>
            </div>


        </div>

    </div>

</asp:Content>
