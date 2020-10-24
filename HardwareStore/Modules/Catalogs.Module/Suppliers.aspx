﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Suppliers.aspx.cs" Inherits="HardwareStore.Modules.Catalogs.Module.Suppliers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:MultiView ID="mtvContenedor" runat="server" ActiveViewIndex="0">
        <asp:View ID="vVista0" runat="server">
            <a href="MainCatalogs.aspx"><i style="color: #ff0000; margin: 10px" class="fas fa-times"></i></a>
            <div style="float: right">
                  <asp:Button OnClick="BtnProTodos_Click" ID="BtnProTodos" Text="Todos" runat="server" CssClass="btnSuccess" />
            </div>
                <div style="text-align: center; margin-top: 20px">
                    <h3>Nuevo Proveedor</h3>            
                </div>
            <div style="display: flex">
                 <div style="width: 20%;margin: 10px">
                      <h6 style="margin-left: 10px">ID</h6>
                      <div style="display: flex">
                           <input runat="server" type="text" name="Type" id="txtId" class="txtFechaRep"/>
                      </div>
                  </div>
                  <div style="width: 60%;margin: 10px">
                          <h6 style="margin-left: 10px">Compañía</h6>
                          <div style="display: flex">
                              <input runat="server" type="text" name="Type" id="Text1" class="txtFechaRep"/>
                          </div>
                  </div>
            </div>
            <div style="display: flex">
                <div style="width: 40%;margin: 10px">
                      <h6 style="margin-left: 10px">Nombre</h6>
                      <div style="display: flex">
                           <input runat="server" type="text" name="Type" id="Text3" class="txtFechaRep"/>
                      </div>
                </div>
                <div style="width: 45%;margin: 10px">
                      <h6 style="margin-left: 10px">Correo</h6>
                      <div style="display: flex">
                           <input runat="server" type="text" name="Type" id="Text6" class="txtFechaRep"/>
                      </div>
                </div>
            </div>
            <div style="display: flex">
                <div style="width: 30%;margin: 10px">
                      <h6 style="margin-left: 10px">Teléfono</h6>
                      <div style="display: flex">
                           <input runat="server" type="text" name="Type" id="Text2" class="txtFechaRep"/>
                      </div>
                </div>
                <div style="display: flex">
                    <div style="width: 100%; margin: 10px">
                         <h6 style="margin-left: 10px">Dirección</h6>
                         <div style="display: flex">
                              <textarea placeholder="Escribe la Diirección del empleado" name="textarea"></textarea>
                         </div>
                    </div>
                </div>
                <div style="width: 35%;margin: 10px">
                      <h6 style="margin-left: 10px">DNI</h6>
                      <div style="display: flex">
                           <input runat="server" type="text" name="Type" id="Text4" class="txtFechaRep"/>
                      </div>
                </div>
            </div>
            <div style="display: flex">
                <div style="width: 45%;margin: 10px">
                      <h6 style="margin-left: 10px">Correo</h6>
                      <div style="display: flex">
                           <input runat="server" type="text" name="Type" id="Text5" class="txtFechaRep"/>
                      </div>
                </div>
            </div>
            <div style="text-align: center; margin: 25px">
                <asp:Button ID="BtnProCancel" Text="Cancelar" runat="server"  CssClass="btnDanger" />
                <asp:Button ID="BtnProGuardar" Text="Guardar" runat="server"  CssClass="btnSuccess" />    
            </div>
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
