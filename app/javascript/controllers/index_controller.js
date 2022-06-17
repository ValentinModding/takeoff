import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["swipeup", "cardcontainer"]

  connect() {
    console.log("Index Controller Ok")
  }

  swipeup() {
    if (this.cardcontainerTarget.style.bottom === "" || this.cardcontainerTarget.style.bottom === "-43%") {
      this.cardcontainerTarget.style.bottom = "0";
      this.swipeupTarget.style.width = "60px";
    } else {
      this.cardcontainerTarget.style.bottom = "-43%";
      this.swipeupTarget.style.width = "200px";
    }

  }
}
