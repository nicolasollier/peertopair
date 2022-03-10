import dayjs from 'dayjs'

const eventCreation = () => {

  // récupération des valeurs des boutons

  const docVar = {
    when: document.querySelectorAll(".when"),
    month: document.querySelectorAll(".month"),
    week: document.querySelectorAll(".week"),
    day: document.querySelectorAll(".day"),
    lunch: document.querySelectorAll(".lunch"),
    rank: document.querySelectorAll(".rank"),
    deltaDay: 0,
    timeSet: ""
  }

  docVar.deltaDay = 4
  const init = document.querySelector("#create-event-start")
  const initDown = document.querySelector("#create-event-start-down")

    // Flow du script
  if (init) {
    docVar.deltaDay = initialisation(init, docVar)
  }

  if (initDown) {
    docVar.deltaDay = initialisation(initDown, docVar)
  }

  docVar.when.forEach((elt) => {
    thisWhen(elt, docVar)
  })

  docVar.month.forEach((elt) => {
    const monthOut = thisMonth(elt, docVar)
    docVar.day = monthOut.day
  })

  docVar.week.forEach((elt) => {
    const weekOut = thisWeek(elt, docVar)
    docVar.deltaDay = weekOut.deltaDay
  })

  docVar.day.forEach((elt) => {
    thisDay(elt, docVar)
  })

  docVar.lunch.forEach((elt) => {
    thisLunch(elt, docVar)
  })
}

// logique de chaque page

function initialisation(elt, docVar) {
  elt.addEventListener("click", (init) => {

  // initialisation des variables
  docVar.deltaDay = 0;
  const when = document.querySelectorAll(".when")
  const month = document.querySelectorAll(".month")
  const week = document.querySelectorAll(".week")
  const day = document.querySelectorAll(".day")
  const lunch = document.querySelectorAll(".lunch")
  const rank = document.querySelectorAll(".rank")

  // réinitialisation de l'affichage
  onOff(elt, day, when)
  onOff(elt, month, when)
  onOff(elt, week, when)
  onOff(elt, lunch, when)
  onOff(elt, rank, when)

  return docVar.deltaDay
  })

}

function thisWhen(elt, docVar) {

  elt.addEventListener("click", (event) => {

    const screen_1 = event.target.value

    switch (screen_1) {
      case 'today':
        onOff(elt,docVar.when, docVar.day);
        break;

      case 'week':
        onOff(elt,docVar.when, docVar.week)
        break;

      case 'month':
        onOff(elt,docVar.when, docVar.month)
        break;

    }
  })
}

function thisMonth(elt, docVar) {

  elt.addEventListener("click", (event) => {

    const screen_2 = elt.value

    switch (screen_2) {
      case 'week_2':
        docVar.deltaDay += 7
        break;

      case 'week_3':
        docVar.deltaDay += 14
        break;

      case 'week_4':
        docVar.deltaDay += 21
        break;
    }
    onOff(elt, docVar.month, docVar.week)
  })

  return docVar
}

function thisWeek(elt, docVar) {

  elt.addEventListener("click", (event) => {
    const today = new Date().getDay();
    const screen_3 = elt.value
    let delta = 0

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

    docVar.deltaDay += delta - today
    onOff(elt, docVar.week, docVar.day)
  })

  return docVar
}

function thisDay(elt, docVar) {

  elt.addEventListener("click", (event) => {
    const screen_4 = elt.value
    let duration = 0
    let timeSet = ""
    let eventType = ""

    switch (screen_4) {
      case 'coffee':
        onOff(elt, docVar.day, docVar.coffee)
        duration = 15
        timeSet = "11:00"
        eventType = 'Coffe'
        break;

      case 'lunch':
        onOff(elt, docVar.day, docVar.lunch)
        duration = 60
        timeSet = "13:00"
        eventType = 'Lunch'
        break;

      case 'drink':
        onOff(elt, docVar.day, docVar.drink)
        duration = 90
        timeSet = "19:00"
        eventType = 'Drink'
        break;

      default:
        break;
    }

    setUpTheDate(docVar.deltaDay, duration, timeSet, eventType);
  })
}

function thisLunch(elt, docVar) {
  const form = elt.querySelector("form");

  form.addEventListener("submit", (event) => {

    onOff(elt, docVar.lunch, docVar.rank)

  })
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

function setUpTheDate(deltaDay, eventDuration, timeSet, event_type) {

  // using the library dayjs
  // input vars

  // calculates the day
  let dayOut = addDays(new Date(), deltaDay)

  // display the day on the page
  const displayDay = document.getElementById("day-out")
  let options = {weekday: "long", year: "numeric", month: "long", day: "numeric"};
  const dayString = dayOut.toLocaleDateString("en-US", options);
  displayDay.insertAdjacentHTML("beforeend", dayString)

  // set the time from parameter timeSet
  const timeSetHours = timeSet.substring(0,2);
  const timeSetMinutes = timeSet.substring(3,5);
  dayOut = dayjs(dayOut).set('hour', timeSetHours)
  dayOut = dayjs(dayOut).set('minute', timeSetMinutes)

  // Send start_date to form
  const startDateToHtml = dayjs(dayOut).format('YYYY-MM-DDTHH:mm')
  const defaultStartDate = document.getElementById("event-start-date");
  defaultStartDate.value = startDateToHtml;

  // Send _date to form
  const endDateToHtml = dayjs(startDateToHtml).add(eventDuration, 'minute').format('YYYY-MM-DDTHH:mm')
  const defaultEndDate = document.getElementById("event-end-date");
  defaultEndDate.value = endDateToHtml;

  // Send event_type
  const eventTypeToHtml = document.getElementById("event-type");
  eventTypeToHtml.value = event_type;

  // Send event_format
  const eventFormatToHtml = document.getElementById("event-format");
  eventFormatToHtml.value = "Office";
}

export { eventCreation }
