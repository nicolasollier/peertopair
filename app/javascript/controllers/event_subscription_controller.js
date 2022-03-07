import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { eventId: Number }
  static targets = ["status"]

  connect() {
    console.log(`Subscribe to the chatroom with the id ${this.eventIdValue}.`)
  }
}
