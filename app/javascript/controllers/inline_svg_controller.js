import { Controller } from "stimulus"

export default class extends Controller {

  connect() {
    this.addClasses()
  }

  addClasses() {
    var klasses = this.element.dataset.svgClass.replaceAll(/\s+/g, " ").split(' ')
    klasses.forEach((klass) => {
      this.element.children[0].classList.add(klass)
    })
  }

}
