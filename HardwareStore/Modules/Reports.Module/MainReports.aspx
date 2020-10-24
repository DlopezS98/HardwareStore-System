<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MainReports.aspx.cs" Inherits="HardwareStore.Modules.Reports.Module.MainReports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="ContainerReportes">
        <div>
            <h2 style="text-align: center">
                Reportes
            </h2>
        </div>
        <div style="display: flex">
            <div style="width: 20%;margin: 15px">
                <h6 style="margin-left: 10px"> Módulo</h6>
                <div style="display: flex">
                        <asp:DropDownList Width="100%" Height="30px" runat="server">
                            <asp:ListItem Text="Seleccionar--" />
                            <asp:ListItem Text="Pedidos" />
                            <asp:ListItem Text="Ventas" />
                        </asp:DropDownList>                    
                </div>
            </div>
            <div style="width: 15%;margin: 10px">
                  <h6 style="margin-left: 10px">Desde</h6>
                  <div style="display: flex">
                      <input runat="server" type="date" name="Type" id="Text5" class="txtFechaRep"/>
                  </div>
            </div>
            <div style="width: 15%;margin: 10px">
                  <h6 style="margin-left: 10px">Hasta</h6>
                  <div style="display: flex">
                      <input runat="server" type="date" name="Type" id="Date1" class="txtFechaRep"/>
                  </div>
            </div>
            <div style="width: 25%;margin: 10px">
                  <h6 style="margin-left: 10px">Buscar</h6>
                  <div style="display: flex">
                      <input runat="server" placeholder="Busca Cualquier cosa" type="text" name="Type" id="txtBuscar" class="txtFechaRep"/>
                  </div>
            </div>
        </div>
                <%-- Tabla --%>
        <div class="TableContainer">
            <table class="table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Producto</th>
                        <th>Cantidad</th>
                        <th>Precio Venta</th>
                        <th>SubTotal</th>
                        <th>IVA</th>
                        <th>Descuento</th>
                        <th>Total</th>
                        <th>Acciones</th>
                    </tr>                    
                </thead>
                <tbody>
                    <tr>
                        <td data-label="ID">POL01</td>
                        <td data-label="Nombre">Sin datos</td>
                        <td data-label="Categoría">Sin datos</td>                        
                        <td data-label="Descripción">Sin datos</td>                        
                        <td data-label="Marca">Sin datos</td>                        
                        <td data-label="Proveedor">Sin datos</td>                        
                        <td data-label="Medida">Sin datos</td>                        
                        <td data-label="Dimensiones">Sin datos</td>                                                                  
                        <td data-label="Acciones">
                            <a href="#"><i class="fas fa-trash"></i></a>
                        </td>                               
                    </tr>

                    <tr>
                        <td data-label="ID">POL01</td>
                        <td data-label="Nombre">Sin datos</td>
                        <td data-label="Categoría">Sin datos</td>                        
                        <td data-label="Descripción">Sin datos</td>                        
                        <td data-label="Marca">Sin datos</td>                        
                        <td data-label="Proveedor">Sin datos</td>                        
                        <td data-label="Medida">Sin datos</td>                        
                        <td data-label="Dimensiones">Sin datos</td>                                                                  
                        <td data-label="Acciones">
                            <a href="#"><i class="fas fa-trash"></i></a>
                        </td>                               
                    </tr>
                </tbody>
            </table>
        </div>
        <%-- FIN DE LA TABLA --%>
        <div style="display: flex; margin-top: 20px;">
            <h5>Exportar en: </h5>
            <a href="#"><img src="~/Images/excell-transparente-500x500.png" alt="Exportar en en Excel" runat="server" class="imgExport" /></a>
            <a href="#"><img src="~/Images/337946.png" alt="Exportar en en PDF" runat="server" class="imgExport" /></a>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
