<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Empresas.aspx.cs" Inherits="Empresas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .inlineBlock {
            display: inline-block; 

        }
        #form1 {
            height: 1957px;
            width: 1058px;
            margin-left: 73px;
            margin-top: 92px;
        }
        .scrolling-table-container {
            height: 378px;
            overflow-y: scroll;
            overflow-x: hidden;
        }
    </style>
</head>
<body style="height: 2244px">
    <form id="form1" runat="server">
        <asp:Panel ID="Panel2" runat="server" Font-Names="Market Deco" Font-Size="XX-Large" HorizontalAlign="Left" Height="144px" BorderColor="#CCCCCC">
            &nbsp; empresas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label17" runat="server" Font-Names="Coolvetica Rg" Font-Size="Medium" ForeColor="#CCCCCC" Text="Bienvenido: "></asp:Label>
            <br />
            &nbsp;<asp:Label ID="Label4" runat="server" Font-Names="Coolvetica Rg" Font-Size="Medium" ForeColor="#CCCCCC" Text="Perfiles empresariales e información relacionada"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button4" runat="server" BackColor="White" BorderColor="White" BorderStyle="Solid" Font-Names="Coolvetica Rg" Font-Size="Medium" ForeColor="#FF2D2D" OnClick="bttnCerrarSesion" Text="Cerrar sesión" />
            <br />
            <br />
            &nbsp;<asp:Button ID="Button3" runat="server" BackColor="#FF2D2D" BorderColor="#FF2D2D" BorderStyle="Solid" Font-Names="Coolvetica Rg" Font-Size="Medium" ForeColor="White" Height="29px" Text="Ventas" Width="116px" />
            &nbsp;<asp:Button ID="Button5" runat="server" BackColor="#FF2D2D" BorderColor="#FF2D2D" BorderStyle="Solid" Font-Names="Coolvetica Rg" Font-Size="Medium" ForeColor="White" Height="29px" Text="Propuestas" Width="116px" />
        </asp:Panel>

        <br />
        <br />

        <div style ="float:left;width:413px; height: 406px; margin-top: 0px; margin-left: 0px;">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
&nbsp;&nbsp;
            <asp:ImageButton ID="ImageButton1" runat="server" Height="299px" ImageUrl="~/Images/user.png" Width="303px" />
&nbsp;&nbsp;
            <br />
&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label9" runat="server" Font-Names="Coolvetica Rg" Font-Size="Medium" ForeColor="#CCCCCC" Height="90px" Text="Descripción de la empresa. Lorem ipsum dolor sit amet, minim nostrud expetenda et vim, etiam summo luptatum te sea. " Width="300px"></asp:Label>
            <br />
            <br />
&nbsp;&nbsp;
            <br />
&nbsp;&nbsp;&nbsp;
            <br />
            <br />
&nbsp;&nbsp;&nbsp;
            <br />
            <br />
&nbsp;
            <br />
            <br />
        </div>
        <div style ="float:left;width:337px; height: 406px; margin-top: 0px; margin-left: 54px;">
&nbsp;&nbsp;
                <br />
                <br />
                <br />
                <asp:Image ID="Image1" runat="server" Height="23px" ImageUrl="~/Images/nameG.png" style="margin-top: 8px" Width="21px" />
&nbsp;
                <br />
                <asp:Label ID="Label12" runat="server" Font-Names="Coolvetica Rg" Font-Size="Large" Text="Nombre de la empresa"></asp:Label>
                <br />
                <br />
&nbsp;<asp:Image ID="Image2" runat="server" Height="23px" ImageUrl="~/Images/phoneG.png" style="margin-top: 8px" Width="21px" />
                <br />
                &nbsp;&nbsp;<asp:DropDownList ID="DropDownList1" runat="server" Font-Names="Coolvetica Rg" Font-Size="Large" Width="119px">
            </asp:DropDownList>
                <br />
                <br />
                <asp:Image ID="Image3" runat="server" Height="23px" ImageUrl="~/Images/locationG.png" style="margin-top: 8px" Width="21px" />
                <br />
                <asp:Label ID="Label20" runat="server" Font-Names="Coolvetica Rg" Font-Size="Large" Text="Dirección" Height="100px" style="margin-top: 0px" Width="300px"></asp:Label>
                <br />
                <br />
&nbsp;&nbsp;
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
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label22" runat="server" Font-Names="Coolvetica Rg" Font-Size="X-Large" Text="Contactos"></asp:Label>
        <br />
        <br />

        <asp:Panel ID="Panel3" runat="server" Font-Names="Coolvetica Rg" Height="205px" Width="715px" style="margin-left: 89px" ScrollBars="Vertical">
            <asp:Table ID="tblContacts" runat="server" GridLines="Both" Height="200px" HorizontalAlign="Left" style="margin-left: 14px" Width="680px">
                <asp:TableRow runat="server" BackColor="Red" ForeColor="White">
                    <asp:TableCell runat="server">Nombre</asp:TableCell>
                    <asp:TableCell runat="server">Correo</asp:TableCell>
                    <asp:TableCell runat="server">Número de teléfono</asp:TableCell>
                    <asp:TableCell runat="server">Dirección</asp:TableCell>
                    <asp:TableCell runat="server">Rol</asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            &nbsp;</asp:Panel>

        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label23" runat="server" Font-Names="Coolvetica Rg" Font-Size="X-Large" Text="Ventas o propuestas"></asp:Label>
        <br />

        <asp:Panel ID="Panel4" runat="server" Font-Names="Coolvetica Rg" Height="205px" Width="715px" style="margin-left: 89px" ScrollBars="Vertical">
            &nbsp;<asp:GridView ID="GridView1" runat="server" Height="175px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="706px">
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                </Columns>
            </asp:GridView>
        </asp:Panel>

            <asp:Label ID="Label24" runat="server" Font-Names="Coolvetica Rg" Font-Size="X-Large" Text="Seguimiento a Ventas"></asp:Label>

        <br />
        <br />
        <asp:Panel ID="Panel5" runat="server" Height="281px" ScrollBars="Both" style="margin-left: 81px" Width="931px">
            <asp:GridView ID="GridView2" runat="server" Height="255px" Width="921px">
            </asp:GridView>
        </asp:Panel>
        <br />
        <br />

        <br />
        <br />
        <asp:Panel ID="Panel6" runat="server" Height="322px" ScrollBars="Both" style="margin-left: 77px" Width="937px">
            <asp:GridView ID="GridView3" runat="server" Height="308px" Width="923px">
            </asp:GridView>
        </asp:Panel>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />

        <asp:Panel ID="Panel1" runat="server" Font-Names="Coolvetica Rg" Height="82px" Width="759px" style="margin-left: 89px">
            <br />
            &nbsp;Aseguramiento de la calidad de software&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Esteban Foseca <span style="color: rgb(17, 17, 17); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">•</span> Jason Espinoza
            <span style="color: rgb(17, 17, 17); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">•</span><span style="color: rgb(0, 0, 0); font-family: &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">
            </span>Mario Chinchilla<br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2017</asp:Panel>

    </form>

</body>
</html>
