<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Suppliers.aspx.cs" Inherits="HardwareStore.Modules.Catalogs.Module.Suppliers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../../Styles/cssCatalogs.css" rel="stylesheet" />
    <div style="text-align: center; margin: 10px;">
        <h2>Proveedores</h2>
    </div>
    <asp:MultiView ID="mtvContenedor" runat="server" ActiveViewIndex="0">
        <asp:View ID="vVista0" runat="server">
                <div class="containerCatalog">                
                    <div class="form-principal-employees">
                       <div style="float: right">
                           <asp:Button ID="BtnProTodos" OnClick="BtnProTodos_Click" Text="Ver Todos" runat="server" CssClass="btnPrimary" />
                       </div>
                        <div style="display: flex; margin-top: 50px">
                            <div class="col-46">
                                <h5 style="float: left; margin-left: 5px;">Nombre</h5>
                                <input runat="server" type="text" name="Type" id="Text2" class="form-control"/>
                            </div>
                            <div class="col-46">
                                <h5 style="float: left; margin-left: 5px;">Compañía</h5>
                                <input runat="server" type="text" name="Type" id="Text1" class="form-control"/>
                            </div>
                        </div>
                        <div style="display: flex">
                            <div class="col-95">
                                <h5 style="float: left; margin-left: 5px;">Dirección</h5>
                                <input runat="server" type="text" name="Type" id="Text3" class="form-control"/>
                            </div>
                        </div>
                        <div style="display: flex">
                            <div class="col-46">
                                <h5 style="float: left; margin-left: 5px;">Teléfono</h5>
                                <input runat="server" type="text" name="Type" id="Text4" class="form-control"/>
                            </div>
                            <div class="col-46">
                                <h5 style="float: left; margin-left: 5px;">DNI</h5>
                                <input runat="server" type="text" name="Type" id="Text5" class="form-control"/>
                            </div>
                        </div>
                        <div style="display: flex">
                            <div class="col-95">
                                <h5 style="float: left; margin-left: 5px;">Correo</h5>
                                <input runat="server" type="text" name="Type" id="Text8" class="form-control"/>
                            </div>
                        </div>

                        <div style="width: 100%; margin: 20px; min-width: 150px; text-align: center">
                             <asp:Button ID="btnCancelar" OnClick="btnCancelar_Click" Text="Cancelar" runat="server" CssClass="btnDanger" />
                             <asp:Button Text="Guardar" runat="server" CssClass="btnSuccess" />
                        </div>
                    </div> 
                </div>   
            <br />
            <br />
            <br />
            <br />
        </asp:View>
        <%-- Vista 2 --%>
        <asp:View ID="View1" runat="server"> 
            <asp:Button OnClick="BtnAtras_Click" ID="BtnAtras" Text="Atrás" runat="server"  CssClass="btnSuccess" />
        <div style="text-align: center">
            <h4>Catálogo Proveedor</h4>            
        </div>
        <%-- Tabla --%>
        <div class="TableContainer">
            <table class="table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Compañía</th>                   
                        <th>Nombre</th>
                        <th>Dirección</th>
                        <th>Teléfono</th>
                        <th>Correo</th>
                        <th>Estado</th>
                        <th>Acciones</th>
                    </tr>                    
                </thead>
                <tbody>
                    <tr>
                        <td data-label="ID">1</td>
                        <td data-label="Nombre">Sin datos</td>                      
                        <td data-label="Apellido">Sin datos</td>                                         
                        <td data-label="Direccion">Sin datos</td>                                                                    
                        <td data-label="Telefono">Sin datos</td>                                                                    
                        <td data-label="Estado">Sin datos</td>                                                                    
                        <td data-label="Cedula">Sin datos</td>                                                                    
                        <td data-label="Acciones">
                            <a href="#"><i class="far fa-edit"></i></a>
                            <a href="#"><i class="fas fa-trash"></i></a>
                        </td>                               
                    </tr>
                </tbody>
            </table>
        </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
