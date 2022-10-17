import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="event-modal"
export default class extends Controller {
  static targets = ["start", "end"];
  connect() {
  }


  // showDate(event) {
  //   event.preventDefault();
  //   this._date = event.detail.date.date;
  //   this._isShowDate = true;
  // }
}
