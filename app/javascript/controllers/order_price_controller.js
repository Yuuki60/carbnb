import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="order-price"
export default class extends Controller {
  static targets = ["enddate", "totalprice"]
  static values = {
    carprice: Number
  }
  test(event){
    let start_date = event.target.value
    let end_date = this.enddateTarget.value
    if (end_date) {
      start_date = new Date(start_date)
      end_date = new Date(end_date)
      const daysnumber = (end_date - start_date) / 1000 / 60 / 60 / 24 + 1
      const price_per_day = this.carpriceValue
      const result = price_per_day*daysnumber
      this.totalpriceTarget.innerHTML = `
        <div class="border mx-5 border-danger p-3">
          <p>$${price_per_day} x ${daysnumber} days</p>
          <hr />
          <p>total: $${result}</p>
        </div>
      `
    }
  }
}
