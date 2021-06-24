import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["main"]

  connect() {
    this.fadeIn()
  }

  fadeIn() {
    this.mainTarget.classList.add('loaded')
  }

  fadeOut(event) {
    const element = event.currentTarget

    this.mainTarget.classList.add('load-out')
    setTimeout(() => {
      this.mainTarget.classList.add('opacity-0')
      Turbolinks.visit(element.dataset.url)
    }, 750);

  }
}
