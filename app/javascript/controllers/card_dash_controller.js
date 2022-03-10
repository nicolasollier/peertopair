import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "unfold", "chevron" ]
  connect() {
    console.log(this.chevronTarget);
  };

  unfold() {
    const everything = document.querySelectorAll(".fold");
    const somethings = this.unfoldTarget.classList;

    // quand l'action est triggered
    // sélectionner l'ensemble des éléments et les 'replier'
    // this.elements à déplier


    console.log(this.chevronTarget);
    this.chevronTarget.classList.toggle('rotate');

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
