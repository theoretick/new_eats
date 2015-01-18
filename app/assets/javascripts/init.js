
$(document).ready(function() {

    var portland_coords     = [45.5230622, -122.6764816],
        london_coords       = [51.505, -0.09],
        los_gorditos_coords = [45.524278, -122.680723];

    $.getJSON( "wkt/test.json", function( data ) {
        var points = data.points;

        for (i = 0, j = points.length; i < j; i++) {
            var split_points = points[i].split(',');
            var lat = split_points[0];
            var lng = split_points[1];

            ne.render.draw_point([lat, lng]);
        };
        // ne.render.draw_polygon(data.points);
    });


    initmap();
    map.setView(portland_coords, 13);

    // ne.render.draw_point(los_gorditos_coords);
});