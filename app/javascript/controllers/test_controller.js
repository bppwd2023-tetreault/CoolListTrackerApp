import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "words", "output" ]

  greet() {
    this.outputTarget.innerHTML += 
    `<p> ${this.wordsTarget.value}</p>`
  }

  clear() {
    this.outputTarget.innerHTML = ""
  }
}