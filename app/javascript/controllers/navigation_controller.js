import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["body", "links"]

  connect() {
    this._appendPreloadLinks()
  }

  visit(event) {
    const body = this.bodyTarget
    const url = event.currentTarget.dataset.url

    this._fadeOut(body)
    setTimeout(() => {
      body.innerHTML = ''
      this._fetchNextPage(url)
    }, 500);
  }

  // useless?
  _appendPreloadLinks() {
    this.linksTargets.forEach((stimulus_link) => {
      const head = document.querySelector('head')
      head.append(
        `<link
          href="${stimulus_link.dataset.url}"
          rel="preload"
          crossorigin="anonymous"
        />`
      )
    })
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
    fetch(`${window.location.href.match(/^.+\/\/[^\/]+/)[0]}${url}`)
      .then(data => data.text())
      .then((html) => {
        this.bodyTarget.outerHTML = html
        this.bodyTarget.classList.add('fade-in')
      })
  }

}
