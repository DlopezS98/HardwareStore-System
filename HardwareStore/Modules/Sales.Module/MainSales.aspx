<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MainSales.aspx.cs" Inherits="HardwareStore.Modules.Sales.Module.MainSales" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="ContainerVentas">
        <div style="text-align: center">
            <h2 class="titleVenta">Nueva Venta</h2>
        </div>
        <div style="display: flex">
         <div style="width: 40%;margin: 15px">
               <h6 style="margin-left: 10px">Producto</h6>
                <div style="display: flex">
                      <asp:DropDownList Width="100%" Height="30px" runat="server">
                           <asp:ListItem Text="Seleccionar--" />
                           <asp:ListItem Text="..." />
                            <asp:ListItem Text="..." />
                        </asp:DropDownList> 
                        <a href="#"><i class="fas fa-plus-circle" style="margin: 10px; color: #00A350"></i></a>
                 </div>
          </div>
            <div style="width: 25%; margin: 10px">
                <h6 style="margin-left: 10px">Fecha</h6>
                <input  runat="server" type="text" name="Type" id="txtFecha" class="txt20"/>
            </div>
            <div style="width: 25%; margin: 10px">
                <h6 style="margin-left: 10px">Factura Num</h6>
                <input  runat="server" type="text" name="Type" id="txtnumFactura" class="txt20"/>
            </div>
         </div>

        <div style="display: flex">
            <div style="width: 36%;margin: 10px">
                <h6 style="margin-left: 10px">Vendedor</h6>
                <div style="display: flex">
                    <input runat="server" type="text" name="Type" id="Text1" class="txt20"/>     
                </div>
            </div>
            <div style="width: 25%; margin: 10px; margin-left: 5%">
                <h6 style="margin-left: 10px">Existencias</h6>
                <input  runat="server" type="text" name="Type" id="Text2" class="txt20"/>
            </div>
            <div style="width: 12%; margin: 10px">
                <h6 style="margin-left: 10px">Descuento</h6>
                <input  runat="server" type="text" name="Type" id="Text3" class="txt20"/>
            </div>
            <div style="width: 12%; margin: 10px">
                <h6 style="margin-left: 10px">Total</h6>
                <input  runat="server" type="text" name="Type" id="Text4" class="txt20"/>
            </div>
         </div>

        <div style="display: flex">
            <div style="width: 40%;margin: 10px">
                <h6 style="margin-left: 10px">Producto</h6>
                <div style="display: flex">
                    <input runat="server" type="text" name="Type" id="Text5" class="txt20"/>
                    <a href="../ADMIN_CATALOGOS/Productos.aspx"><i class="fas fa-plus-circle" style="margin: 10px; color: #00A350"></i></a>
                </div>
            </div>
            <div style="width: 12%; margin: 10px">
                <h6 style="margin-left: 10px">Descuento</h6>
                <input  runat="server" type="text" name="Type" id="Text6" class="txt20"/>
            </div>
            <div style="width: 12%; margin: 10px">
                <h6 style="margin-left: 10px">Total</h6>
                <input  runat="server" type="text" name="Type" id="Text8" class="txt20"/>
            </div>            
            <div style="width: 25%; margin: 10px; margin-top: 80px; margin-left: 20px; min-width: 150px">
                <a href="#" class="btnSuccess" style="margin-left: 10px"><span>Añadir Producto</span></a>
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
        <div style="display: flex">
            <div style="width: 40%;margin: 10px">
                <h6 style="margin-left: 10px">Moneda</h6>
                <div style="display: flex">
                    <input runat="server" type="text" name="Type" id="Text7" class="txt20"/>
                </div>
            </div>
            <div style="width: 12%; margin: 10px">
                <h6 style="margin-left: 10px">Descuento</h6>
                <input  runat="server" type="text" name="Type" id="Text9" class="txt20"/>
            </div>
            <div style="width: 12%; margin: 10px">
                <h6 style="margin-left: 10px">IVA</h6>
                <input  runat="server" type="text" name="Type" id="Text10" class="txt20"/>
            </div>          
         </div>

        <div style="display: flex">
            <div style="width: 19%;margin: 10px">
                <h6 style="margin-left: 10px">Moneda</h6>
                <div style="display: flex">
                    <input runat="server" type="text" name="Type" id="Text11" class="txt20"/>
                </div>
            </div>
            <div style="width: 19%;margin: 10px">
                <h6 style="margin-left: 10px">Moneda</h6>
                <div style="display: flex">
                    <input runat="server" type="text" name="Type" id="Text14" class="txt20"/>
                </div>
            </div>
            <div style="width: 12%; margin: 10px">
                <h6 style="margin-left: 10px">Descuento</h6>
                <input  runat="server" type="text" name="Type" id="Text12" class="txt20"/>
            </div>
            <div style="width: 12%; margin: 10px">
                <h6 style="margin-left: 10px">IVA</h6>
                <input  runat="server" type="text" name="Type" id="Text13" class="txt20"/>
            </div>            
         </div>
        <div style="width: 100%; margin: 20px; min-width: 150px; text-align: center">
             <a href="#" class="btnSuccess" style="margin-left: 10px"><span>Guardar</span></a>
             <a href="#" class="btnDanger" style="margin-left: 10px"><span>Cancelar</span></a>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
