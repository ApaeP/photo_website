import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["wrapper", "elements"]

  connect() {
    const arr = this._splitIntoChunks(this.elementsTargets, 3)
    this._createHTMLColumns(arr)
  }

  _createHTMLColumns(array) {
    array.forEach((col) => {
      let colDiv = document.createElement('div')
      colDiv.classList.add(`w-1/${array.length}`)
      col.forEach((element) => {
        colDiv.appendChild(element)
      })
      this.wrapperTarget.appendChild(colDiv)
    })
  }

  _splitIntoChunks(array, n) {
    let result = []
    for (let i = n; i > 0; i--) {
      result.push(array.splice(0, Math.ceil(array.length / i)))
    }
    return result
  }

}
