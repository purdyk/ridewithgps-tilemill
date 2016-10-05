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
    var height = $(document).height();
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
    resize_image();
    load_image();
}

var save = function() {
    window.open(generate_url(false));
}

var register_handlers = function() {
    $("#scale").change(refresh);
    $('#do-it').click(save);
    $('#the-form').submit(false);
}

$( "document" ).ready( function() {
    register_handlers();
    refresh();
});

$( window ).resize(debounce(refresh, 250));