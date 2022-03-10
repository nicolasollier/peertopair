import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { userId: Number }
  static targets = [ "alert", "content" ]

  connect() {
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
    const selectedCard = document.getElementById(data.event_id);

    if (data.event_status === "canceled") {
      selectedCard.remove()
    }

    if (data.event_status === "paired") {
      console.log('on y est presque')
      console.log(data.card_content)
      console.log(selectedCard)
      selectedCard.outerHTML = data.card_content
    }

    setTimeout(() => this.reset(), 5000)


  }
}
