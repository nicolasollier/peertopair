import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "panel" ]

  connect() {
  };

  toggle(evt) {
    this.panelTarget.classList.toggle('active')
    this.panelTarget.classList.toggle('inactive')
  }
}