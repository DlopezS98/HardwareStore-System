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
                    <h3 style="color: #1F2126; text-align: center; margin-top: 20px">Existencias Productos</h3>
                    <div class="container">
                        <div class="row">
                            <div class="col ml-3">
                                <div class="card" style="width: 18rem;">
                                    <img runat="server" src="~/Images/img1.png" class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <h5 class="card-title">Existencias en bodegas</h5>
                                        <div style="margin-top: 15px">
                                            <asp:Button CssClass="btn btn-primary" runat="server" Text="Ver" ID="btnProductWarehouse" OnClick="btnProductWarehouse_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col ml-3">
                                <div class="card" style="width: 18rem;">
                                    <img runat="server" src="~/Images/img3.png" class="card-img-top mt-4" alt="...">
                                    <div class="card-body">
                                        <h5 class="card-title">Transferencias</h5>
                                        <div style="margin-top: 15px">
                                            <asp:Button CssClass="btn btn-primary" runat="server" Text="Ver" ID="btntransferencies" OnClick="btntransferencies_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col ml-3">
                                <div class="card" style="width: 18rem;">
                                    <img runat="server" src="~/Images/devoluciones.png" class="card-img-top mt-5" alt="...">
                                    <div class="card-body">
                                        <h5 class="card-title">Productos dañados</h5>
                                        <div style="margin-top: 15px">
                                            <asp:Button CssClass="btn btn-primary" runat="server" Text="Ver" ID="btnDamage" OnClick="btnDamage_Click" />
                                        </div>
                                    </div>
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
