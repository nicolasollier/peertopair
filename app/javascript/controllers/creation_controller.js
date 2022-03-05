import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
    const when = document.querySelectorAll(".when")

    when.forEach((elt) => {
      this.when(elt)

    })

    const month = document.querySelectorAll(".month")

    month.forEach((elt) => {
      this.month(elt)

    })

  };

  when(elt) {

    elt.addEventListener("click", (event) => {
      // do something on click of an element
      const screen_1 = event.target.value
      console.log(screen_1)

      if (screen_1 === 'today') {
        const date = 1
        console.log("go to screen 3 !")

      } else if (screen_1 === 'week') {
        console.log("go to screen 2 !")

      } else {
        console.log("go to screen 1 !")

      }
    })

  }

  month(elt) {

    elt.addEventListener("click", (event) => {
      // do something on click of an element
      const screen_1 = event.target.value
      console.log(screen_1)

      if (screen_1 === 'today') {
        const date = 1
        console.log("go to screen 3 !")

      } else if (screen_1 === 'week') {
        console.log("go to screen 2 !")

      } else {
        console.log("go to screen 1 !")

      }
    })

  }

}
