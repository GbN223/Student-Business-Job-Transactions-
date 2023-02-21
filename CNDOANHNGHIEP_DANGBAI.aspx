<%@ Page Title="" Language="C#" MasterPageFile="~/DoanhNghiep_Master.Master" AutoEventWireup="true" CodeBehind="CNDOANHNGHIEP_DANGBAI.aspx.cs" Inherits="NCKH.CNDOANHNGHIEP_DANGBAI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script>
  document.getElementById("bold-btn").addEventListener("click", function() {
    document.execCommand("bold", false, null);
  });
  
  document.getElementById("italic-btn").addEventListener("click", function() {
    document.execCommand("italic", false, null);
  });
    </script>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td>
                
  <div class="form-group">
    <textarea class="form-control" rows="5" id="editor"></textarea>
  </div>
  <div class="form-group">
    <button type="button" class="btn btn-primary" id="bold-btn">
      <i class="fas fa-bold"></i> Bold
    </button>
    <button type="button" class="btn btn-primary" id="italic-btn">
      <i class="fas fa-italic"></i> Italic
    </button>
  </div>
</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
