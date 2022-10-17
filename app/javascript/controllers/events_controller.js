import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="events"
export default class extends Controller {
  static targets = ["start", "end"] 
  
  connect() {
  }

  addEvent({params: {url}}) {
    // const event = this.dispatch("move", {detail: { date: { date } } })
    // if (event.defaultPrevented) return

    fetch(`${url}`, {
      headers: {
        Accept: "text/vnd.turbo-stream.html"
      }
    })
    .then(r => r.text())
    .then(html => Turbo.renderStreamMessage(html))
  }
}
