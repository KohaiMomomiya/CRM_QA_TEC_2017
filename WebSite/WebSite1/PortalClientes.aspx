<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PortalClientes.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .inlineBlock {
            display: inline-block; 

        }
        #form1 {
            height: 719px;
            width: 1058px;
            margin-left: 73px;
            margin-top: 92px;
        }
    </style>
</head>
<body style="height: 823px">
    <form id="form1" runat="server">
        <asp:Panel ID="Panel2" runat="server" Font-Names="Market Deco" Font-Size="XX-Large" HorizontalAlign="Left" Height="144px" BorderColor="#CCCCCC">
            &nbsp; portal de clientes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label17" runat="server" Font-Names="Coolvetica Rg" Font-Size="Medium" ForeColor="#CCCCCC" Text="Bienvenido: "></asp:Label>
            <br />
            &nbsp;<asp:Label ID="Label4" runat="server" Font-Names="Coolvetica Rg" Font-Size="Medium" ForeColor="#CCCCCC" Text="Sección de ayuda y otras funciones para los clientes"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button4" runat="server" BackColor="White" BorderColor="White" BorderStyle="Solid" Font-Names="Coolvetica Rg" Font-Size="Medium" ForeColor="#FF2D2D" OnClick="bttnCerrarSesion" Text="Cerrar sesión" />
            <br />
            <br />
            &nbsp;<asp:Button ID="Button3" runat="server" BackColor="#FF2D2D" BorderColor="#FF2D2D" BorderStyle="Solid" Font-Names="Coolvetica Rg" Font-Size="Medium" ForeColor="White" Height="29px" Text="Ver más" Width="116px" />
        </asp:Panel>

        <div style ="float:left;width:534px; height: 386px; margin-top: 3px;">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
&nbsp;&nbsp;
            <asp:ImageButton ID="ImageButton1" runat="server" Height="66px" ImageUrl="~/Images/noun_1123198_cc.png" Width="72px" />
&nbsp;&nbsp;
            <br />
&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label5" runat="server" Font-Names="Coolvetica Rg" Font-Size="Large" Text="Reporte de errores"></asp:Label>
            <br />
            <br />
&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label9" runat="server" Font-Names="Coolvetica Rg" Font-Size="Medium" ForeColor="#CCCCCC" Height="50px" Text="Reporte los errores que encuentre en la aplicación, así como errores en productos o información personal" Width="300px"></asp:Label>
            <br />
            <br />
&nbsp;&nbsp;
            <asp:ImageButton ID="ImageButton5" runat="server" Height="70px" ImageUrl="~/Images/noun_26949_cc.png" Width="79px" />
            <br />
&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label10" runat="server" Font-Names="Coolvetica Rg" Font-Size="Large" Text="Puntos de contacto"></asp:Label>
            <br />
            <br />
&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label11" runat="server" Font-Names="Coolvetica Rg" Font-Size="Medium" ForeColor="#CCCCCC" Height="50px" Text="Encuentre distintos puntos donde puede obtener información por medio de un operador para solucionar dudas o problemas" Width="300px"></asp:Label>
            <br />
            <br />
&nbsp;
            <br />
            <br />
        </div>
        <div style ="float:left;width:337px; height: 388px; margin-top: 0px;">
                <br />
&nbsp;&nbsp;
                <asp:ImageButton ID="ImageButton6" runat="server" Height="66px" ImageUrl="~/Images/seguimiento.png" Width="72px" />
                <br />
&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label12" runat="server" Font-Names="Coolvetica Rg" Font-Size="Large" Text="Seguimiento a entrenamientos"></asp:Label>
                <br />
                <br />
&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label13" runat="server" Font-Names="Coolvetica Rg" Font-Size="Medium" ForeColor="#CCCCCC" Height="50px" Text="Puede encontrar la información necesaria al segumiento de entrenamientos" Width="300px"></asp:Label>
                <br />
                <br />
&nbsp;&nbsp;
                <asp:ImageButton ID="ImageButton7" runat="server" Height="70px" ImageUrl="~/Images/productosRelacionados.png" Width="79px" />
                <br />
&nbsp;&nbsp;
                <asp:Label ID="Label14" runat="server" Font-Names="Coolvetica Rg" Font-Size="Large" Text="Productos relacionados"></asp:Label>
                <br />
                <br />
&nbsp;&nbsp;
                <asp:Label ID="Label15" runat="server" Font-Names="Coolvetica Rg" Font-Size="Medium" ForeColor="#CCCCCC" Height="50px" Text="Encuentre productos relacionados con los que ha adquirido" Width="300px"></asp:Label>
                <br />
                <br />
                <br />
                <br />
        </div>
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
        &nbsp;<br />
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

        <asp:Panel ID="Panel1" runat="server" Font-Names="Coolvetica Rg" Height="82px" Width="871px">
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Aseguramiento de la calidad de software&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Esteban Foseca <span style="color: rgb(17, 17, 17); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">•</span> Jason Espinoza
            <span style="color: rgb(17, 17, 17); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">•</span><span style="color: rgb(0, 0, 0); font-family: &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">
            </span>Mario Chinchilla<br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2017</asp:Panel>

    </form>

</body>
</html>
