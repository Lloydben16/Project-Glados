<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConfirmDelete.aspx.cs" Inherits="Project_Glados_master.ConfirmDelete" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<style>

	.your-element{
		overflow-y:scroll;
		}

	.div1 {float: left;}

	.button{
		background-color: DarkOrange;
		text-align:center;
		color: black;
		cursor: pointer;
		border: none;
		}
	
	input[type=text]{
		height: 30px;
		width: 25%;
		border: none;
		background-color:DarkOrange;
		color: Black;
		}

	input[type=submit]{
		border: none;
		color: black;
		cursor: pointer;
		}

	</style>

<title>Project Glados Extended Results Page</title>
</head>

<body style="background-color:#181818;">

<div class="div1">
        <img src="https://www.publicdomainpictures.net/pictures/260000/velka/portal.jpg" alt="Aperture Programming" width="150" height="150"/>
    </div>

	<div style="text-align:center; color:RoyalBlue">
	<h1>Aperture Programming</h1>
	<h2>Project Glados</h2>
	<br/>

	</div>

	<br/>
	<br/>

	<div style="margin: auto; align-items: center">
        <form id="form1" runat="server">
			<div style="text-align:right">
                <div id ="BackToMain" runat ="server" >
                </div>
	            <asp:Button ID ="BtnMain" runat ="server" OnClick="BtnMain_Click" Text ="Main Page" style ="background-color: DarkOrange; text-align:center; color: black; cursor: pointer; border: none;"/>
	        </div>

			<div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectGladosDBConnectionString2 %>" SelectCommand="SELECT C.[CommentsId], U.[userName], C.[Rating], C.[Comments] FROM [Comments] C , Users U WHERE C.UserId = U.UserId AND C.IsDeleted=0"></asp:SqlDataSource>
            </div>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" Width="75%" AllowSorting="true">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="userName" HeaderText="userName" SortExpression="userName" ItemStyle-HorizontalAlign="Center"/>
                    <asp:BoundField DataField="Rating" HeaderText="Rating" SortExpression="Rating" ItemStyle-HorizontalAlign="Center"/>
					<asp:BoundField DataField="Comments" HeaderText="Comments" SortExpression="Comments" ItemStyle-HorizontalAlign="Center"/>
                </Columns>

                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>

			<div style="text-align:center">
				<h3 style="text-align:center; color:royalblue;"> Are you sure you want to delete this comment?</h3>
	            <asp:Button ID ="Button2" runat ="server" OnClick="DeleteComment" HorizontalAlign="Center" Text ="Delete" style ="background-color: DarkOrange; text-align:center; color: black; cursor: pointer; border: none;"/>
			    <asp:Button ID ="Button3" runat ="server" OnClick="Redirect" HorizontalAlign="Center" Text ="Cancel" style ="background-color: DarkOrange; text-align:center; color: black; cursor: pointer; border: none;"/>
			</div>
        </form>
    </div>
</body>
</html>
