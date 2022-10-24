import RequestService from "./request_service"

// Connects to data-controller="attendance-logs"
export default class extends RequestService {

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
