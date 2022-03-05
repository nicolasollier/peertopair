import { Controller } from "@hotwired/stimulus"
const when = document.querySelectorAll(".when")
const month = document.querySelectorAll(".month")
const week = document.querySelectorAll(".week")
const day = document.querySelectorAll(".day")
let deltaDay = 0;


  connect() {

    when.forEach((elt) => {
      this.when(elt)
    })

    month.forEach((elt) => {
      this.month(elt)
    })

    week.forEach((elt) => {
      this.week(elt)
    })

    day.forEach((elt) => {
      this.day(elt)
    })

  };

  when(elt) {
    console.log('when')

    elt.addEventListener("click", (event) => {

      const screen_1 = event.target.value

      switch (screen_1) {
        case 'today':
          deltaDay = 0
          this.onOff(elt,when, day)
          break;

        case 'week':
          this.onOff(elt,when, week)
          break;

        case 'month':
          this.onOff(elt,when, month)
          break;

      }
    })
  }

  month(elt) {

    elt.addEventListener("click", (event) => {
      console.log('month')

      const screen_2 = elt.value

      switch (screen_2) {
        case 'week_2':
          console.log(deltaDay)
          deltaDay += 7
          console.log(deltaDay)
          break;

        case 'week_3':
          console.log(deltaDay)
          deltaDay += 14
          console.log(deltaDay)
          break;

        case 'week_4':
          console.log(deltaDay)
          deltaDay += 21
          console.log(deltaDay)
          break;
      }

      this.onOff(elt,month, week)
    })
  }

  week(elt) {

    elt.addEventListener("click", (event) => {
      const today = new Date().getDay();
      const screen_3 = elt
      let delta = 0
      console.log(screen_3)

      switch (screen_3) {
        case 'mon':
          delta = 1
        break;

        case 'tue':
          delta = 2
          break;

        case 'wed':
          delta = 3
        break;

        case 'thu':
          delta = 4
        break;

        case 'fri':
          delta = 5
        break;
      }

      console.log(deltaDay)
      deltaDay += delta - today
      console.log(deltaDay)
      this.onOff(elt,week, day)
    })
  }

  day(elt) {

    elt.addEventListener("click", (event) => {
      console.log(deltaDay)
      const screen_4 = elt.value

      switch (screen_4) {
        case 'today':
          this.onOff(elt,when, day)
          break;

        case 'week':
          this.onOff(elt,when, week)
          break;

        case 'month':
          this.onOff(elt,when, month)
          break;

        default:
          break;
      }
    })
  }


  onOff(elt, commingFrom, goingTo) {

    commingFrom.forEach((elt) => elt.style.display = "none")
    goingTo.forEach((elt) => elt.style.display = "")

  }
export default class extends Controller {

}
