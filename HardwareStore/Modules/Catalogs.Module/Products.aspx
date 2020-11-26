<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="HardwareStore.Modules.Catalogs.Module.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../../Styles/cssCatalogs.css" rel="stylesheet" />
            <div style="text-align: center; margin: 10px">
                <h2>Nuevo Producto</h2>
            </div>
    <asp:MultiView ID="mtvContenedor" runat="server" ActiveViewIndex="0">
        <%-- Vista Llenar Producto --%>  
        <asp:View ID="vVista0" runat="server" >
                <div class="containerCatalog">                
                    <div class="form-principal-employees">
                        <div style="float: right">
                            <asp:Button CssClass="btnPrimary" runat="server" OnClick="BtnTodos_Click" Text="Ver Todos" ID="BtnTodos" />
                        </div>
                        <div style="display: flex">
                            <div class="col-46"> 
                                <h5 style="float: left; margin-left: 5px;">Producto</h5>
                                <br />
                                <br />
                                <div style="display: inline-flex; float: left; width: 100%">
                                    <asp:DropDownList CssClass="form-control" runat="server">
                                       <asp:ListItem Text="Seleccionar--" />
                                       <asp:ListItem Text="..." />
                                        <asp:ListItem Text="..." />
                                    </asp:DropDownList>
                                    <asp:LinkButton OnClick="BtnAgregarPro_Click" style="display: flex; margin-top: 5px" runat="server"><i class="fas fa-plus-circle" style="margin: 10px; color: #00A350"></i></asp:LinkButton>
                                </div>
                            </div>
                            <div class="col-mr-25">
                                <h5 style="float: left; margin-left: 5px;">Código</h5>
                                <br />
                                <br />
                                <input runat="server" type="text" name="Type" id="Text2" class="form-control"/>
                            </div>
                        </div>

                        <div style="display: flex">
                            <div class="col-46"> 
                                <h5 style="float: left; margin-left: 5px;">Marca</h5>
                                <br />
                                <br />
                                <div style="display: inline-flex; float: left; width: 100%">
                                    <asp:DropDownList CssClass="form-control" runat="server">
                                       <asp:ListItem Text="Seleccionar--" />
                                       <asp:ListItem Text="..." />
                                        <asp:ListItem Text="..." />
                                    </asp:DropDownList>                                   
                                </div>
                            </div>
                            <br />
                            <div class="col-46"> 
                                <h5 style="float: left; margin-left: 5px;">Proveedor</h5>
                                <br />
                                <br />
                                <div style="display: inline-flex; float: left; width: 100%">
                                    <asp:DropDownList CssClass="form-control" runat="server">
                                       <asp:ListItem Text="Seleccionar--" />
                                       <asp:ListItem Text="..." />
                                        <asp:ListItem Text="..." />
                                    </asp:DropDownList>                                   
                                </div>
                            </div>
                        </div>

                        <div style="display: flex">
                            <div class="col-46"> 
                                <h5 style="float: left; margin-left: 5px;">U. Medida</h5>
                                <br />
                                <br />
                                <div style="display: inline-flex; float: left; width: 100%">
                                    <asp:DropDownList CssClass="form-control" runat="server">
                                       <asp:ListItem Text="Seleccionar--" />
                                       <asp:ListItem Text="..." />
                                        <asp:ListItem Text="..." />
                                    </asp:DropDownList>                                   
                                </div>
                            </div>
                            <br />
                            <div class="col-46">
                                <h5 style="float: left; margin-left: 5px;">Dimensiones</h5>
                                <br />
                                <br />
                                <input runat="server" type="text" name="Type" id="Text1" class="form-control"/>
                            </div>
                        </div>
                        <div style="display: flex">
                            <div class="col-46"> 
                                <h5 style="float: left; margin-left: 5px;">Material</h5>
                                <br />
                                <br />
                                <div style="display: inline-flex; float: left; width: 100%">
                                    <asp:DropDownList CssClass="form-control" runat="server">
                                       <asp:ListItem Text="Seleccionar--" />
                                       <asp:ListItem Text="..." />
                                        <asp:ListItem Text="..." />
                                    </asp:DropDownList>                                   
                                </div>
                            </div>
                        </div>
                        <div style="width: 100%; margin: 20px; min-width: 150px; text-align: center">
                             <asp:Button ID="btnCancelar" OnClick="btnCancelar_Click" Text="Cancelar" runat="server" CssClass="btnDanger" />
                             <asp:Button Text="Guardar" runat="server" CssClass="btnSuccess" />
                        </div>
                    </div> 
                </div> 
        </asp:View>
        <%-- Vista Todos Producto --%>       
       <asp:View ID="vVista1" runat="server">
        <asp:Button ID="BtnAtras" Text="Atras" runat="server" OnClick="BtnAtras_Click" CssClass="btnSuccess" />
        <div style="text-align: center">
            <h4>Todos los Producto</h4>            
        </div>       
        <%-- Tabla --%>
        <div class="TableContainer">
            
            <table class="table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th> 
                        <th>Categoría</th>
                        <th>Descripción</th>
                        <th>Marca</th>
                        <th>Proveedor</th>
                        <th>Medida</th>
                        <th>Dimensiones</th>
                        <th>Material</th>
                        <th>Expiración</th>
                        <th>Estado</th>
                        <th>Acciones</th>
                    </tr>                    
                </thead>
                <tbody>
                    <tr>
                        <td data-label="ID">1</td>
                        <td data-label="Nombre">Sin datos</td>
                        <td data-label="Categoría">Sin datos</td>                        
                        <td data-label="Descripción">Sin datos</td>                        
                        <td data-label="Marca">Sin datos</td>                        
                        <td data-label="Proveedor">Sin datos</td>                        
                        <td data-label="Medida">Sin datos</td>                        
                        <td data-label="Dimensiones">Sin datos</td>                        
                        <td data-label="Tipo de Material">Sin datos</td>                        
                        <td data-label="Expiración">Sin datos</td>                        
                        <td data-label="Estado">Sin datos</td>                        
                        <td data-label="Acciones">
                            <a href="#"><i class="far fa-edit"></i></a>
                            <a href="#"><i class="fas fa-trash"></i></a>
                        </td>                               
                    </tr>
                </tbody>
            </table>
        </div>
        </asp:View>
        <asp:View ID="vView2" runat="server">
                <div class="containerCatalog">                
                    <div class="form-principal">
                        <div style="display: flex">
                            <div class="col-46">
                                <h5 style="float: left; margin-left: 5px;">Nombre</h5>
                                <br />
                                <br />
                                <input runat="server" type="text" name="Type" id="Text3" class="form-control"/>
                            </div>
                            <div class="col-46">
                                <h5 style="float: left; margin-left: 5px;">Categoría</h5>
                                <br />
                                <br />
                                <div style="display: inline-flex; float: left; width: 100%">
                                    <asp:DropDownList CssClass="form-control" runat="server">
                                       <asp:ListItem Text="Seleccionar--" />
                                       <asp:ListItem Text="..." />
                                        <asp:ListItem Text="..." />
                                    </asp:DropDownList>                                   
                                </div>
                            </div>
                        </div>
                        <div style="display: flex">
                            <div class="col-95">
                                <h5 style="float: left; margin-left: 5px;">Decripción</h5>
                                <input runat="server" type="text" name="Type" id="Txt" class="form-control"/>
                            </div>
                        </div>
                        <div style="width: 100%; margin: 20px; min-width: 150px; text-align: center">
                             <asp:Button OnClick="BtnAtras_Click" Text="Cancelar" runat="server" CssClass="btnDanger" />
                             <asp:Button Text="Guardar" runat="server" CssClass="btnSuccess" />
                        </div>
                    </div> 
                </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
