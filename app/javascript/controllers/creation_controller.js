import dateFormat from "dateformat"

// récupération des valeurs des boutons

const init = document.querySelector("#create-event-start")
const when = document.querySelectorAll(".when")
const month = document.querySelectorAll(".month")
const week = document.querySelectorAll(".week")
const day = document.querySelectorAll(".day")
const lunch = document.querySelectorAll(".lunch")
let deltaDay = 0;
let timeSet = "";

// logique de chaque page

  function initialisation(elt) {

    elt.addEventListener("click", (init) => {

    // initialisation des variables
    deltaDay = 0;

    // réinitialisation de l'affichage
    onOff(elt, day, when)
    onOff(elt, month, when)
    onOff(elt, week, when)
    onOff(elt, day, when)
    onOff(elt, lunch, when)

    })

  }

  function thisWhen(elt) {

    elt.addEventListener("click", (event) => {

      const screen_1 = event.target.value

      switch (screen_1) {
        case 'today':
          deltaDay = 0;
          onOff(elt,when, day);
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

      deltaDay += delta - today
      onOff(elt,week, day)
    })
  }

  function thisDay(elt) {


    elt.addEventListener("click", (event) => {
      const screen_4 = elt.value

      switch (screen_4) {
        case 'coffee':
          onOff(elt,day, coffee)
          break;

        case 'lunch':
          onOff(elt,day, lunch)
          break;

        case 'drink':
          onOff(elt,day, drink)
          break;

        default:
          break;
      }

      calculateDisplayDay(deltaDay);
    })
  }

  function thisLunch(elt) {



  }

  // Fonctions additionnelles


  function addDays(date, days) {
    var result = new Date(date);
    result.setDate(result.getDate() + days);
    return result;
  }

  function onOff(elt, commingFrom, goingTo) {

    commingFrom.forEach((elt) => elt.style.display = "none")
    goingTo.forEach((elt) => elt.style.display = "")

  }

  function calculateDisplayDay(deltaDay) {
    // calculates the day
    const dayOut = addDays(new Date(), deltaDay)
    console.log(dayOut);

    // display the day on the page
    const displayDay = document.getElementById("day-out")
    let options = {weekday: "long", year: "numeric", month: "long", day: "numeric"};

    const dayString = dayOut.toLocaleDateString("en-US", options);

    displayDay.insertAdjacentHTML("beforeend", dayString)

        //
    // TEST AFFICHAGE
    //
    timeSet = document.getElementById("time-set")
    const dayOutToHtml = `${dateFormat(dayOut, "yyyy-mm-dd")}T${timeSet.value}`
    const defaultDate = document.getElementById("event-date");
    console.log(dayOutToHtml)
    defaultDate.value = dayOutToHtml;

    console.log(timeSet.value)
  }



  // Flow du script

  initialisation(init)

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

  thisLunch(lunch)
