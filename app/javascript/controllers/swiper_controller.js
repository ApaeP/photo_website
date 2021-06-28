import { Controller } from "stimulus"
import Swiper from 'swiper'

export default class extends Controller {
  static targets = ["container", "setHeight", "images", "buttonPrev", "buttonNext", "name"]

  connect() {
    this.init()
    this._disableContextMenuOn(this.imagesTargets)
    this._keyNav()
    this._displayName()
  }

  init() {
    this.setContentHeight()
    this.instance = new Swiper(this.containerTarget, this.config)
  }

  setContentHeight() {
    let height = this.element.offsetHeight
    this.imagesTargets.forEach((image) => {
      image.style.maxHeight = `${height}px`
    })
  }

  nextSlide(event) {
    event.preventDefault()
    this.instance.slideNext(parseInt(this.data.get('speed'), 10) || 750, true)
    this._displayName()
  }

  prevSlide(event) {
    event.preventDefault()
    this.instance.slidePrev(parseInt(this.data.get('speed'), 10) || 750, true)
    this._displayName()
  }

  get config() {
    let base = {
      loop: true,
      speed: parseInt(this.data.get('speed'), 10) || 750,
      effect: 'fade',
      fadeEffect: {
        crossFade: true
      },
      preloadImages: false,
      lazy: true,
      watchOverflow: true
    }

    if (this.data.has('autoplay')) {
      base.autoplay = {
        delay: parseInt(this.data.get('autoplay'), 10),
        disableOnInteraction: true
      }
    }

    return base
  }

  _keyNav() {
    if (this.hasButtonPrevTarget) {
      document.addEventListener('keydown', (event) => {
        if (event.key === 'ArrowLeft') {
          this.prevSlide(event)
        } else if (event.key === 'ArrowRight') {
          this.nextSlide(event)
        }
      })
    }
  }

  _displayName() {
    if (this.instance.slides.length > 0) {
      let name = this.instance.slides[this.instance.activeIndex].dataset.name
      this.hasNameTarget && (this.nameTarget.innerText = this.hasNameTarget ? name : '')
    }
  }

  _disableContextMenuOn(elements) {
    elements.forEach((e) => {
      e.addEventListener('contextmenu', event => event.preventDefault())
    })
  }

}
