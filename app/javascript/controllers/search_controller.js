import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "input", "list"]

  update() {
    if (this.listTarget.value == '') {
      this.listTarget.innerHTML = ''
    } else {
      const url = `${this.formTarget.action}?query=${this.inputTarget.value}`
      fetch(url, {headers: {"Accept": "text/plain"}})
        .then(response => response.text())
        .then((data) => {
          this.listTarget.innerHTML = data
        })
    }
  }
}
