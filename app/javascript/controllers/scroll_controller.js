import { Controller } from "stimulus"

export default class extends Controller {
  static targets = []

  connect() {}

  scroll(e) {
    this.element.scrollLeft += e.deltaY;
  }
}
