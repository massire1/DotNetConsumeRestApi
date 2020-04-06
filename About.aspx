<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="WebApplication4.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <h1>Edit Déclaration</h1>
    <div class="row">
        <div class="col-md-12">
            <ol class="breadcrumb">
                <li><a href="#">Dashboard</a></li>
                <li class="active">Edit</li>
            </ol>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <!--<form id="form1" runat="server">-->
                <div class="form-group row align-items-center">
                    <label for="colFormLabelSm"
                        class="col-sm-3 col-form-label col-form-label-sm text-right">
                        Code</label>
                    <div class="col-sm-1">
                        <asp:TextBox ID="codeHabitation" runat="server" Class="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row align-items-center">
                    <label for="colFormLabelSm" class="col-sm-3 col-form-label col-form-label-sm text-right">Propriétaire</label>
                    <div class="col-sm-4">
                        <asp:TextBox ID="proprietaire" runat="server" Class="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row align-items-center">
                    <label for="colFormLabelSm" class="col-sm-3 col-form-label col-form-label-sm text-right">Adresse</label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="adresse" runat="server" Class="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row align-items-center">
                    <label for="colFormLabelSm" class="col-sm-3 col-form-label col-form-label-sm text-right">Surface</label>
                    <div class="col-sm-2">
                        <asp:TextBox ID="surface" runat="server" Class="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row align-items-center">
                    <label for="colFormLabelSm" class="col-sm-3 col-form-label col-form-label-sm text-right">Nombre Pièces</label>
                    <div class="col-sm-1">
                        <asp:TextBox ID="nbrPiece" runat="server" Class="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row align-items-center">
                    <div class="col-sm-4 col-sm-offset-3">
                        <button type="submit" class="btn btn-warning">Enregistrer</button>
                        <a href="/listDeclarations" class="btn btn-primary">Retour</a>
                    </div>
                </div>
            <!--</form>-->
        </div>
    </div>

</asp:Content>
