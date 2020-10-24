<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MainProductsAdmin.aspx.cs" Inherits="HardwareStore.Modules.ProductsAdmin.Module.MainProductsAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-Existencias">
        <h1>Administración de Existencias</h1>
        <asp:MultiView ActiveViewIndex="0" runat="server" ID="MultiViewProductStocks">
            <%-- View 0 Vista de la lista de productos --%>
            <asp:View runat="server">
                <div class="section-items">
                    <div class="row">
                        <div class="column">
                            <div class="card">
                                <p>30</p>
                                <h3>Productos</h3>
                            </div>
                        </div>
                        <div class="column">
                            <div class="card">
                                <p>30</p>
                                <h3>Categorías</h3>
                            </div>
                        </div>
                        <div class="column">
                            <div class="card">
                                <p>30</p>
                                <h3>Marcas</h3>
                            </div>
                        </div>
                        <div class="column">
                            <div class="card">
                                <p>0</p>
                                <h3>Productos bajo en existencias</h3>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div style="text-align: center">
                            <h4>Productos</h4>
                        </div>
                        <asp:Button ID="btnNewProduct" OnClick="btnNewProduct_Click" Text="Nuevo Producto" runat="server" class="btnSuccess" />
                        <div class="TableContainer">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>#ID</th>
                                        <th>Bodega</th>
                                        <th>Producto</th>
                                        <th>Categoría</th>
                                        <th>Marca</th>
                                        <th>Precio Compra</th>
                                        <th>Precio Venta</th>
                                        <th>Existencias</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td data-label="ID">PDL01</td>
                                        <td data-label="Bodega">Sin datos</td>
                                        <td data-label="Nombre">Sin datos</td>
                                        <td data-label="Categoría">Sin datos</td>
                                        <td data-label="Marca">Sin datos</td>
                                        <td data-label="Precio Compra">Sin datos</td>
                                        <td data-label="Precio Venta">Sin datos</td>
                                        <td data-label="Existencias">Sin datos</td>
                                        <td data-label="Acciones">
                                            <a runat="server" href="#"><i class="far fa-edit" style="color: #339af0;"></i></a>
                                            <a runat="server" href="#"><i class="fas fa-trash" style="color: #339af0;"></i></a>
                                            <asp:LinkButton ID="btnInfoDetails" OnClick="btnInfoDetails_Click" runat="server"><i class="fas fa-info-circle" style="color: #339af0;"></i></asp:LinkButton>
                                            <%--<a runat="server" id="btnInfoDetails" onclick="btnInfoDetails_Click()" href="#"><i class="fas fa-info-circle" style="color: #339af0;"></i></a>--%>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </asp:View>
            <%-- View 1 Vista Nuevo Producto --%>
            <asp:View runat="server">
                <div class="row">
                    <div>
                        <h2>Detalle del Producto</h2>
                    </div>
                    <hr />
                    <div class="column">
                        <h4>Producto</h4>
                        <p>Nombre del producto</p>
                        <h4>Código</h4>
                        <p>121NS90</p>
                        <h4>Categoría</h4>
                        <p>Nombre Categoría</p>
                    </div>
                    <div class="column">
                        <h4>Marca</h4>
                        <p>Nombre Marca</p>
                        <h4>Precio Venta</h4>
                        <p>C$ 190.00</p>
                        <h4>Precio Compra</h4>
                        <p>C$ 150.00</p>
                    </div>
                    <div class="column">
                        <h4>Dimensiones</h4>
                        <p>Dimensiones del producto?</p>
                        <h4>Bodega</h4>
                        <p>Nombre Bodega</p>
                        <h4>Existencias</h4>
                        <p>30</p>
                    </div>
                    <div class="column">
                        <h4>Unidad de medida</h4>
                        <p>unidad</p>
                        <h4>Proveedor</h4>
                        <p>Nombre proveedor</p>
                        <h4>Típo de Material</h4>
                        <p>Nombre material</p>
                    </div>
                </div>
                <hr />
                <asp:Button Text="Regresar" runat="server" ID="btnbackToView0" OnClick="btnbackToView0_Click" />
            </asp:View>
        </asp:MultiView>
    </div>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
