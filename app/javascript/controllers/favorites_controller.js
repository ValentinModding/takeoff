import { csrfToken } from "@rails/ujs"
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "favoris", "link" ]
  connect() {
  }

  favorise() {
    const url = `${this.linkTarget}/toggle`
    fetch(url,  {headers: { "Accept": "text/plain", "X-CSRF-Token": csrfToken() }, method: "POST" })
      .then(response => response.text())
      .then((data) => {
        this.favorisTarget.outerHTML = data
      })
  }
}
