using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Models.Repository;

namespace WebApplication1.Controls
{
    public partial class CategoryList : System.Web.UI.Page
    {
        public void Page_Load(object sender, EventArgs e)
        {

        }
        public IEnumerable<string> GetCategories()
        {
            return new Repository().Games
                .Select(p => p.Category)
                .Distinct()
                .OrderBy(x => x);
        }

        public string CreateHomeLinkHtml()
        {
            string path = RouteTable.Routes.GetVirtualPath(null, null).VirtualPath;
            return string.Format("<a href='{0}'>Главная</a>", path);
        }

        public string CreateLinkHtml(string category)
        {
            string path = RouteTable.Routes.GetVirtualPath(null, null,
                new RouteValueDictionary() { { "category", category },
                    {"page", "1"} }).VirtualPath;

            return string.Format("<a href='{0}'>{1}</a>",
                path, category);
        }
    }
}