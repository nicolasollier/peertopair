import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "unfold" ]
  connect() {
    console.log("hello from card controller")
  };

  unfold() {
    const everything = document.querySelectorAll(".fold");
    const somethings = this.unfoldTarget.classList;

    if (somethings.contains("hide")) {
      everything.forEach((item) => {
        item.classList.add("hide");
      })
      this.unfoldTarget.classList.remove("hide");

    } else {

      this.unfoldTarget.classList.add("hide");

    }
  }

  coucou() {
    console.log('coucou')
    event.stopPropagation();
    event.preventDefault();
  }

}