$(document).ready(function() {
    var portland_coords     = [45.5230622, -122.6764816],
        london_coords       = [51.505, -0.09],
        los_gorditos_coords = [45.524278, -122.680723],
        // portland_boundary   = [
        //                           [51.509, -0.08],
        //                           [51.503, -0.06],
        //                           [51.51, -0.047]
        //                       ];

    initmap();
    map.setView(portland_coords, 13);
    // map.setView(london_coords, 13);

    function draw_point(coords, radius) {
        radius = typeof radius !== 'undefined' ? radius : 50;

        var circle = L.circle(coords, radius, {
            color: 'red',
            fillColor: '#f03',
            fillOpacity: 0.5
        }).addTo(map);
    }

    function draw_circle(coords) {
      draw_point(coords, 500);
    }

    function draw_polygon(coords) {
      var polygon = L.polygon(coords).addTo(map);
    }

    draw_point(los_gorditos_coords);
    // draw_polygon(portland_boundary);
});