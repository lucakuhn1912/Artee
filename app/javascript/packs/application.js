import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import "jquery-bar-rating/dist/themes/css-stars.css";
import mapboxgl from 'mapbox-gl';



const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });
    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {
      let popup = new mapboxgl.Popup({ offset: 25 })
        .setHTML(`
          <div class="d-flex justify-content-start align-items-center">
            <img src="${marker.img}" width=50 height=50 class="mr-2"/>
            <p class="m-0">${marker.name} (£${marker.price})</p>
          </div>
          `);

      new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
      fitMapToMarkers(map, markers);
    });
  }
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};
initMapbox();
