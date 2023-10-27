import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["state"]

  updateState() {
    console.log(this.stateTarget.value)
  }
}
