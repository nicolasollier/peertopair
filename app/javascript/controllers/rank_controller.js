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
    this.rank()
  }

  rank() {
    // evt.preventDefault()
    const list = document.querySelectorAll(".result-list p")
    const input = document.querySelector("#venue_rankings_ranking")
    const ranking = Array.from(list).map(item => item.innerText).join(',')
    input.value = JSON.stringify(ranking)
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
