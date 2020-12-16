<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WarehouseProducts.aspx.cs" Inherits="HardwareStore.Modules.ProductsAdmin.Module.WarehouseProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../../Styles/Toast.css" rel="stylesheet" />
    <div id="toast" class="toast">
        <div class="toast-img toast-img-success"><i class="fas fa-exclamation"></i></div>
        <div class="toast-body">
            <p style="text-align: justify;">
                Producto Agregado!
                <br />
                <asp:Button ID="btnGo" OnClick="btnGo_Click" Text="Ir" runat="server" CssClass="btnSuccess" />
            </p>
        </div>
    </div>

    <%-- Sección del modal --%>
    <div class="OdModal" id="odmodal" data-animation="slideInOutLeft">
        <asp:UpdatePanel runat="server" ID="UpdatePanel1">
            <ContentTemplate>
                <div class="modal-dialog">
                    <div class="modal-header">
                        <h4 style="color: #fff;">Existencias Productos</h4>
                        <%--<label runat="server" id="getidFromtable"></label>--%>
                        <button id="btnCloseModal" class="btnClose" data-close>✕</button>
                    </div>
                    <div class="modal-content">

                        <div style="padding: 8px; border-radius: 5px; background-color: #fff">
                            <h3 style="text-align: center">Datos del Producto a Eliminar</h3>
                            <div style="display: flex; margin-top: 25px">
                                <div class="col-33">
                                    <b>Nombre del Producto:</b> ... 
                                </div>

                                <div class="col-33">
                                    <b>Código Producto:</b> 08418652
                                </div>
                                <div class="col-33">
                                    <b>Dirección:</b> Lorem ipsum dolor sit amet, consectetur adipiscing elit 
                                </div>
                            </div>
                            <div style="display: flex; margin-top: 25px">
                                <div class="col-33">
                                    <b>Marca:</b> ...
                                </div>
                                <div class="col-33">
                                    <b>Producto:</b> ...
                                </div>

                                <div class="col-33">
                                    <b>U. Medida:</b> ...
                                </div>
                            </div>
                            <div style="display: flex; margin-top: 25px">
                                <div class="col-33">
                                    <b>Dimensiones:</b> ... 
                                </div>

                                <div class="col-33">
                                    <b>Material:</b> Goku Uzumaki
                                </div>

                                <div class="col-33">
                                    <b>Categoría</b> ... 
                                </div>
                            </div>
                            <div style="display: flex; margin-top: 25px">
                                <div class="col-33">
                                    <b>Decripción:</b> ...
                                </div>
                            </div>
                            <div>
                                <h1 style="text-align: center; margin-top: 40px; color: #73B7FE">Llena los siguientes campos para confirmar</h1>
                            </div>
                            <div style="display: flex; flex-wrap: wrap;">
                                <asp:TextBox Visible="false" TextMode="Number" placeholder="Id Bodega" runat="server" ID="TextBox4" class="form-control" />
                                <asp:TextBox Visible="false" TextMode="Number" placeholder="Id Producto" runat="server" ID="TextBox5" class="form-control" />
                                <asp:TextBox Visible="false" TextMode="Number" placeholder="Id Precio Compra" runat="server" ID="TextBox6" class="form-control" />
                                <asp:TextBox Visible="false" placeholder="Bodega" runat="server" ID="TextBox7" class="form-control" />

                                <div class="col-46">
                                    <h6 style="margin-left: 10px">Cantidad a Transferir</h6>
                                    <div style="display: flex; margin-left: 10px">
                                        <asp:TextBox placeholder="Cantidad" runat="server" ID="TextBox8" class="form-control" />
                                    </div>
                                </div>
                                <div class="col-46">
                                    <h6 style="margin-left: 10px">Título</h6>
                                    <div style="display: flex; margin-left: 10px">
                                        <asp:TextBox placeholder="Título" runat="server" ID="TextBox9" class="form-control" />
                                    </div>
                                </div>

                                <div class="col-46">
                                    <h6 style="margin-left: 10px">Bodega de Destino</h6>
                                    <div style="display: flex; margin-left: 10px">
                                        <asp:DropDownList CssClass="form-control" Width="100%" Height="50px" runat="server">
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div style="width: 100%; margin: 20px; min-width: 150px; text-align: center">
                                    <asp:Button runat="server" Text="Confirmar" CssClass="btnSuccess" Style="margin-left: 10px" />
                                    <asp:Button ID="Button2" runat="server" Text="Cancelar" CssClass="btnDanger" Style="margin-left: 10px" />
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <%-- Fin Sección del modal --%>
    <asp:MultiView ID="ProductWaresause" ActiveViewIndex="0" runat="server">
        <asp:View runat="server">
            <asp:UpdatePanel runat="server" ID="UpdatePanel2">
                <ContentTemplate>
                    <h1 style="color: #1F2126; text-align: center;">Existencias en Bodega</h1>
                    <div style="display: flex; flex-direction: row;">
                        <div style="display: flex; margin-left: 10px; width: 40%">
                            <asp:TextBox placeholder="Buscar" runat="server" ID="txtOrdNumber" class="form-control" />
                            <asp:Button class="btnPrimary" type="button" runat="server" Text="Buscar" />
                        </div>
                        <div style="width: 40%; margin-left: 28%;">
                            <div style="margin-right: 15px; width: 100%; display: flex;">
                                <asp:DropDownList CssClass="form-control" Width="100%" Height="50px" runat="server">
                                </asp:DropDownList>
                                <div style="margin-left: 15px">
                                    <asp:Button ID="Listmove" OnClick="Listmove_Click" class="btnPrimary" type="button" runat="server" Text="Pendientes" />
                                </div>
                            </div>
                        </div>

                    </div>
                    <br />
                    <br />
                    <div class="row">
                        <div class="col-lg-12">
                            <table class="table">
                                <thead class="thead-dark">
                                    <tr>
                                        <th scope="col">ID</th>
                                        <th scope="col">Nombre completo</th>
                                        <th scope="col">Rol</th>
                                        <th scope="col">Nombre de Usuario</th>
                                        <th scope="col">Estado</th>
                                        <th scope="col">Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">1</th>
                                        <td>Danny López</td>
                                        <td>Root</td>
                                        <td>DlopezS98</td>
                                        <td>Activo</td>
                                        <td>
                                            <asp:Button ID="btnDelete" OnClick="btnDelete_Click" Text="Eliminar" runat="server" CssClass="btnDanger" />
                                            <asp:Button ID="btnMove" OnClick="btnMove_Click" Text="Transferir" runat="server" CssClass="btnSuccess" />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnDelete" />
                    <asp:PostBackTrigger ControlID="Listmove" />
                </Triggers>
            </asp:UpdatePanel>
        </asp:View>

        <asp:View runat="server">
            <asp:UpdatePanel runat="server" ID="UpdatePanel3">
                <ContentTemplate>
                    <div style="border: 1px solid #e4e4e4; padding: 8px; border-radius: 5px; background-color: #fff">
                        <h3 style="text-align: center">Datos del Producto a Eliminar</h3>
                        <div style="display: flex; margin-top: 25px">
                            <div class="col-33">
                                <b>Nombre del Producto:</b> ... 
                            </div>

                            <div class="col-33">
                                <b>Código Producto:</b> 08418652
                            </div>
                            <div class="col-33">
                                <b>Dirección:</b> Lorem ipsum dolor sit amet, consectetur adipiscing elit 
                            </div>
                        </div>
                        <div style="display: flex; margin-top: 25px">
                            <div class="col-33">
                                <b>Marca:</b> ...
                            </div>
                            <div class="col-33">
                                <b>Producto:</b> ...
                            </div>

                            <div class="col-33">
                                <b>U. Medida:</b> ...
                            </div>
                        </div>
                        <div style="display: flex; margin-top: 25px">
                            <div class="col-33">
                                <b>Dimensiones:</b> ... 
                            </div>

                            <div class="col-33">
                                <b>Material:</b> Goku Uzumaki
                            </div>

                            <div class="col-33">
                                <b>Categoría</b> ... 
                            </div>
                        </div>
                        <div style="display: flex; margin-top: 25px">
                            <div class="col-33">
                                <b>Decripción:</b> ...
                            </div>
                        </div>
                        <div>
                            <h1 style="text-align: center; margin-top: 40px; color: #73B7FE">Llena los siguientes campos para confirmar</h1>
                        </div>
                        <div id="formdetail" style="display: flex; flex-wrap: wrap;">
                            <asp:TextBox Visible="false" TextMode="Number" placeholder="Id Bodega" runat="server" ID="txtWarehouseId" class="form-control" />
                            <asp:TextBox Visible="false" TextMode="Number" placeholder="Id Producto" runat="server" ID="txtProductId" class="form-control" />
                            <asp:TextBox Visible="false" TextMode="Number" placeholder="Id Precio Compra" runat="server" ID="txtPriceOrders" class="form-control" />
                            <asp:TextBox Visible="false" placeholder="Bodega" runat="server" ID="txtExistences" class="form-control" />

                            <div class="col-46">
                                <h6 style="margin-left: 10px">Cantidad a restar</h6>
                                <div style="display: flex; margin-left: 10px">
                                    <asp:TextBox placeholder="Cantidad" runat="server" ID="TextBox1" class="form-control" />
                                </div>
                            </div>
                            <div class="col-46">
                                <h6 style="margin-left: 10px">Título</h6>
                                <div style="display: flex; margin-left: 10px">
                                    <asp:TextBox placeholder="Título" runat="server" ID="TextBox2" class="form-control" />
                                </div>
                            </div>
                            <div class="col-95 ">
                                <h6 style="margin-left: 10px">Descripción</h6>
                                <div style="display: flex; margin-left: 10px">
                                    <asp:TextBox placeholder="Descripción" runat="server" ID="TextBox3" class="form-control" />
                                </div>
                            </div>
                            <div style="width: 100%; margin: 20px; min-width: 150px; text-align: center">
                                <asp:Button runat="server" Text="Confirmar" CssClass="btnSuccess" Style="margin-left: 10px" />
                                <asp:Button ID="btnCancel" OnClick="btnCancel_Click" runat="server" Text="Cancelar" CssClass="btnDanger" Style="margin-left: 10px" />
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnCancel" />
                </Triggers>
            </asp:UpdatePanel>
        </asp:View>

        <asp:View runat="server">
            <asp:UpdatePanel runat="server" ID="UpdatePanel4">
                <ContentTemplate>
                    <div class="row">
                        <div class="col-lg-12">
                            <table class="table">
                                <thead class="thead-dark">
                                    <tr>
                                        <th scope="col">ID</th>
                                        <th scope="col">Nombre completo</th>
                                        <th scope="col">Rol</th>
                                        <th scope="col">Nombre de Usuario</th>
                                        <th scope="col">Estado</th>
                                        <th scope="col">Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">1</th>
                                        <td>Danny López</td>
                                        <td>Root</td>
                                        <td>DlopezS98</td>
                                        <td>Activo</td>
                                        <td>
                                            <asp:Button Text="Eliminar" runat="server" CssClass="btnDanger" />
                                            <asp:Button data-open="odmodal" ID="Button1" OnClientClick="ShowModalDetail()" Text="Editar" runat="server" CssClass="btnPrimary" />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:View>
    </asp:MultiView>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
    <script>
        function ShowModalDetail() {
            const isVisible = "is-visible";
            document.getElementById("odmodal").classList.add(isVisible);
        }

        function launch_toast() {
            var el = document.getElementById("toast")
            el.classList.add("show");
            setTimeout(function () { el.classList.remove("show") }, 5000);
        }
    </script>
</asp:Content>
