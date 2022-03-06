
const when = document.querySelectorAll(".when")
const month = document.querySelectorAll(".month")
const week = document.querySelectorAll(".week")
const day = document.querySelectorAll(".day")
let deltaDay = 0;

  function thisWhen(elt) {
    console.log('when')

    elt.addEventListener("click", (event) => {

      const screen_1 = event.target.value

      switch (screen_1) {
        case 'today':
          deltaDay = 0
          onOff(elt,when, day)
          break;

        case 'week':
          onOff(elt,when, week)
          break;

        case 'month':
          onOff(elt,when, month)
          break;

      }
    })
  }

  function thisMonth(elt) {

    elt.addEventListener("click", (event) => {
      console.log(elt)

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

      onOff(elt,month, week)
    })
  }

  function thisWeek(elt) {

    elt.addEventListener("click", (event) => {
      const today = new Date().getDay();
      const screen_3 = elt.value
      let delta = 0
      console.log(elt)

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
      onOff(elt,week, day)
    })
  }

  function thisDay(elt) {

    elt.addEventListener("click", (event) => {
      console.log(deltaDay)
      const screen_4 = elt.value

      switch (screen_4) {
        case 'today':
          onOff(elt,when, day)
          break;

        case 'week':
          onOff(elt,when, week)
          break;

        case 'month':
          onOff(elt,when, month)
          break;

        default:
          break;
      }
    })
  }


  function onOff(elt, commingFrom, goingTo) {

    commingFrom.forEach((elt) => elt.style.display = "none")
    goingTo.forEach((elt) => elt.style.display = "")

  }

  when.forEach((elt) => {
    thisWhen(elt)
  })

  month.forEach((elt) => {
    thisMonth(elt)
  })

  week.forEach((elt) => {
    thisWeek(elt)
  })

  day.forEach((elt) => {
    thisDay(elt)
  })
