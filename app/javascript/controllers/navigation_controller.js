import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["body", "links"]

  connect() {
    // this._appendPreloadLinks()
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
        this.bodyTarget.outerHTML = html
        this.bodyTarget.classList.add('fade-in')
      })
  }

  _setCurrentUrl(url) {
    window.history.pushState('', '', url);
  }

  // useless?
  // _appendPreloadLinks() {
  //   this.linksTargets.forEach((stimulus_link) => {
  //     const head = document.querySelector('head')
  //     head.append(
  //       `<link
  //         href="${stimulus_link.dataset.url}"
  //         rel="preload"
  //         crossorigin="anonymous"
  //       />`
  //     )
  //   })
  // }
}
