<!DOCTYPE html>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<link href="/resources/infra/css/bootstrap/bootstrap.css" rel="stylesheet" type="text/css">
<link href="/resources/infra/css/bootstrap/bootstrap-responsive.css" rel="stylesheet" type="text/css">
<link href="/resources/googlemap/css/main.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="/resources/infra/js/jquery/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="/resources/googlemap/js/googlemap.js"></script>
<script type="text/javascript" src="https://maps.google.com/maps/api/js?sensor=false"></script>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?libraries=places&sensor=false"></script>
<script src='${jsHost}'></script>

<script type="text/javascript">

    $(document).ready(function(){
        initialize();

        window.navigator.listen(function() {

        });

        $('.close').click(function(){
            intentClose();
        });

        $('#postButton').click(function(){
            sendMap();
        });


    });

    function intentClose(){
        window.close();
        //POP.Activity.stopActivity();
    }
</script>

</head>

<body>
<div class="background"></div>
<div class="modal" id="myModal">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">x</button>
        <h3> google MAP - Webintents</h3>
    </div>
    <div class="modal-body" style="height: 500px">
        <div class="well form-search">
            <input type="text" class="input-large" id="mapSearch" style="width: 80%">
            <button class="btn btn-primary" id="postButton">Post</button>
        </div>
        <div id="map_canvas" style="width: 100%; height: 60%"></div>
    </div>
    <div class="modal-footer">
    </div>
</div>
</body>
</html>