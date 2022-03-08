import dayjs from 'dayjs'

const eventCreation = () => {

  // récupération des valeurs des boutons

  const init = document.querySelector("#create-event-start")
  const when = document.querySelectorAll(".when")
  const month = document.querySelectorAll(".month")
  const week = document.querySelectorAll(".week")
  const day = document.querySelectorAll(".day")
  const lunch = document.querySelectorAll(".lunch")
  const rank = document.querySelectorAll(".rank")
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
      onOff(elt, rank, when)

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
        let duration = 0
        let timeSet = ""
        let eventType = ""

        switch (screen_4) {
          case 'coffee':
            onOff(elt,day, coffee)
            duration = 15
            timeSet = "11:00"
            eventType = 'Coffe'
            break;

          case 'lunch':
            onOff(elt,day, lunch)
            duration = 60
            timeSet = "13:00"
            eventType = 'Lunch'
            break;

          case 'drink':
            onOff(elt,day, drink)
            duration = 90
            timeSet = "19:00"
            eventType = 'Drink'
            break;

          default:
            break;
        }

        setUpTheDate(deltaDay, duration, timeSet, eventType);
      })
    }

    function thisLunch(elt) {
      const form = elt.querySelector("form");

      form.addEventListener("submit", (event) => {

        onOff(elt,lunch, rank)

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
      console.log(dayOut);

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

      console.log(timeSet)
      console.log(timeSetHours)
      console.log(timeSetMinutes)
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

    lunch.forEach((elt) => {
      thisLunch(elt)
    })


}

export { eventCreation }
