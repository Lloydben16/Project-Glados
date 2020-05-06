<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommentWebForm.aspx.cs" Inherits="Project_Glados_master.CommentWebForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
	<style>

	.div1 {float: left;}
	
	input[type=text]{
		height: 30px;
		width: 25%;
		border: none;
		background-color:DarkOrange;
		color: Black;
		}

	    input[type=password] {
	        height: 30px;
			width: 25%;
			border: none;
			background-color:DarkOrange;
			color: Black;
	    }
	</style>

<title>Project Glados Login Page</title>
</head>

<body style="background-color:#181818;">



<div class="div1">
        <img src="https://www.publicdomainpictures.net/pictures/260000/velka/portal.jpg" alt="Aperture Programming" width="150" height="150"/>
    </div>

	<div style="text-align:center; color:RoyalBlue">
	<h1>Aperture Programming</h1>
	<h2>Project Glados</h2>
	<h3>Login</h3>
	<br/>
	
	</div>

	<div style="text-align:right">
	</div>
	<br/>
	<br/>

	<form runat ="server">
		<div style="color:RoyalBlue">
			<h3> Request Game </h3>
			<label for="title">Rating:</label>
			<br/>
			<asp:TextBox ID="rating"  placeholder="Rating" runat = "server"></asp:TextBox>
			<br/>
			<br/>
			<label for="price">Comment:</label>
			<br/>
			<asp:TextBox  ID="comment"  placeholder="Comment" runat = "server"></asp:TextBox>
			<br/>
			<br/>
			<asp:Button ID ="CommentGame" runat ="server" OnClick="CommentGame_Click" Text ="Submit" style ="background-color: DarkOrange; text-align:center; color: black; cursor: pointer; border: none;"/>
		</div>
	</form>
</body>
</html>

