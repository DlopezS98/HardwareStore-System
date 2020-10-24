<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Privilegies.aspx.cs" Inherits="HardwareStore.Modules.Catalogs.Module.Privilegies" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <asp:MultiView ID="ctvContenedor" runat="server" ActiveViewIndex="0">
         <asp:View ID="vVista0" runat="server">
             <a href="MainCatalogs.aspx"><i style="color: #ff0000; margin: 10px" class="fas fa-times"></i></a>
            <div>
                <div style="float: right">
                    <asp:Button OnClick="BtnRolTodos_Click" ID="BtnRolTodos" Text="Todos" runat="server" CssClass="btnSuccess" />
                </div>
             
            <div style="text-align: center; margin-top: 20px">
                <h3>Nuevo Rol</h3>            
            </div>
                <div style="display: flex">
                    <div style="width: 27%;margin: 10px">
                          <h6 style="margin-left: 10px">ID</h6>
                          <div style="display: flex">
                              <input runat="server" type="text" name="Type" id="txtId" class="txtFechaRep"/>
                          </div>
                    </div>
                    <div style="width: 60%;margin: 10px">
                          <h6 style="margin-left: 10px">Nombre</h6>
                          <div style="display: flex">
                              <input runat="server" type="text" name="Type" id="Text1" class="txtFechaRep"/>
                          </div>
                    </div>
                                        
                </div>
                <div style="display: flex">
                    <div style="width: 90%; margin: 10px">
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
            </div>
             
        </asp:View>
        <asp:View ID="vVista1" runat="server">
            <asp:Button OnClick="BtnAtras_Click" ID="BtnAtras" Text="Atrás" runat="server" CssClass="btnSuccess" />
        <div style="text-align: center">
            <h4>Catálogo Roles</h4>            
        </div>
        
        <%-- Tabla --%>
        <div class="TableContainer">
            <table class="table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>                   
                        <th>Descripción</th>
                        <th>Estado</th>
                        <th>Acciones</th>
                    </tr>                    
                </thead>
                <tbody>
                    <tr>
                        <td data-label="ID">1</td>
                        <td data-label="Nombre">Sin datos</td>                      
                        <td data-label="Descripción">Sin datos</td>                                         
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
    </asp:MultiView>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
