<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MainSales.aspx.cs" Inherits="HardwareStore.Modules.Sales.Module.MainSales" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../../Styles/cssSales.css" rel="stylesheet" />
            <div style="text-align: center; margin: 10px">
                <h2>Ventas</h2>
            </div>
             <div class="containerSales">                
                <div class="form-principal-sales">
                    <div style="display: flex">
                        <div class="col-31"> 
                            <h5 style="float: left; margin-left: 5px;">Cliente</h5>
                            <br />
                            <br />
                            <div style="display: inline-flex; float: left; width: 100%">
                                <asp:DropDownList CssClass="form-control" runat="server">
                                   <asp:ListItem Text="Seleccionar--" />
                                   <asp:ListItem Text="..." />
                                    <asp:ListItem Text="..." />
                                </asp:DropDownList>                                 
                                <asp:LinkButton style="display: flex; margin-top: 5px" runat="server"><i class="fas fa-plus-circle" style="margin: 10px; color: #00A350;"></i></asp:LinkButton>
                            </div>
                        </div>
                        <div class="col-31">
                            <h5 style="float: left; margin-left: 5px;">Fecha</h5>
                            <br />
                            <br />
                            <input runat="server" type="date" name="Type" id="Text2" class="form-control"/>
                        </div>
                        <div class="col-31">
                            <h5 style="float: left; margin-left: 5px;">Num Factura</h5>
                            <br />
                            <br />
                            <input runat="server" type="text" name="Type" id="Text1" class="form-control"/>
                        </div>
                    </div>
                    <div style="display: flex">
                        <div class="col-31"> 
                            <h5 style="float: left; margin-left: 5px;">Vendedor</h5>
                            <input runat="server" type="text" name="Type" id="Text3" class="form-control"/>
                        </div>

                        <div class="col-31"> 
                            <h5 style="float: left; margin-left: 5px;">Existencias</h5>
                            <input runat="server" type="text" name="Type" id="Text4" class="form-control"/>
                        </div>

                        <div class="col-15"> 
                            <h5 style="float: left; margin-left: 5px;">Descuento</h5>
                            <input runat="server" type="text" name="Type" id="Text15" class="form-control"/>
                        </div>

                        <div class="col-15"> 
                            <h5 style="float: left; margin-left: 5px;">Total</h5>
                            <input runat="server" type="text" name="Type" id="Text19" class="form-control"/>
                        </div>
                    </div>
                    <div style="display: flex">
                        <div class="col-20">
                            <h5 style="float: left; margin-left: 5px;">Categoría</h5>
                            <br />
                            <br />
                            <input runat="server" type="text" name="Type" id="Text5" class="form-control"/>
                        </div>
                        <div class="col-20">
                            <h5 style="float: left; margin-left: 5px;">Código</h5>
                            <br />
                            <br />
                            <input runat="server" type="text" name="Type" id="Text16" class="form-control"/>
                        </div>
                        <div class="col-20">
                            <h5 style="float: left; margin-left: 5px;">Cantidad</h5>
                            <br />
                            <br />
                            <input runat="server" type="text" name="Type" id="Text17" class="form-control"/>
                        </div>
                        <div class="col-31"> 
                            <h5 style="float: left; margin-left: 5px;">Bodega</h5>
                            <br />
                            <br />
                            <div style="display: inline-flex; float: left; width: 100%">
                                <asp:DropDownList CssClass="form-control" runat="server">
                                   <asp:ListItem Text="Seleccionar--" />
                                   <asp:ListItem Text="..." />
                                    <asp:ListItem Text="..." />
                                </asp:DropDownList>                                 
                                <asp:LinkButton style="display: flex; margin-top: 5px" runat="server"><i class="fas fa-plus-circle" style="margin: 10px; color: #00A350"></i></asp:LinkButton>
                            </div>
                        </div>
                    </div>
                    <div style="display: flex">
                        <div class="col-42"> 
                            <h5 style="float: left; margin-left: 5px;">Dimensiones</h5>
                            <input runat="server" type="text" name="Type" id="Text6" class="form-control"/>
                        </div>
                        <div class="col-25"> 
                            <h5 style="float: left; margin-left: 5px;">Descuento</h5>
                            <input runat="server" type="text" name="Type" id="Text8" class="form-control"/>
                        </div>
                        <div class="col-25"> 
                            <h5 style="float: left; margin-left: 5px;">Total</h5>
                            <input runat="server" type="text" name="Type" id="Text18" class="form-control"/>
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
            <asp:Button ID="btnCancelar" Text="Cancelar" runat="server" CssClass="btnDanger" />
            <asp:Button Text="Guardar" runat="server" CssClass="btnSuccess" />
         </div>
    </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>