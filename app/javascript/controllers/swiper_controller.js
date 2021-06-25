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
      speed: 1500,
      effect: 'fade',
      loop: true,
      autoplay: {
        delay: this.data.get('autoplay'),
        disableOnInteraction: true
      },
      preloadImages: false,
      lazy: true,
    }
    return base
  }

}
