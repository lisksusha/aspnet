<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Listing.aspx.cs" Inherits="WebApplication1.Pages.Listing"  %>
<%@ Import Namespace="System.Web.Routing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>WebApplication1</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <%
            foreach (WebApplication1.Models.Game game in GetGames())
            {
                Response.Write(String.Format(@"
                        <div class='item'>
                            <h3>{0}</h3>
                            {1}
                            <h4>{2:c}</h4>
                            <button name='add' type='submit' value='{3}'>
                                Добавить в корзину
                            </button>
                        </div>",
                    game.Name, game.Description, game.Price, game.GameId));
            }
        %>
    </div>
   </form>
    <div class="pager">
        <%
            for (int i = 1; i <= MaxPage; i++)
            {
                string category = (string)Page.RouteData.Values["category"]
                    ?? Request.QueryString["category"];
                
                string path = RouteTable.Routes.GetVirtualPath(null, null,
                    new RouteValueDictionary() { {"category", category}, { "page", i } }).VirtualPath;
                Response.Write(
                    String.Format("<a href='{0}' {1}>{2}</a>",
                        path, i == CurrentPage ? "class='selected'" : "", i));
            }
        %>
    </div>
</body>
</html>