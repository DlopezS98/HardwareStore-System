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
                    <h1 style="color: #1F2126;">Existencias Productos</h1>
                    <div class="rowcard">
                        <div class="column">
                            <div class="card">
                                <h3>Existencias en bodegas</h3>
                                <asp:Image Height="150px" Width="130px" ImageUrl="~/Images/img1.png" runat="server" />
                                <div style="margin-top: 40px">
                                    <asp:Button CssClass="btnPrimary" runat="server" Text="Ver" ID="btnProductWarehouse" OnClick="btnProductWarehouse_Click" />
                                </div>
                            </div>
                        </div>
                        <div class="column">
                            <div class="card">
                                <h3>Historial de transferencia</h3>
                                <asp:Image Height="150px" Width="130px" ImageUrl="~/Images/img3.png" runat="server" />
                                <div style="margin-top: 40px">
                                    <asp:Button CssClass="btnPrimary" runat="server" Text="Ver" ID="btntransferencies" OnClick="btntransferencies_Click" />
                                </div>
                            </div>
                        </div>
                        <div class="column">
                            <div class="card">
                                <h3>Productos dañados</h3>
                                <asp:Image Height="150px" Width="130px" ImageUrl="~/Images/devoluciones.png" runat="server" />
                                <div style="margin-top: 40px">
                                    <asp:Button CssClass="btnPrimary" runat="server" Text="Ver" ID="btnDamage" OnClick="btnDamage_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:View>
    </asp:MultiView>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
