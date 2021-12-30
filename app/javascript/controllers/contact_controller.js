import { Controller } from "stimulus"
import Rails from "@rails/ujs"
import Swal from 'sweetalert2'

export default class extends Controller {
  static targets = [ "modal", "form", 'recaptchaErrorNotice' ]

  connect() {
    document.addEventListener('keydown', (e) => {
      if (e.key === 'Escape') {
        this.hide()
      }
    })
  }

  toggle() {
    if (this.modalTarget.classList.contains('hidden')) {
      this.display()
    } else {
      this.hide()
    }
  }

  display() {
    this.modalTarget.classList.remove('hidden', 'disappear-without-translate')
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

    this._removeElement(this.formTarget)
    this._displayWaitingNotice()

    this._send(url, formData)
  }

  _send(url, formData) {
    const originalForm = this.modalTarget.innerHTML
    Rails.ajax({
      url: url,
      type: 'post',
      data: formData,
      dataType: 'json',
      success: (data) => {
        const newHtml = this._loadNewFormHTML(data)
        if (data.success && data.recaptcha) {
          this._onSuccess(newHtml)
        } else {
          this._onFailure(newHtml)
          if (!data.recaptcha) {
            this.recaptchaErrorNoticeTarget.classList.remove('hidden')
          }
        }
      },
      error: function(data) {
        Swal.fire({
          title: 'Erreur',
          text: `Erreur à l'envoi du message, veuillez réessayer`,
          confirmButtonText: 'Continuer'
        }).then(function() {
          // TODO
        })
      }
    })
  }

  _loadNewFormHTML(data) {
    this.formTarget.classList.remove('appear-without-translate')
    this.formTarget.classList.add('disappear-without-translate')
    const html = document.createElement('html')
    html.innerHTML = data.html
    html.querySelector('form').classList.add('hidden')
    return html.querySelector('#contact-modal').innerHTML
  }

  _onSuccess(newHtml) {
    this._displaySuccessNotice()

    setTimeout(() => {
      this._removeElement(this.formTarget)
    }, 3500)

    setTimeout(() => {
      this.modalTarget.innerHTML = newHtml
      this._emptyInputs()
      this._displayElement(this.formTarget)
      this._resetRecaptcha()
    }, 5000)
  }

  _onFailure(newHtml) {
    this.modalTarget.innerHTML = newHtml
    this._displayElement(this.formTarget)
    this._resetRecaptcha()
  }

  _resetRecaptcha() {
    grecaptcha.execute(
      '6Ldja9gdAAAAAEpdC_KVZ43ARYtDWyObZGP1kr4L', {
        action: 'contact'})
      .then((token) => {
        if (this.modalTarget.querySelector('input[name="recaptcha_token"]')) {
          this.modalTarget.querySelector('input[name="recaptcha_token"]').value = token
        }
      })
  }

  _displayElement(element) {
    element.classList.remove('hidden', 'disappear-without-translate')
    element.classList.add('appear-without-translate')
  }

  _removeElement(element) {
    element.classList.remove('appear-without-translate')
    element.classList.add('disappear-without-translate')
    setTimeout(() => {
      element.classList.add('hidden')
    }, 1000)
  }

  _emptyInputs() {
    this.modalTarget.querySelector('#contact_email').value = ''
    this.modalTarget.querySelector('#contact_content').value = ''
  }

  _displayWaitingNotice() {
    const waitingNotice = document.createElement('div')
    waitingNotice.setAttribute('id', 'waiting-notice')
    waitingNotice.setAttribute('data-contact-target', 'form')
    waitingNotice.innerHTML = '<div class="lds-roller"><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div></div>'
    waitingNotice.classList.add('hidden', 'h-2/6')
    this.modalTarget.innerHTML = waitingNotice.outerHTML
    this._displayElement(this.formTarget)
  }

  _displaySuccessNotice() {
    const successElement = document.createElement('div')
    successElement.setAttribute('id', 'success-notice')
    successElement.setAttribute('data-contact-target', 'form')
    successElement.innerText = 'Message envoyé'
    successElement.classList.add('hidden', 'text-2xl', 'uppercase', 'font-extralight',  'tracking-wider')
    this.modalTarget.innerHTML = successElement.outerHTML
    this._displayElement(this.formTarget)
  }

}
