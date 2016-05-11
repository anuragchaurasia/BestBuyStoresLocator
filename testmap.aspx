<%@ Page Language="C#" AutoEventWireup="true" CodeFile="testmap.aspx.cs" Inherits="testmap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Surroundings Checker</title>
    <script src="http://maps.googleapis.com/maps/api/js"></script>
    <script src="jquery.min.js"></script>
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>
    <link href="grid-0.5.6.min.css" rel="stylesheet" />
    <script src="grid-0.5.6.min.js"></script>
    <script src="bootstrap.min.js"></script>
    <link href="bootstrap.min.css" rel="stylesheet" />
    <link href="bootstrap-theme.min.css" rel="stylesheet" />
    <script src="jquery.ddslick.min.js"></script>
    <script type="text/javascript">
        var lat1 = 35.759573, lon1 = -79.019300;
        function initialize() {
            setStartLocation(lat1, lon1);
        }
        var map;
        function setStartLocation(startlat, startlon) {
            var myLatlng = new google.maps.LatLng(startlat, startlon);
            var mapOptions = {
                zoom: 2,
                center: myLatlng
            }
            map = new google.maps.Map(document.getElementById("googleMap1"), mapOptions);
        }
        google.maps.event.addDomListener(window, 'load', initialize);

        $(document).ready(function () {
            $('#getplaces').click(function () {
                $.ajax({
                    type: 'GET',
                    url: "http://api.bestbuy.com/v1/stores(area(" + $('#startlocation').val() + "," + $('#distance').val() + "))?format=json&apiKey=vpcyah5qsnbhu2naprmedpxr",
                    contentType: 'application/json; charset=UTF-8',
                    dataType: 'json',
                    async: false,
                    success: function (msg) {
                        $(msg.stores).each(function () {
                            var infowindow = new google.maps.InfoWindow({
                                content: '<b>' + $(this)[0].longName + '</b></br>' + $(this)[0].address
                            });
                            myLatLng = { lat: $(this)[0].lat, lng: $(this)[0].lng };
                            var marker = new google.maps.Marker({
                                position: myLatLng,
                                map: map,
                                title: $(this)[0].longName
                            });
                            marker.addListener('click', function () {
                                infowindow.open(map, marker);
                            });
                        });

                    },
                    error: function (msg) {
                    }
                });
            });

        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">
                    
                </a>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <div class="panel panel-login">
                    <!-- <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-6">
                                <a href="#" id="login-form-link">Surrounding Finder</a>
                            </div>
                        </div>
                        <hr>
                    </div>-->
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <form id="login-form" method="post" role="form" style="display: block;">
                                    <div class="form-group">
                                        <input type="text" id="startlocation" tabindex="1" class="form-control" placeholder="Enter zip code" required="required" />
                                    </div>
                                    <div class="form-group">
                                        <input type="text" name="distance" id="distance" tabindex="2" class="form-control" placeholder="Enter Distance (in miles)" required="required" />
                                    </div>
                                    <hr />
                                    <div class="form-group">
                                        <button type="button" class="btn btn-success center-block" tabindex="3" id="getplaces">
                                            Get Place Data
                                        </button>
                                    </div>
                                    <hr />
                                    <div class="form-group">
                                        <div id="googleMap1" class="mapdata" style="width: 525px; height: 300px;"></div>
                                    </div>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="types" value="restaurant" />
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Location Details</h4>
                </div>
                <div class="modal-body">
                    <div id="surroundings" class="gj-grid-table table table-bordered table-hover">
                        <table class="table table-bordered" id="surround">
                            <thead>
                                <tr>
                                    <th class="gj-grid-bootstrap-thead-cell" style="text-align: left;">
                                        <div style="float: left">Name</div>
                                    </th>
                                    <th class="gj-grid-bootstrap-thead-cell" style="text-align: left;">
                                        <div style="float: left">Vicinity</div>
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                            <tr data-role="empty">
                                <td style="width: 100%; text-align: center;" colspan="2">
                                    <div>&nbsp;</div>
                                </td>
                            </tr>
                            <tr data-role="empty">
                                <td style="width: 100%; text-align: center;" colspan="2">
                                    <div>&nbsp;</div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="navbar navbar-default navbar-fixed-bottom">
        <div class="container">
            <p class="navbar-text pull-left">
                © 2016 
           <a href="#" target="_blank"></a>
            </p>

           
        </div>


    </div>

    </form>
</body>
</html>
