<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>Melon App</title>
    <link href="/resources/infra/css/bootstrap/bootstrap.css" rel="stylesheet" type="text/css">
</head>
<body data-spy="scroll" data-target=".modal-body">
<!-- Modal[s] -->
<div id="melon" class="modal hide fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h3 id="myModalLabel">Melon Selector</h3>
    </div>
    <div class="modal-body" style="text-align: center">
        <div class="control-group success">
            <input class="span6 melonSearchInput" id="inputSuccess" type="text" style="height: 30px; font-size: 20px;">
        </div>
        <div id="melonSearchResult" style="text-align: left; margin-left: 20px;">
        </div>
    </div>
    <div class="modal-footer">
    </div>
</div>
<!-- Modal[e] -->

<script type="text/javascript" src="/resources/infra/js/jquery/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="/resources/infra/js/bootstrap/bootstrap.js"></script>
<script type="text/javascript">

    var search;
    var result;

    $(document).ready(function() {
        $('#melon').modal('show');
    });

    $('.melonSearchInput').keyup(function(){
        search = $('.melonSearchInput').val();
        if(search !== "") {
            $('#melonSearchResult').empty();
            melonSearch(search);
        }
    });

    $('.modal-body').scroll(function(){
        if( ($('.control-group').height() + $('#melonSearchResult').height() - $('.modal-body').height()) < $('.modal-body').scrollTop() ) {
            melonApi.page += 1;
            melonSearch();
        }

    });

    // Melon Search API 호출
    var melonSearch = function(search) {
        $.getJSON('http://1.234.90.172:9007?search=' + search, function(data){

            for(i in data) {
                var inHTML = "<div onclick=\"intentSong(" + data[i].id + ")\" style='cursor: pointer;'><i class=\"icon-music\"></i>&nbsp; "
                        + "<span class='songName'>"
                        + data[i].title
                        + "</span>"
                        + " - "
                        + "<span class='artistName'>"
                        + data[i].artistname
                        + "</span>"
                        + "</div><hr>";

                $('#melonSearchResult').append(inHTML);
            }
        });
    }

    // 노래 선택시 인텐트 보낼 내용
    var intentSong = function(id) {
        window.open('http://music.bugs.co.kr/newPlayer?trackId=' + id, '_blank', 'width=384 height=667 menubar=no status=no');
    }
</script>
</body>
</html>