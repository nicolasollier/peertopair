import { Controller } from "@hotwired/stimulus"
import { csrfToken } from "@rails/ujs"
import Sortable from "sortablejs"

export default class extends Controller {
  static target = ["submit", "venueRanking"]

  connect() {
    const list = document.querySelector("#results")
    console.log(this.venueRankingTarget)
    if (list) {
      Sortable.create(this.element, {
        ghostClass: "ghost",
        animation: 150,
        onEnd: this.rank.bind(this)
      })
    }
  }

  rank() {
    // evt.preventDefault()
    const list = document.querySelectorAll(".result-list p")
    const input = document.querySelectorAll("#event_venue_rankings")
    const ranking = Array.from(list).map(item => item.innerText).join(',')
    input[0].value = JSON.stringify(ranking)
    // const form = new FormData
    // form.append('event[ranking]', ranking)

    // fetch(`/events/${5}/venue_rankings`, {
    //   method: "POST",
    //   headers: { "Accept": "application/json", "X-CSRF-Token": csrfToken() },
    //   body: form
    // })
    // list.forEach((item) => {
    //   console.log(item.innerText);
    // });
  };
}
