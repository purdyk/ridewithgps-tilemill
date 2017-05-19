var load_image = function() {
    var image = $("#output");
    var newImg = $("<img/>");

    newImg.on( "load", function() {
        image.attr("src", $(this).attr("src"));
    });

    image.attr("src", "/static/clear.gif");
    newImg.attr("src", generate_url(true));
}

var resize_image = function() {
    var image = $("#output");
    var width = $('#img-holder').width();
    var height = width / float('#aspect');
    image.attr('width', width);
    image.attr('height', height);
}

var generate_url = function(live) {
    var image = $("#output");
    var things = []
    $("input").each(function(index, item) {
        if (item.value.length) {
            var push = true;
            if (live) {
                if (item.id === 'height')
                    push = false;

                if (item.id === 'width')
                    push = false;
            } else {
                if (item.id === 'height' || item.id === 'width') {
                    push = false;
                    things.push(item.id + "=" + item.value * 300);
                    }
            }

            if (push)
                things.push(item.id + "=" + item.value);

        }
    });

    if (live) {
        things.push("width=" + image.width());
        things.push("height=" + image.height());
    } else {
        things.push("save=true")
    }

    return "/output.png?" + things.join("&");
}

var debounce = function(fun, mil) {
    var timer;
    return function(){
        clearTimeout(timer);
        timer = setTimeout(function(){
            fun();
        }, mil);
    };
}

var refresh = function() {
    calculate_aspect();
    resize_image();
    load_image();
}

var save = function() {
    window.open(generate_url(false));
}

var float = function(id) {
    return parseFloat($(id).val())
}

var calculate_aspect = function() {
    ratio = calculate_ratio(float('#north'), float('#west'),
                            float('#south'), float('#east'));

    $('#aspect').val(ratio);

    if (ratio >= 1) {
        $('#height').attr('disabled', true);
        $('#width').attr('disabled', false);

        $('#height').val(float('#width') / ratio);

    } else {
        $('#height').attr('disabled', false);
        $('#width').attr('disabled', true);

        $('#width').val(float('#height') * ratio);
    }
}

var calculate_ratio = function(lat1, lng1, lat2, lng2) {
    return width_in_meters(lat1, lng1, lat2, lng2) / height_in_meters(lat1, lng1, lat2, lng2);
}

var height_in_meters = function(lat1, lng1, lat2, lng2) {
    lng_mid = (lng1 + lng2) / 2;
    return haversine(lat1, lng_mid, lat2, lng_mid);
}

var width_in_meters = function(lat1, lng1, lat2, lng2) {
    lat_mid = (lat1 + lat2) / 2;
    return haversine(lat_mid, lng1, lat_mid, lng2);
}

var haversine = function(lat1, lng1, lat2, lng2) {
    var HAVERSINE_RADS_PER_DEGREE = 0.0174532925199433;
    var HAVERSINE_METERS_PER_RAD = 6371000.0;
    var lat1Rad = lat1 * HAVERSINE_RADS_PER_DEGREE;
    var lat2Rad = lat2 * HAVERSINE_RADS_PER_DEGREE;
    var dLonRad = ((lng2 - lng1) * HAVERSINE_RADS_PER_DEGREE);
    var dLatRad = ((lat2 - lat1) * HAVERSINE_RADS_PER_DEGREE);
    let c =
            Math.pow(Math.sin(dLatRad / 2), 2) + Math.cos(lat1Rad) * Math.cos(lat2Rad) * Math.pow(Math.sin(dLonRad / 2), 2);
        return HAVERSINE_METERS_PER_RAD * (2 * Math.atan2(Math.sqrt(c), Math.sqrt(1 - c)));

//    var lat_diff = lat1 - lat2;
//    var lng_diff = lng1 - lng2;
//    var radius = 6378100.0;
//    var lat_tmp = Math.sin(lat_diff / 2);
//    var lng_tmp = Math.sin(lng_diff / 2);
//    var a = lat_tmp*lat_tmp + Math.cos(lat1) * Math.cos(lat2) * lng_tmp*lng_tmp;
//    var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
//    return radius * c;
}

var register_handlers = function() {
    $('#scale').change(refresh);
    $('#do-it').click(save);
    $('#the-form').submit(false);
    $('#width').change(calculate_aspect)
    $('#height').change(calculate_aspect)
}

$( "document" ).ready( function() {
    register_handlers();
    refresh();
});

$( window ).resize(debounce(refresh, 250));