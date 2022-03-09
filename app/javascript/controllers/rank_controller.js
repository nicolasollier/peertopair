import { Controller } from "@hotwired/stimulus"
import { csrfToken } from "@rails/ujs"
import Sortable from "sortablejs"

export default class extends Controller {
  static targets = ["submit", "venueRanking", "result", "element"]

  connect() {

    console.log(this.element)
    if (this.resultTarget) {

      Sortable.create(this.element, {
        ghostClass: "ghost",
        animation: 150,
        onEnd: this.rank.bind(this)
      })
    }
    this.rank()
  }

  rank() {
    // const this.elementTarget = document.querySelectorAll(".result-this.elementTarget p")
    const ranking = Array.from(this.elementTargets).map(item => item.outerText).join(',')
    this.venueRankingTarget.value = JSON.stringify(ranking)
    console.log(this.elementTarget.innerText)
    console.log(ranking)
    console.log(this.elementTarget)
  };
}
