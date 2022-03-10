import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { userId: Number }
  static targets = [ "alert", "content" ]

  connect() {
    console.log(this.hasTotoTarget)
    this.channel = consumer.subscriptions.create(
      { channel: "EventChannel", id: this.userIdValue },
      // { received: data => console.log(data) }
      { received: (data) => {
        this.#displayAlert(data)
        // window.location.reload()
        console.log(data.event_status)
        console.log(data.event_id)
      }
      },
    )
  }

  disconnect() {
    this.channel.unsubscribe()
  }

  reset() {
    this.contentTarget.remove()
    this.alertTarget.classList.add("now-you-don-t")
  }

  #displayAlert(data) {
    this.alertTarget.insertAdjacentHTML("beforeend", data.alert);
    this.alertTarget.classList.remove("now-you-don-t");
    if (data.event_status === "canceled") {
      const destroy = document.getElementById(data.event_id);
      console.log(destroy);
      destroy.remove()
    }
    setTimeout(() => this.reset(), 5000)
  }
}
