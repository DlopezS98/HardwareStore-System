<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="HardwareStore.Modules.Catalogs.Module.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:MultiView ID="mtvContenedor" runat="server" ActiveViewIndex="0">
        <%-- Vista Llenar Producto --%>  
        <asp:View ID="vVista0" runat="server" >
            <a href="MainCatalogs.aspx"><i style="color: #ff0000; margin: 10px; margin-top: 30px" class="fas fa-times"></i></a>
            <div style="float: right; margin-top: 30px">
                <asp:Button  ID="BtnTodos" Text="Todos" runat="server" OnClick="BtnTodos_Click" CssClass="btnSuccess" />
            </div>
            <div style="text-align: center">
                <h3>Nuevo Producto</h3>            
            </div>
             
            <div style="display: flex">
                <div style="width: 17%;margin: 15px">
                    <h6 style="margin-left: 10px">Producto</h6>
                    <div style="display: flex">
                            <asp:DropDownList Width="100%" Height="30px" runat="server">
                                <asp:ListItem Text="Seleccionar--" />
                                <asp:ListItem Text="..." />
                                <asp:ListItem Text="..." />
                            </asp:DropDownList> 
                        <asp:Button CssClass="BtnAgregar" ID="BtnAgregarPro" OnClick="BtnAgregarPro_Click" Text="+" runat="server" />
                    </div>
                </div>
                <div style="width: 17%;margin: 10px">
                      <h6 style="margin-left: 10px">Código</h6>
                      <div style="display: flex">
                          <input runat="server" type="text" name="Type" id="Text1" class="txtFechaRep"/>
                      </div>
                </div>
                <div style="width: 17%;margin: 15px">
                    <h6 style="margin-left: 10px">Marca</h6>
                    <div style="display: flex">
                            <asp:DropDownList Width="100%" Height="30px" runat="server">
                                <asp:ListItem Text="Seleccionar--" />
                                <asp:ListItem Text="..." />
                                <asp:ListItem Text="..." />
                            </asp:DropDownList>                    
                    </div>
                </div>
                <div style="width: 17%;margin: 15px">
                    <h6 style="margin-left: 10px">Proveedor</h6>
                    <div style="display: flex">
                            <asp:DropDownList Width="100%" Height="30px" runat="server">
                                <asp:ListItem Text="Seleccionar--" />
                                <asp:ListItem Text="..." />
                                <asp:ListItem Text="..." />
                            </asp:DropDownList>                    
                    </div>
                </div>
                <div style="width: 17%;margin: 15px">
                    <h6 style="margin-left: 10px">Unidad</h6>
                    <div style="display: flex">
                            <asp:DropDownList Width="100%" Height="30px" runat="server">
                                <asp:ListItem Text="Seleccionar--" />
                                <asp:ListItem Text="..." />
                                <asp:ListItem Text="..." />
                            </asp:DropDownList>                    
                    </div>
                </div>
            </div>
            <div style="display: flex">                 
                <div style="width: 17%;margin: 10px">
                      <h6 style="margin-left: 10px">Dimensiones</h6>
                      <div style="display: flex">
                          <input placeholder="Dimenciones del Producto" runat="server" type="text" name="Type" id="Text2" class="txtFechaRep"/>
                      </div>
                </div>
                <div style="width: 17% ;margin: 10px">
                      <h6 style="margin-left: 10px">Material</h6>
                      <div style="display: flex">
                          <input placeholder="Tipo de Material " runat="server" type="text" name="Type" id="Text3" class="txtFechaRep"/>
                      </div>
                </div>
                <div style="width: 17%;margin: 10px">
                      <h6 style="margin-left: 10px">Dimensiones</h6>
                      <div style="display: flex">
                          <input placeholder="Dimensiones del Producto" runat="server" type="date" name="Type" id="Text4" class="txtFechaRep"/>
                      </div>
                </div>
            </div>

            <div style="text-align: center; margin-top: 10px">
                <asp:Button ID="BtnCancelar" Text="Cancelar" runat="server" OnClick="BtnAtras_Click" CssClass="btnDanger" />
                <asp:Button ID="BtnGuardar" Text="Guardar" runat="server"  CssClass="btnSuccess" />
                
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
            <div style="display: flex">
               <div style="width: 20% ;margin: 10px">
                      <h6 style="margin-left: 10px">ID</h6>
                      <div style="display: flex">
                          <input readonly runat="server" type="text" name="Type" id="Text7" class="txtFechaRep"/>
                      </div>
                </div>
                <div style="width: 30% ;margin: 10px">
                      <h6 style="margin-left: 10px">Nombre</h6>
                      <div style="display: flex">
                          <input placeholder="Nombre del Producto " runat="server" type="text" name="Type" id="Text6" class="txtFechaRep"/>
                      </div>
                </div>
                <div style="width: 25%;margin: 15px">
                    <h6 style="margin-left: 10px">Categoría</h6>
                    <div style="display: flex">
                            <asp:DropDownList Width="100%" Height="30px" runat="server">
                                <asp:ListItem Text="Seleccionar--" />
                                <asp:ListItem Text="..." />
                                <asp:ListItem Text="..." />
                            </asp:DropDownList>                    
                    </div>
                </div>
             </div>
            <div style="display: flex">
                <div style="width: 80%; margin: 10px">
                     <h6 style="margin-left: 10px">Descripción</h6>
                     <div style="display: flex">
                          <textarea placeholder="Describe el Producto" name="textarea"></textarea>
                     </div>
                </div>
            </div>
            <div style="text-align: center; margin-top: 10px">
                <asp:Button ID="BtnProCancel" Text="Cancelar" runat="server" OnClick="BtnAtras_Click" CssClass="btnDanger" />
                <asp:Button ID="BtnProGuardar" Text="Guardar" runat="server"  CssClass="btnSuccess" />    
            </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
