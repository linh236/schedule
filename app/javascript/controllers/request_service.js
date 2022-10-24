import { Controller } from "@hotwired/stimulus"

export default class RequestService extends Controller {

  constructor() {
    super()
  }

  sendGet({url: url, method: method}) {
    fetch(url, {
      method: method,
      headers: {
        'X-CSRF-Token': document.querySelector(
          'meta[name="csrf-token"]'
        ).content,
        Accept: "text/vnd.turbo-stream.html"
      },
    })
    .then(r => r.text())
    .then(html => Turbo.renderStreamMessage(html))
  }
  
  sendPost({url: url, method: method, body: body}) {
    fetch(url, {
      method: method,
      headers: {
        'X-CSRF-Token': document.querySelector(
          'meta[name="csrf-token"]'
        ).content,
        Accept: "text/vnd.turbo-stream.html"
      },
      body: body,
    })
    .then(r => r.text())
    .then(html => Turbo.renderStreamMessage(html))
  }
}