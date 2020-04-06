<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication4._Default" %>

<asp:Content ID="Header" ContentPlaceHolderID="HeaderContent" runat="server">
    
    <script src="Scripts/jquery-3.4.1.min.js"></script>

    <script>
     
        $(document).ready(function () {
            //GetAllStudents();
        });

        function GetAllStudents() {
            $.ajax({
                url: 'http://localhost:8080/ws_declarationsIndiv',
                type: "GET",
                dataType: "json",
                contextType: 'application/json',
                success: function (data) {

                    $.each(data, function (key, value) {
                        var jsonData = JSON.stringify(value);
                        var objData = $.parseJSON(jsonData);
                        var id = objData.codeHabitation;
                        var prop = objData.proprietaire;
                        var adress = objData.adresse;

                        $('<li>' + id + '-' + prop +
                            '-' + adress + '</li>').appendTo('#declarations');
                    });
                }, error: function (errorMsg) {
                    alert(errorMsg.responseText);
                }
            });
        }
    </script>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h1>All Déclarations</h1>
    <div class="row">
        <div class="col-md-12">
            <ol class="breadcrumb">
                <li><a href="#">Dashboard</a></li>
                <li class="active">Declarations</li>
            </ol>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="true" OnPreRender="GridView_PreRender"
                CssClass="table table-striped">
                <Columns>
                    <asp:HyperLinkField DataTextField="" DataNavigateUrlFields="Code" 
                        DataNavigateUrlFormatString="~/About.aspx?Id={0}" Text="Edit" HeaderText="" />
                </Columns>
                <Columns>
                    <asp:HyperLinkField DataTextField="" DataNavigateUrlFields="Code" 
                        DataNavigateUrlFormatString="~/About?Id={0}" Text="Delete" HeaderText="" />
                </Columns>
            </asp:GridView>
        </div>
    </div>

</asp:Content>
