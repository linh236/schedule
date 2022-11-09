import RequestController from "./request_controller"

// Connects to data-controller="attendance-logs"
export default class extends RequestController {

  connect() {
  }

  check_in_out({params: {url, status}}) {
    if (status) {
      this.sendGet({url: url, method: "Put"})
    } else {
      this.sendPost({url: url, method: "Post", body: []})
    }
  }
}
