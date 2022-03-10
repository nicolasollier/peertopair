import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    const map = this.map = new mapboxgl.Map({
      container: this.element,
      width: '900px',
      height: '900px',
      style: "mapbox://styles/mapbox/streets-v10"
    })

    function rotateCamera(timestamp) {
      // clamp the rotation between 0 -360 degrees
      // Divide timestamp by 100 to slow rotation to ~10 degrees / sec
      map.rotateTo((timestamp / 600) % 360, { duration: 0 });
      // Request the next frame of the animation.
      requestAnimationFrame(rotateCamera);
    }

    this.#addMarkersToMap()
    this.#fitMapToMarkers()
    rotateCamera(0);

    this.element.parentNode.classList.add("fold")
    this.element.parentNode.classList.add("hide")
  }



  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      console.log(marker)
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
    });
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 14, duration: 0,pitch: 70, bearing:100})
  }

}
