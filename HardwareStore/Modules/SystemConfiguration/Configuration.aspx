<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Configuration.aspx.cs" Inherits="HardwareStore.Modules.SystemConfiguration.Configuration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../../Styles/cssConfiguration.css" rel="stylesheet" />
    <asp:MultiView ID="mtvContenedor" runat="server" ActiveViewIndex="0">
        <asp:View ID="Vista0" runat="server" >
            <div style="text-align: center; margin: 10px">
                <h2>Configuración</h2>
            </div>
            <div class="containerConfig">                
                <div class="form-logo">
                    <h2>Ferretería  <span style="color: #1DC4E7">Sánchez</span></h2>
                </div>
                <div class="form-principal">
                    <div style="display: flex">
                        <div  class="col-70">
                            <div style="display: flex">
                              <input placeholder="Nombre del Local" runat="server" type="text" name="Type" id="Text1" class="form-control"/>
                            </div>
                        </div>
                        <div class="col-25">
                            <div style="display: flex">
                              <input placeholder="Número RUC" runat="server" type="text" name="Type" id="Text2" class="form-control"/>
                            </div>
                        </div>
                    </div>
                    <div style="display: flex">
                        <div class="col-100">
                            <div style="display: flex">
                              <input placeholder="Dirección" runat="server" type="text" name="Type" id="Text3" class="form-control"/>
                            </div>
                        </div>
                    </div>
                    <div style="display: flex">
                        <div class="col-100">
                            <div style="display: flex">
                              <input placeholder="Descripción" runat="server" type="text" name="Type" id="Text4" class="form-control"/>
                            </div>
                        </div>
                    </div>
                    <div style="display: flex">
                        <div  class="col-50">
                            <div style="display: flex">
                              <input placeholder="Correo Electrónico" runat="server" type="text" name="Type" id="Text5" class="form-control"/>
                            </div>
                        </div>
                        <div  class="col-50">
                            <div style="display: flex">
                                <asp:DropDownList Width="60%" Height="30px" runat="server" class="form-control">
                                    <asp:ListItem Text="+505" />
                                    <asp:ListItem Text="..." />
                                    <asp:ListItem Text="..." />
                                </asp:DropDownList> 
                                <input  placeholder="Teléfono" runat="server" type="text" name="Type" id="Text6" class="form-control"/>
                            </div>
                        </div>
                    </div>
  
                    <div style="display: flex">
                        <div class="col-50">
                            <div style="display: flex">
                              <input placeholder="Línea Fija" runat="server" type="text" name="Type" id="Text7" class="form-control"/>
                            </div>
                        </div>
                        <div class="col-50">
                            <div style="display: flex">
                              <input placeholder="Nombre del Propietario" runat="server" type="text" name="Type" id="Text8" class="form-control"/>
                            </div>
                        </div>
                    </div>
                     <div style="display: flex">
                        <div class="col-50">
                            <div style="display: flex">
                              <input placeholder="Nombre Fiscal" runat="server" type="text" name="Type" id="Text9" class="form-control"/>
                            </div>
                        </div>
                        <div  class="col-50">
                            <div style="display: flex">
                              <input placeholder="Descripción de impuestos" runat="server" type="text" name="Type" id="Text10" class="form-control"/>
                            </div>
                        </div>
                    </div>

                     <div style="display: flex">
                        <div  class="col-47">
                            <div style="display: flex">
                              <input placeholder="Tasa de Impuesto" runat="server" type="text" name="Type" id="Text11" class="form-control"/>
                            </div>
                        </div>
                    </div>
                    <div style="display: flex">                        
                        <div  class="col-50">
                            <h6 style="margin-left: 10px">Creado En</h6>
                            <div style="display: flex">
                                <input runat="server" type="date" name="Type" id="Text12" class="form-control"/>
                            </div>
                        </div>
                        <div  class="col-50">
                            <h6 style="margin-left: 10px">Actualizado en</h6>   
                            <div style="display: flex">
                                <input runat="server" type="date" name="Type" id="Text13" class="form-control"/>
                            </div>
                        </div>
                    </div>
                    <div style="display: flex">
                         <div style="margin: 0 auto;">
                             <h5>Logo</h5>
                              <input type="file" title="Seleccionar Imagen" class="form-control" />
                         </div>
                    </div>
                </div>
            </div>
        </asp:View>
        <asp:View ID="View1" runat="server" >

        </asp:View>
    </asp:MultiView>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
