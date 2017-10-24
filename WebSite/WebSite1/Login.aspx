<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .inlineBlock {
            display: inline-block; 

        }
        #form1 {
            height: 557px;
            width: 1058px;
            margin-left: 148px;
            margin-top: 92px;
        }
    </style>
</head>
<body style="height: 651px">
    <form id="form1" runat="server">
        <div style ="float:left;width:534px; height: 399px;">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Image ID="Image1" runat="server" Height="377px" ImageUrl="~/Images/products.png" Width="370px" style="margin-left: 16px" />
        </div>
        <div style ="float:left;width:337px; height: 397px; text-align: center; border: 1px solid #C4C4C4;">
                <br />
                <br />
                <asp:Label ID="Label1" runat="server" Text="SISTEMA DE VENTAS" Font-Names="Market Deco" Font-Size="XX-Large" ForeColor="Black"></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label3" runat="server" Text="Venda y compre los mejores productos" Font-Names="Coolvetica Rg" Font-Size="Medium" ForeColor="#C4C4C4"></asp:Label>
                <br />
                <br />
                <br />
                <asp:TextBox ID="TextBox1" runat="server" placeholder = "Nombre de usuario" BackColor="#FBFBFB" BorderColor="#D8D8D8" BorderStyle="Solid" Height="27px" Width="199px" AutoCompleteType="Email" TextMode="Email"></asp:TextBox>
                <br />
                <br />
                <asp:TextBox ID="TextBox2" runat="server" placeholder = "Contraseña" BackColor="#FBFBFB" BorderColor="#D8D8D8" BorderStyle="Solid" Height="27px" TextMode="Password" Width="199px"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label2" runat="server" ForeColor="Black" Text="¿No se ha registrado aún ?" Font-Names="Coolvetica Rg"></asp:Label>
                <br />
                <asp:Button ID="Button2" runat="server" BackColor="White" BorderColor="White" BorderStyle="Solid" Font-Names="Coolvetica Rg" Font-Overline="False" Font-Size="Medium" ForeColor="#FF2D2D" Height="27px" Text="Registrese aquí" Width="199px" OnClick="bttnRegistreseAqui" />
                <br />
                <br />
                <asp:Button ID="Button1" runat="server" BackColor="#FF2D2D" BorderColor="#FF2D2D" BorderStyle="Solid" Font-Names="Coolvetica Rg" Font-Overline="False" Font-Size="Medium" ForeColor="White" Height="27px" Text="Iniciar sesión" Width="199px" OnClick="bttnIniciarSesion" />
                <br />
                <br />
                <asp:Label ID="lblBase" runat="server" Font-Names="Coolvetica Rg" ForeColor="#FF2D2D"></asp:Label>
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
        <br />

        <asp:Panel ID="Panel1" runat="server" Font-Names="Coolvetica Rg" Height="61px" Width="871px">
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Aseguramiento de la calidad de software&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Esteban Foseca <span style="color: rgb(17, 17, 17); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">•</span> Jason Espinoza
            <span style="color: rgb(17, 17, 17); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">•</span><span style="color: rgb(0, 0, 0); font-family: &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">
            </span>Mario Chinchilla<br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2017</asp:Panel>

    </form>

</body>
</html>
