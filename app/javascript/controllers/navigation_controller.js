import { Controller } from "stimulus"
import Rails from "@rails/ujs"
import Swal from 'sweetalert2'

export default class extends Controller {
  static targets = ["body", "links"]

  connect() { }

  visit(event) {
    const body = this.bodyTarget
    const url = event.currentTarget.dataset.url
    if (window.location.href === `${window.location.href.match(/^.+\/\/[^\/]+/)[0]}${url}`) { return }
    this._fadeOut(body)
    setTimeout(() => {
      body.innerHTML = ''
      this._fetchNextPage(url)
    }, 500);
  }

  _fadeOut(element) {
    if (element.classList.contains('fade-in')) {
      element.classList.remove('fade-in')
      element.classList.add('fade-out')
    } else {
      element.classList.add('fade-out')
    }
  }

  _fetchNextPage(url) {
    const nextUrl = `${window.location.href.match(/^.+\/\/[^\/]+/)[0]}${url}`
    // document.title(TODO)
    fetch(nextUrl)
      .then(data => data.text())
      .then((html) => {
        this._setCurrentUrl(url)

        var el = document.createElement('html')
        el.innerHTML = html
        const newBody = el.querySelector('#body').outerHTML

        this.bodyTarget.outerHTML = newBody
        this.bodyTarget.classList.add('fade-in')
      }).catch(function(error) {
        window.railsError = error
        Swal.fire({
          title: '#404',
          text: `This link seems to be broken... ERROR: ${error}`,
          icon: 'question',
          confirmButtonText: 'Return to homepage'
        }).then(function() {
          window.location = `${window.location.href.match(/^.+\/\/[^\/]+/)[0]}/`
        })
    });
  }

  _setCurrentUrl(url) {
    window.history.pushState('', '', url);
  }
}
