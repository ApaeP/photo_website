import { Controller } from "stimulus"
import Swiper from 'swiper/bundle'

export default class extends Controller {
  static targets = ["container", "setHeight", "images"]

  connect() {
    this.init()
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

  update() {
    this.imagesTargets.forEach((image) => {
      image.removeAttribute('style')
    })
    this.instance.update()
  }

  get config() {
    let base = {
      watchOverflow: true,
      watchSlidesProgress: true,
      breakpoints: {
        640: {},
        768: {},
        1024: {},
        1280: {}
      },
      effect: 'fade',
      loop: true,
      autoplay: {
        delay: 2500,
        disableOnInteraction: false
      },
      autoplay: {
        delay: this.data.get('autoplay'),
        disableOnInteraction: true
      },
      watchOverflow: true,
      preloadImages: false,
      lazy: true
    }
    return base
  }

}
