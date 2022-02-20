import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["chart", "sale"]
  connect() {
    this.chart = new Chartkick.LineChart(this.chartTarget, this.revenue, { suffix: " Kč", thousands: ",", xtitle: 'Date', ytitle: 'Sale' })
  }

  saleTargetConnected() {
    if (this.chart) {
      this.chart.updateData(this.data)
    }
  }

  saleTargetDisconnected() {
    if (this.chart) {
      this.chart.updateData(this.data)
    }
  }

  get revenue() {
    let data = {}

    this.saleTargets.forEach((report) => {
      data[report.dataset.date] = report.dataset.revenue
    })

    return data
  }
}
