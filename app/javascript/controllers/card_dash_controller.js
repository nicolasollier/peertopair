import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "unfold" ]
  connect() {
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

  cancel() {
    console.log('coucou')
    event.stopPropagation();
    event.preventDefault();
  }

}
