import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["state"]

  updateState() {
    this.stateTarget.closest("form").submit()
  }
}
