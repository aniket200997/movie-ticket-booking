<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Movie.aspx.cs" Inherits="Movie" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div id="comments" style="width: 70%; float:left; margin-right:30px">
      <h2>Add Movie</h2>
            <div>
                <label for="email">Movie Name<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="movie_name" ErrorMessage="Plzz enter movie name"></asp:RequiredFieldValidator>
                </span></label>
                <asp:TextBox ID="movie_name" runat="server"></asp:TextBox>
            </div>
            <div>
                <label for="email">Movie Image<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="movie_image" ErrorMessage="Plz fill movie image"></asp:RequiredFieldValidator>
                </span></label>
                <asp:FileUpload ID="movie_image" runat="server" /> 
            </div>
            <div>
                <label for="email">Select Certificate<span>*</span></label>
                <asp:DropDownList ID="movie_certificate_id" runat="server" CssClass="select-box" style="width:300px;" required></asp:DropDownList>
            </div>
            <div>
                <label for="email">Trailer URL<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="movie_trailer_url" ErrorMessage="Plzz enter movie url"></asp:RequiredFieldValidator>
                </span></label>
                <asp:TextBox ID="movie_trailer_url" runat="server"></asp:TextBox>
            </div>
            <div>
                <label for="email">Select Language<span>*</span></label>
                <asp:DropDownList ID="movie_language_id" runat="server" CssClass="select-box" style="width:300px;"></asp:DropDownList>
            </div>
            <div>
                <label for="email">Select Movie Type<span>*</span></label>
                <asp:DropDownList ID="movie_type_id" runat="server" CssClass="select-box" style="width:300px;" required></asp:DropDownList>
            </div>
            <div>
                <label for="email">Movie Durtaion<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="movie_duration" ErrorMessage="Plzz enter movie duration"></asp:RequiredFieldValidator>
                </span></label>
                <asp:TextBox ID="movie_duration" runat="server"></asp:TextBox>
            </div>
            <div>
                <label for="email">Release Date<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="movie_release_date" ErrorMessage="Plzz enter movie release date"></asp:RequiredFieldValidator>
                </span></label>
                <asp:TextBox ID="movie_release_date" runat="server"></asp:TextBox>
            </div>
            <div>
                <label for="email">End Date<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="movie_end_date" ErrorMessage="Plzz enter movie end date"></asp:RequiredFieldValidator>
                </span></label>
                <asp:TextBox ID="movie_end_date" runat="server"></asp:TextBox>
            </div>
            <div>
                <label for="email">Director<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="movie_director" ErrorMessage="plzz specify movie directior"></asp:RequiredFieldValidator>
                </span></label>
                <asp:TextBox ID="movie_director" runat="server"></asp:TextBox>
            </div>
            <div>
                <label for="email">Castings<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="movie_cast" ErrorMessage="Plzz specify movie casting"></asp:RequiredFieldValidator>
                </span></label>
                <asp:TextBox ID="movie_cast" runat="server"></asp:TextBox>
            </div>
            <div>
                <label for="email">Description<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="movie_description" ErrorMessage="Plzz specify mvie description"></asp:RequiredFieldValidator>
                </span></label>
                <asp:TextBox ID="movie_description" runat="server" sTextMode="MultiLine"></asp:TextBox>
            </div>
            <div>
                <asp:TextBox ID="movie_id" runat="server" Visible="False"></asp:TextBox>
                <asp:TextBox ID="upload_picture" runat="server" Visible="False"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="Save Movie" onclick="save_data_Click" />
            </div>
        </div>
    </main>
  </div>
</div>
</asp:Content>

