import RequestService from "./request_service"
import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="events"
export default class extends RequestService {
  static targets = ["output"] 

  connect() {
  }

  addEvent({params: {url}}) {
    this.sendGet({url: url, method: "GET"})
  }

  leave(e) {
    // This is errror.
    this.outputTarget.innerHTML = "Application for leave" 
    
    const isLeave = e.target.checked;
    e.target.value = "true";
    if (isLeave) {
      // this.outputTarget.innerHTML =  "Helo"
    }
  }
}
