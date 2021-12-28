import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "phoneMenu", "togglePhoneMenuButton" ]

  connect() {
    this.hidePhoneMenu()
  }

  togglePhoneMenu() {
    if (this.phoneMenuTarget.classList.contains('hidden')) {
      this.displayPhoneMenu()
    } else {
      this.hidePhoneMenu()
    }
  }

  displayPhoneMenu() {
    this.phoneMenuTarget.classList.remove('hidden', 'disappear-without-translate')
    this.phoneMenuTarget.classList.add('appear-without-translate')
  }

  hidePhoneMenu() {
    this.phoneMenuTarget.classList.remove('appear-without-translate')
    this.phoneMenuTarget.classList.add('disappear-without-translate')
    this.togglePhoneMenuButtonTarget.checked = false
    setTimeout(() => {
      this.phoneMenuTarget.classList.add('hidden')
    }, 500)
  }
}
