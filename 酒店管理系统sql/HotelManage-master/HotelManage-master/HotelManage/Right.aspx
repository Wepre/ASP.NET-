<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Right.aspx.cs" Inherits="HotelManage.Right" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<title>	欢迎页面</title>
<link href="assets/css/style.css" rel="stylesheet" />
<script  type="text/jscript" src="js/jquery.min.js"></script>
<script  type="text/jscript"  src="js/moment.min.js"></script>
<script  type="text/jscript"  src="assets/js/script.js"></script>
<style type="text/css">
    #clock {
        -webkit-box-shadow: #666 0px 0px 10px;
        width: 350px;
        height: 120px;
        border-radius: 15px;
        position: relative;
        top: -618px;
        left: 755px;
        border: solid 2px gray
    }

    #grid {
        width: 720px;
        height: 650px;
        border: solid 2px gray;
        border-radius: 15px;
        position: relative;
        left: 15px
    }

    #menu {
        width: 425px;
        height: 410px;
        border: solid 2px gray;
        position: relative;
        left: 755px;
        bottom: 632px;
        border-radius: 15px;
        background-color: #C8F2D5
    }

    .datalist {
        position: absolute;
        top: 45px;
        left: 120px
    }

    #roomtype {
        height: 534px;
        width: 95px;
        margin-top: -21px;
        margin-left: 20px;
        position: relative;
        top: -10px
    }

    .icotype {
        border-radius: 15px;
        cursor: pointer;
        margin-top: 21px;
        position: relative;
        top: 21px
    }

    .label {
        font-size: 17px;
        color: black;
        text-align: left;
        font-family: 微软雅黑
    }

    .style1 {
        text-align: center;
        font-size: 25px;
        font-family: 微软雅黑;
    }

    .style2 {
        text-align: center;
    }

    #table1 td {
        height: 70px;
        width: 370px
    }

    #table1 {
        position: relative;
        top: -20px
    }

    .tcdPageCode {
        text-align: left;
        color: #ccc;
        position: relative;
        top: -15px;
        left: 367px;
        width: 500px;
    }

        .tcdPageCode a {
            display: inline-block;
            color: #00aa68;
            display: inline-block;
            height: 25px;
            line-height: 25px;
            padding: 0 10px;
            border: 1px solid #00aa68;
            margin: 0 2px;
            border-radius: 4px;
            vertical-align: middle;
        }

            .tcdPageCode a:hover {
                text-decoration: none;
                border: 1px solid #00aa68;
            }

        .tcdPageCode span.current {
            display: inline-block;
            height: 25px;
            line-height: 25px;
            padding: 0 10px;
            margin: 0 2px;
            color: #fff;
            background-color: #00aa68;
            border: 1px solid #00aa68;
            border-radius: 4px;
            vertical-align: middle;
        }

        .tcdPageCode span.disabled {
            display: inline-block;
            height: 25px;
            line-height: 25px;
            padding: 0 10px;
            margin: 0 2px;
            color: #bfbfbf;
            background: #f2f2f2;
            border: 1px solid #bfbfbf;
            border-radius: 4px;
            vertical-align: middle;
        }

    .search {
        position: relative;
        top: -8000px;
        left: -366px;
    }

    .button {
        border: solid 1px #00aa68;
        background: white;
        border-radius: 5px;
        width: 40px;
        height: 27px;
        font-family: 微软雅黑;
        color: #00aa68;
        font-size: 14px;
        cursor: pointer;
        margin-right: 5px
    }

    body {
        overflow:auto;
        height:100%;
        width:100%;
        position:absolute;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphRight" runat="server">
    <div>

    <div id="grid">


<img src="images/ico/type.jpg" style=" position:relative; left:20px;top:5px"/>
                     <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
        <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server"></asp:ScriptManagerProxy>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
    <div id="roomtype">
    <table>
        <tr><td><asp:Image ID="Image1" runat="server" CssClass="icotype" /></td></tr>
        <tr><td><asp:Image ID="Image2" runat="server" CssClass="icotype" /></td></tr>
        <tr><td><asp:Image ID="Image3" runat="server" CssClass="icotype" /></td></tr>
        <tr><td><asp:Image ID="Image4" runat="server" CssClass="icotype" /></td></tr>
        <tr><td><asp:Image ID="Image5" runat="server" CssClass="icotype" /></td></tr>
        <tr><td><asp:Image ID="Image6" runat="server" CssClass="icotype" /></td></tr>
    
    </table>
    
    
    </div>
    &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DataList ID="DataList1" runat="server" RepeatColumns="6"  
            CssClass="datalist" RepeatDirection="Horizontal">
            <ItemTemplate>
              <a title="房间编号：<%#Eval("fname")%><%#Eval("number")%>号&#13;房间状态：<%#Eval("statename")%>&#13;价格说明：<%#Eval("rtname")%>&#13;备注信息：<%#Eval("remark")%>" href="skip.aspx?roomid=<%#Eval("roomid")%>""><img src="images/ico/<%#Eval("rsid")%>.jpg" style="border-radius:15px; cursor:pointer"   onmouseover="this.src='images/ico/<%#Eval("rsid")%>.1.jpg'"  onmouseout="this.src='images/ico/<%#Eval("rsid")%>.jpg'" ></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/><span style=" font-family:微软雅黑; font-size:15px;"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%#Eval("number")%></span>&nbsp;<br/>
            </ItemTemplate>
        </asp:DataList>
        <div style=" position:relative; top:32px; left:25px">
            <asp:Button ID="Button8" runat="server" Text="全部"  CssClass="button" />
                <asp:Button ID="Button1" runat="server" Text="普单"  CssClass="button" onclick="Button1_Click"/>
                <asp:Button ID="Button2" runat="server" Text="豪单"  CssClass="button" onclick="Button2_Click"/>
                <asp:Button ID="Button4" runat="server" Text="普双"  CssClass="button" onclick="Button4_Click"/>
                <asp:Button ID="Button5" runat="server" Text="豪双"  CssClass="button" onclick="Button5_Click"/>
                <asp:Button ID="Button6" runat="server" Text="贵宾"  CssClass="button" onclick="Button6_Click"/>
                <asp:Button ID="Button7" runat="server" Text="总统"  CssClass="button" onclick="Button7_Click"/></div>
    
       <asp:Button ID="btnPaging" runat="server" Text="Button" 
        onclick="btnPaging_Click" CssClass="search"/>
    
    </ContentTemplate>

        </asp:UpdatePanel>


        <div style=" float:left">
          <div class="tcdPageCode">
 
    </div>   <asp:TextBox ID="txtCPage" runat="server"  CssClass="search"></asp:TextBox>
          <asp:Label
              ID="Label5" runat="server"></asp:Label></div>
          
    
    </div>
<%--    <div id="menu" class="style2" ><span class="style1">
       
        <img src="images/systemmsg.png"  style=" position:relative; top:15px"/>
       <br />

        <div style=" text-align:left; width:370px; position:relative; left:45px">
           <br />
           <table id="table1">
           <tr><td > <asp:Label ID="Label1" runat="server" CssClass="label"></asp:Label></td></tr>
           <tr><td><asp:Label ID="Label2" runat="server"  CssClass="label"></asp:Label></td></tr>
           <tr><td> <asp:Label ID="Label3" runat="server"  CssClass="label"></asp:Label></td></tr>
           <tr><td> <asp:Label ID="Label4" runat="server"  CssClass="label"></asp:Label></td></tr>
           </table>
  
        <br />
        
        </div>
        
        
        </div>
    
<div id="clock" class="light">
	<div class="display">
		<div class="weekdays">
		</div>
		<div class="ampm">
		</div>
		<div class="alarm">
		</div>
		<div class="digits">
		</div>
	</div>   
    
    </div>--%>
    
    </div>
<script src="js/jquery.min.js" type="text/javascript"></script>
<script src="js/jquery.page.js" type="text/javascript"></script>
<script type="text/jscript">

    $(".tcdPageCode").createPage(
        {
            pageCount:<%=ye()%>,
             current: 1,
             backFn: function (p) {
                 document.getElementById("<%=txtCPage.ClientID %>").value = p;
                var myLink = document.getElementById("<%=btnPaging.ClientID %>");
                myLink.click();

            }
        }
    );
</script>
</asp:Content>
