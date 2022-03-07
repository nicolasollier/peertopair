import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { eventId: Number }
  static targets = ["status"]

  connect() {
    this.channel = consumer.subscriptions.create(
      { channel: "EventChannel", id: this.eventIdValue },
      { received: data => console.log(data) }
    )
    console.log(`Subscribed to the event with the id ${this.eventIdValue}.`)
  }
}
