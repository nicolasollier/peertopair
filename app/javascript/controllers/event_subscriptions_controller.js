import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { userId: Number }

  connect() {
    this.channel = consumer.subscriptions.create(
      { channel: "EventChannel", id: this.userIdValue },
      { received: data => console.log(data) }
    )
    console.log(`Subscribed to the event with the id ${this.userIdValue}.`)
  }
}
