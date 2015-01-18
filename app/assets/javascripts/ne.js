var ne = {

    render: {
        draw_point: function(coords, radius) {
            radius = typeof radius !== 'undefined' ? radius : 50;

            float_coords = coords.map(function(i) {
                return parseFloat(i)
            })

            var circle = L.circle(float_coords, radius, {
                color: 'red',
                fillColor: '#f03',
                fillOpacity: 0.5
            }).addTo(map);
        },

        draw_circle: function (coords) {
          ne.render.draw_point(coords, 500);
        },

        draw_polygon: function (coords) {
          var polygon = L.polygon(coords).addTo(map);
        }
    }
};
