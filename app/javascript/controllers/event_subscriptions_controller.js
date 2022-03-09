import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { userId: Number }
  static targets = [ "alert", "content" ]

  connect() {
    this.channel = consumer.subscriptions.create(
      { channel: "EventChannel", id: this.userIdValue },
      // { received: data => console.log(data) }
      { received: data =>
        this.#displayAlert(data)
      },
    )
  }

  reset() {
    this.contentTarget.remove()
    this.alertTarget.classList.add("now-you-don-t")
  }

  #displayAlert(data) {
    this.alertTarget.insertAdjacentHTML("beforeend", data)
    this.alertTarget.classList.remove("now-you-don-t")
    // setTimeout(() => this.reset(), 4000)
  }
}
