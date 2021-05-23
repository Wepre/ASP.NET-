<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="HotelManage.Reports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <title></title>
<style type="text/css">
#bk{ border: solid 2px gray;border-radius:15px; width:1170px ; height:630px; position:relative;top:-7px; background-color:#EEEEEE}
#report{position:relative;top:0px;height:420px; width:1170px;}
.text{margin-left: 0px;Height:27px; width:152px; border:0px; font-size:20px; font-family:微软雅黑; background-color:#e9fbee; color:Black; border:solid 2px #00aa68; position:relative; top:4px;border-radius:5px; }
.button{ border-style: none;border-color: inherit;border-width: 0px;background: #00AA68;border-radius:5px; width:90px; height:28px; font-family:微软雅黑; color:White; font-size:18px;cursor:pointer; margin-left:10px }

    .style1
    {
        width: 181px;
        height: 35px;
    }

</style>


    <script language="javascript" type="text/javascript">
// <![CDATA[



        function Button1_onclick() {
                         
            document.getElementById("report").src = "report_Col.aspx?year=<%=year()%>";
        }

        function Button2_onclick() {
            document.getElementById("report").src = "report_Pie.aspx?year=<%=year()%>";
           
        }


        function Button3_onclick() {
            document.getElementById("report").src = "report_Ave.aspx?year=<%=year()%>";
        }
        function Button4_onclick() {
            document.getElementById("report").src = "report_com.aspx?year=<%=year()%>";
        }

// ]]>
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphRight" runat="server">
        <div id="bk">
         
        
    <br />
 <br />  
         
       &nbsp;&nbsp;&nbsp;&nbsp;<img alt="" class="style1" src="images/yearlogo.png"  
            style=" position:relative; top:10px; left: -1px;"/> 
        <asp:DropDownList ID="DropDownList1" runat="server" 
            CssClass="text" AutoPostBack="True">
        </asp:DropDownList>
     
        <input id="Button1" type="button" value="柱状图" onclick="return Button1_onclick()" class="button" />
        <input id="Button2" type="button" value="饼状图" onclick="return Button2_onclick()" class="button" />
        <input id="Button3" type="button" value="走势图" onclick="return Button3_onclick()" class="button" />
        <input id="Button4" type="button" value="混合图" onclick="return Button4_onclick()" class="button" />

     

        <br />
        
   
        
        </br>     
          <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
     <iframe  src="report_Col.aspx?year=<%=year()%>" name="report"   id="report" frameborder="0" ></iframe>



     </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
