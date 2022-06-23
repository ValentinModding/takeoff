import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["swipeup", "cardcontainer"]

  connect() {
  }

  swipeup() {
    if (this.cardcontainerTarget.style.bottom === "" || this.cardcontainerTarget.style.bottom === "-38%") {
      this.cardcontainerTarget.style.bottom = "0";
      this.swipeupTarget.style.width = "60px";
    } else {
      this.cardcontainerTarget.style.bottom = "-38%";
      this.swipeupTarget.style.width = "200px";
    }

  }
}
