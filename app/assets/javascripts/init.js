
$(document).ready(function() {

    var DEFAULT_ZOOM = 7;

    var pdx_geo_center_coords    = [45.5230622, -122.6764816],
        london_geo_center_coords = [51.505, -0.09],
        pdx_los_gorditos_coords  = [45.524278, -122.680723];

    $.getJSON( "wkt/pdx.json", function( data ) {
        var points = data.points;

        // ne.render.draw_multi_point(points);
        ne.render.draw_polygon(points);
    });


    initmap();
    map.setView(pdx_geo_center_coords, DEFAULT_ZOOM);

    // ne.render.draw_point(los_gorditos_coords);
});