<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Configuration.aspx.cs" Inherits="HardwareStore.Modules.SystemConfiguration.Configuration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%-- Modal Alert --%>
    <div style="margin-top: 120px" class="modal fade" id="ModalAlert" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header bg-dark">
                    <h5 class="modal-title text-light" id="exampleModalLabel">Advertencia!</h5>
                    <button type="button" class="close text-light" data-dismiss="modal" aria-label="Close">
                        <span class="text-light" aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Estás seguro que quieres eliminar el producto?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                    <asp:Button ID="btnDelete" OnClick="btnDelete_Click" Text="Confirmar" runat="server" CssClass="btn btn-success" />
                </div>
            </div>
        </div>
    </div>

    <%-- Fin Modal Alert --%>
    <link href="../../Styles/cssConfiguration.css" rel="stylesheet" />
    <div style="text-align: center; margin: 10px">
        <h2>Configuración</h2>
    </div>
    <asp:MultiView ID="containerConfig" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            <div class="containerConfig">
                <div class="form-logo">
                    <h2>Ferretería  <span style="color: #1DC4E7">Sánchez</span></h2>
                </div>
                <div class="form-principal p-4">
                    <h3 style="text-align: center">Datos del Negocio</h3>
                    <div class="form-row">
                        <div class="col-md-6 p-2">
                            <b>Nombre del Local:</b> Ferretería Sánchez 
                        </div>
                        <div class="col-md-6 p-2">
                            <b>Número RUC:</b> 08418652
                        </div>
                        <div class="col-md-6 p-2">
                            <b>Dirección:</b> Lorem ipsum dolor sit amet, consectetur adipiscing elit 
                        </div>
                        <div class="col-md-6 p-2">
                            <b>Descripción:</b> Lorem ipsum dolor sit amet, consectetur adipiscing elit
                        </div>
                        <div class="col-md-6 p-2">
                            <b>Correo Electrónico:</b> ejemplo@ejemplo.com 
                        </div>
                        <div class="col-md-6 p-2">
                            <b>Teléfono:</b> +505 8888-8888
                        </div>
                        <div class="col-md-6 p-2">
                            <b>Linea Fija:</b> 2222-2222 
                        </div>
                        <div class="col-md-6 p-2">
                            <b>Nombre del Propietario:</b> Goku Uzumaki
                        </div>
                        <div class="col-md-6 p-2">
                            <b>Nombre Fiscal:</b> ... 
                        </div>
                        <div class="col-md-6 p-2">
                            <b>Decripción de Impuestos:</b> ...
                        </div>
                        <div class="col-md-6 p-2">
                            <b>Tasa de Impuestos</b> ... 
                        </div>
                        <div class="col-md-6 p-2">
                            <b>Creado en:</b> 01/01/2020 
                        </div>
                        <div class="col-md-6 p-2">
                            <b>Actualizado en:</b> 14/12/2020
                        </div>
                    </div>

                    <div style="text-align: center; margin-top: 50px">
                        <asp:Button CssClass="btn btn-success" runat="server" Text="Editar" ID="btnEdit" OnClick="btnEdit_Click" />
                    </div>
                </div>
            </div>
        </asp:View>

        <asp:View ID="View2" runat="server">
            <div class="containerConfig">
                <div class="form-logo">
                    <h2>Ferretería  <span style="color: #1DC4E7">Sánchez</span></h2>
                </div>
                <div class="form-principal-edit">
                    <div class="form-row p-3">
                        <div class="col-md-6 mt-3">
                            <div style="display: flex">
                                <input placeholder="Nombre del Local" runat="server" type="text" name="Type" id="Text1" class="form-control" />
                            </div>
                        </div>
                        <div class="col-md-6 mt-3">
                            <div style="display: flex;">
                                <input placeholder="Número RUC" runat="server" type="text" name="Type" id="Text2" class="form-control" />
                            </div>
                        </div>
                        <div class="col-md-12 mt-3">
                            <div style="display: flex">
                                <input placeholder="Dirección" runat="server" type="text" name="Type" id="Text3" class="form-control" />
                            </div>
                        </div>
                        <div class="col-md-12 mt-3">
                            <div style="display: flex">
                                <input placeholder="Descripción" runat="server" type="text" name="Type" id="Text4" class="form-control" />
                            </div>
                        </div>
                        <div class="col-md-4 mt-3">
                            <div style="display: flex">
                                <asp:DropDownList Width="60%" runat="server" class="form-control">
                                    <asp:ListItem Text="+505" />
                                    <asp:ListItem Text="..." />
                                    <asp:ListItem Text="..." />
                                </asp:DropDownList>
                                <input placeholder="Teléfono" runat="server" type="text" name="Type" id="Text6" class="form-control" />
                            </div>
                        </div>
                        <div class="col-md-4 mt-3">
                            <input placeholder="Correo Electrónico" runat="server" type="text" name="Type" id="Text5" class="form-control" />
                        </div>
                        <div class="col-md-4 mt-3">
                            <div style="display: flex">
                                <input placeholder="Línea Fija" runat="server" type="text" name="Type" id="Text7" class="form-control" />
                            </div>
                        </div>
                        <div class="col-md-6 mt-3">
                            <div style="display: flex">
                                <input placeholder="Nombre del Propietario" runat="server" type="text" name="Type" id="Text8" class="form-control" />
                            </div>
                        </div>
                        <div class="col-md-6 mt-3">
                            <div style="display: flex">
                                <input placeholder="Nombre Fiscal" runat="server" type="text" name="Type" id="Text9" class="form-control" />
                            </div>
                        </div>
                        <div class="col-md-6 mt-3">
                            <div style="display: flex">
                                <input placeholder="Descripción de impuestos" runat="server" type="text" name="Type" id="Text10" class="form-control" />
                            </div>
                        </div>

                        <div class="col-md-6 mt-3">
                            <div style="display: flex">
                                <input placeholder="Tasa de Impuesto" runat="server" type="text" name="Type" id="Text11" class="form-control" />
                            </div>
                        </div>
                        <div class="col-md-6 mt-3" style="margin: 0 auto;">
                            <h5 style="text-align: center">Logo</h5>
                            <input type="file" title="Seleccionar Imagen" class="form-control" />
                        </div>
                    </div>
                    <div style="width: 100%; margin: 20px; min-width: 150px; text-align: center">
                        <asp:Button ID="btnCancelar" OnClick="btnCancelar_Click" Text="Cancelar" runat="server" CssClass="btn btn-danger" />
                        <asp:Button Text="Guardar" runat="server" CssClass="btn btn-success" />
                    </div>
                </div>
            </div>
        </asp:View>
        <asp:View ID="View3" runat="server">
        </asp:View>
    </asp:MultiView>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
