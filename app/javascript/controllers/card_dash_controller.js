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

    // console.log(this.chevronTarget);
    this.chevronTarget.classList.toggle('rotate');

    if (somethings.contains("hide")) {
      // show
      console.log('show')
      everything.forEach((item) => {
        item.classList.add("hide");
      })
      this.unfoldTarget.classList.remove("hide");
      this.chevronTarget.closest('div').style.transform = 'translate(0px, 25px)';
    } else {
      console.log('hide')
      // hide
      this.chevronTarget.style.transform = '';
      this.unfoldTarget.closest('div').classList.add("hide");
    }
  }

  cancel() {
    console.log('coucou')
    event.stopPropagation();
    event.preventDefault();
  }

}
