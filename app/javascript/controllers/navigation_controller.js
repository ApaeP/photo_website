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
    }, 750);
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

  _fadeIn(element) {
    if (element.classList.contains('fade-out')) {
      element.classList.remove('fade-out')
      element.classList.add('fade-in')
    } else {
      element.classList.add('fade-in')
    }
  }

  _fetchNextPage(url) {
    fetch(`${window.location.href.match(/^.+\/\/[^\/]+/)[0]}${url}`)
      .then(data => data.text())
      .then((html) => {
        this.bodyTarget.innerHTML = html

      }).then(
          this._fadeIn(this.bodyTarget)
        )
  }

}
