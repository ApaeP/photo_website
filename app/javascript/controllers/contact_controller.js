import { Controller } from "stimulus"
import Rails from "@rails/ujs"
import Swal from 'sweetalert2'

export default class extends Controller {
  static targets = ["modal", "links"]

  connect() { }

  toggle() {
    if (this.modalTarget.classList.contains('hidden')) {
      this.display()
    } else {
      this.hide()
    }
  }

  display() {
    this.modalTarget.classList.remove('hidden')
    this.modalTarget.classList.remove('disappear-without-translate')
    this.modalTarget.classList.add('appear-without-translate')
  }

  hide() {
    this.modalTarget.classList.remove('appear-without-translate')
    this.modalTarget.classList.add('disappear-without-translate')
    setTimeout(() => {
      this.modalTarget.classList.add('hidden')
    }, 1000)
  }

  submit(event) {
    event.preventDefault()
    event.stopPropagation()

    const url = event.target.action
    const formData = new FormData(event.target)

    Rails.ajax({
      url: url,
      type: 'post',
      data: formData,
      dataType: 'json',
      success: (data) => {
        if (data.errors.length > 0) {
          console.log(data)
        } else {
          console.log(data)
        }
      },
      error: function(data) {
        console.log(data)
      }
    })
  }

}
