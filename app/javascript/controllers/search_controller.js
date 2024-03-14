import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "input", "list", "startdate", "enddate"]
  update(event) {
    event.preventDefault()
    if(this.inputTarget.value !== '' || this.startdateTarget.value !== '' && this.enddateTarget.value !== '') {

      const url = `${this.formTarget.action}?query=${this.inputTarget.value}&startdate=${this.startdateTarget.value}&enddate=${this.enddateTarget.value}`
      fetch(url, {headers: {"Accept": "text/plain"}})
        .then(response => response.text())
        .then((data) => {
          this.listTarget.innerHTML = data
        })
    } else {
      this.listTarget.innerHTML = ''
    }
}
}
