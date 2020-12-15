<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminExistencias.aspx.cs" Inherits="HardwareStore.Modules.ProductsAdmin.Module.AdminExistencias" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%--	    <header id="main-header">		
		    <div id="logo-header">
			    <span class="site-name">Administración de Existencia</span>
		    </div> <!-- / #logo-header -->

		    <nav>
			    <ul>
				    <li><asp:Button CssClass="btnDark" runat="server" ID="btnBackToCreateSale" Text="Lista de Productos" /></li>
				    <li><asp:Button CssClass="btnDark" runat="server" ID="btnTblProducts" Text="Detalle Venta" /></li>
				    <li><asp:Button CssClass="btnDark" runat="server" ID="btnGoToListOrdersSales" Text="Ver Ventas" /></li>
			    </ul>
		    </nav><!-- / nav -->
	    </header>--%>

    <asp:MultiView ID="SalesView" ActiveViewIndex="0" runat="server">
        <asp:View runat="server">
            <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                <ContentTemplate>
                    <h1 style="color: #1F2126; text-align: center;">Existencias Productos</h1>
                    <div class="rowcard">
                        <div class="column">
                            <div class="card">
                                <h3>Productos en bodegas</h3>
                                <asp:Image Height="150px" Width="130px" ImageUrl="~/Images/img1.png" runat="server" />
                                <div style="margin-top: 40px">
                                    <asp:Button CssClass="btnPrimary" runat="server" Text="Ver" ID="btnProductWarehouse" OnClick="btnProductWarehouse_Click" />
                                </div>
                            </div>
                        </div>
                        <div class="column">
                            <div class="card">
                                <h3>Eliminar productos</h3>
                                <asp:Image Height="150px" Width="130px" ImageUrl="~/Images/img2.png" runat="server" />
                                <div style="margin-top: 40px">
                                    <asp:Button CssClass="btnPrimary" runat="server" Text="Ver" ID="btnDelProductWarehouse" OnClick="btnDelProductWarehouse_Click" />
                                </div>
                            </div>
                        </div>
                        <div class="column">
                            <div class="card">
                                <h3>Transferir o mover productos</h3>
                                <asp:Image Height="150px" Width="130px" ImageUrl="~/Images/img3.png" runat="server" />
                                <div style="margin-top: 40px">
                                    <asp:Button CssClass="btnPrimary" runat="server" Text="Ver" ID="Button3" />
                                </div>
                            </div>
                        </div>
                        <div class="column">
                            <div class="card">
                                <h3>Productos dañados</h3>
                                <asp:Image Height="150px" Width="130px" ImageUrl="~/Images/devoluciones.png" runat="server" />
                                <div style="margin-top: 40px">
                                    <asp:Button CssClass="btnPrimary" runat="server" Text="Ver" ID="Button4" />
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>

            <asp:UpdatePanel runat="server" ID="UpdatePanel2">
                <ContentTemplate>
                </ContentTemplate>
            </asp:UpdatePanel>

            <asp:UpdatePanel runat="server" ID="UpdatePanel3">
                <ContentTemplate>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:View>
    </asp:MultiView>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
