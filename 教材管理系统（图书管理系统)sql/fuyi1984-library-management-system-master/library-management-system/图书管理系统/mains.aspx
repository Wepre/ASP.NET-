<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mains.aspx.cs" Inherits="教材管理系统.mains" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .style1
        {
            font-family: 华文楷体;
            font-size: xx-large;
        }
        .style2
        {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
       <div class="style1" style="text-align: left">
        <div>
        <img src="界面设计/logo.png" style="vertical-align:middle;width:180px" >
            <span>教材管理系统</span>
            </div>
           <div style="text-align:right">
        <asp:Label ID="Label2" runat="server" Text="当前用户："></asp:Label>         
       <asp:Label ID="username" runat="server" Text=""></asp:Label>      
        <asp:Label ID="Label4" runat="server" Text="身份:"></asp:Label>
       <asp:Label ID="shenfen" runat="server" Text=""></asp:Label> 
       <asp:Label ID="Label6" runat="server" Text="在线人数:"></asp:Label>
       <asp:Label ID="online" runat="server" Text=""></asp:Label>
       <asp:Label ID="Label5" runat="server" Text="访问量:"></asp:Label>
        <asp:Label ID="fagnwenliang" runat="server" Text=""></asp:Label>
           <asp:Label ID="Label1" runat="server" Text=""></asp:Label>       
           <a  target="_self" runat="server"  onserverclick ="Clear"  >退出</a>
               </div>
        <table class="style2" border="1" cellspacing="0">
            <tr>
                <td height="555" width="222">
                    <asp:TreeView ID="TreeView1" runat="server" ShowLines="True" 
                        style="font-size: large" LineImagesFolder="~/TreeLineImages">
                        <Nodes>
                            <asp:TreeNode Text="教材管理系统" Value="教材管理系统" NavigateUrl="~/界面设计/界面设计.jpg">
                                <asp:TreeNode Text="基本操作" Value="基本操作" >
                                    <asp:TreeNode Text="教材管理" Value="教材管理" NavigateUrl="~/bookmanage.aspx"></asp:TreeNode>
                                    <asp:TreeNode Text="读者管理" Value="读者管理" NavigateUrl="~/readmanage.aspx"></asp:TreeNode>
                                    <asp:TreeNode  Text="借书" Value="借书" NavigateUrl="~/borrow.aspx"></asp:TreeNode>
                                   
                                </asp:TreeNode>
                            </asp:TreeNode>
                        </Nodes>
                    </asp:TreeView>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                </td>
                <td height="555">
                    <iframe id="I1" frameborder="0" name="I1" 
                        src="界面设计/界面设计.jpg" style="width: 738px; height: 577px;">
                    </iframe>
                </td>
            </tr>
        </table>
&nbsp;</div>
    </form>
    <p>
    &nbsp;</p>
</body>
</html>
