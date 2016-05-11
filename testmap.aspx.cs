using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class testmap : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        WebClient webc = new WebClient();
        string abc= webc.DownloadString("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=3.1694209,101.76328799999999&radius=1500&type=restaurant&key=%20AIzaSyBhusnbQYyCWcoUG34VnH3UgbwVu_lorDw");
    }
}