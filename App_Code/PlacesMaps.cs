using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Services;

/// <summary>
/// Summary description for PlacesMaps
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class PlacesMaps : System.Web.Services.WebService
{

    public PlacesMaps()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string GetSurroundings(string lat, string lon, string type, string radius)
    {
        WebClient webc = new WebClient();
        string surroundings = webc.DownloadString("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=" + lat + "," + lon + "&radius=" + radius + "&type=" + type + "&key=%20AIzaSyBhusnbQYyCWcoUG34VnH3UgbwVu_lorDw");
        return surroundings;
    }

}
