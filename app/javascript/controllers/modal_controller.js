import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["modal", "element"]

  connect() {
    document.addEventListener('keydown', (e) => {
      if (this.isActive) {
        if (e.key === 'Escape' || e.keyCode == 32) {
          this.hide()
        } else if (e.key === "ArrowRight") {
          console.log('right')
          this.next()
        } else if (e.key === "ArrowLeft") {
          console.log('left')
          this.previous()
        }
      }
    })
  }

  display(event) {
    this.elementTargets.forEach(() => {this._clean})
    this.isActive = true
    this._setCurrentPhoto(parseInt(event.currentTarget.dataset.id, 10))
    this.modalTarget.classList.remove('hidden')
    this.modalTarget.classList.add('appear-from-top')
    this._currentPhoto().classList.add('appear')
  }

  hide() {
    this.isActive = false
    this.modalTarget.classList.remove('appear-from-top')
    this.modalTarget.classList.add('disappear-to-top')
    setTimeout(() => {
      this._clean(this.modalTarget)
      this.elementTargets.forEach((el) => {
        this._clean(el)
        el.style.transform = 'translate(100%, 0)';
      })
      this.modalTarget.classList.add('hidden')
    }, 1000)
  }

  next() {
    this._clean(this.currentPhoto)
    this.currentPhoto.classList.add('disappear-to-left')
    this._clean(this.nextPhoto)
    this.nextPhoto.classList.add('appear-from-right')
    this._setCurrentPhoto(this.nextPhotoId)
  }

  previous() {
    this._clean(this.currentPhoto)
    this.currentPhoto.classList.add('disappear-to-right')
    this._clean(this.previousPhoto)
    this.previousPhoto.classList.add('appear-from-left')
    this._setCurrentPhoto(this.previousPhotoId)
  }

  _setCurrentPhoto(id) {
    this.currentPhotoId = id
    this.currentPhoto = this.elementTargets[this.currentPhotoId]
    if (this.currentPhotoId + 1 === this.elementTargets.length) {
      this.nextPhotoId = 0
      this.previousPhotoId = this.currentPhotoId - 1
    } else if (this.currentPhotoId === 0) {
      this.nextPhotoId = this.currentPhotoId + 1
      this.previousPhotoId = this.elementTargets.length - 1
    } else {
      this.nextPhotoId = this.currentPhotoId + 1
      this.previousPhotoId = this.currentPhotoId - 1
    }
    this.nextPhoto = this.elementTargets[this.nextPhotoId]
    this.previousPhoto = this.elementTargets[this.previousPhotoId]
  }

  _currentPhoto() {
    return this.elementTargets[this.currentPhotoId]
  }

  _clean(element) {
    element.classList.remove('appear','appear-from-top', 'disappear-to-top', 'disappear-to-right', 'appear-from-right', 'appear-from-left', 'disappear-to-left')
    // element.classList.add('hidden')
  }

}
